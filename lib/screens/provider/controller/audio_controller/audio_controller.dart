import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecordedAudio {
  final String path;
  final Duration duration;
  final DateTime recordedAt;
  double progress;
  bool isPlaying;

  RecordedAudio({
    required this.path,
    required this.duration,
    required this.recordedAt,
    this.progress = 0,
    this.isPlaying = false,
  });

  RecordedAudio copyWith({
    double? progress,
    bool? isPlaying,
  }) {
    return RecordedAudio(
      path: path,
      duration: duration,
      recordedAt: recordedAt,
      progress: progress ?? this.progress,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

// Controller State
class AudioState {
  final bool isRecording;
  final Duration recordDuration;
  final List<RecordedAudio> audios;
  final double dialogProgress;
  final DateTime? recordedAt;
  final int? currentPlayingIndex;

  AudioState({
    this.isRecording = false,
    this.recordDuration = Duration.zero,
    this.audios = const [],
    this.dialogProgress = 0,
    this.recordedAt,
    this.currentPlayingIndex,
  });

  AudioState copyWith({
    bool? isRecording,
    Duration? recordDuration,
    List<RecordedAudio>? audios,
    double? dialogProgress,
    DateTime? recordedAt,
    int? currentPlayingIndex,
  }) {
    return AudioState(
      isRecording: isRecording ?? this.isRecording,
      recordDuration: recordDuration ?? this.recordDuration,
      audios: audios ?? this.audios,
      dialogProgress: dialogProgress ?? this.dialogProgress,
      recordedAt: recordedAt ?? this.recordedAt,
      currentPlayingIndex: currentPlayingIndex ?? this.currentPlayingIndex,
    );
  }
}

// Riverpod provider
final audioProvider = NotifierProvider<AudioController, AudioState>(AudioController.new,);

class AudioController extends Notifier<AudioState> {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();
  Timer? _timer;
  String? _path;
  int? _currentPlayingIndex;

  @override
  AudioState build() {
    // Cleanup when provider is disposed
    ref.onDispose(() {
      _recorder.dispose();
      _player.dispose();
      _timer?.cancel();
    });

    return AudioState();
  }

  /// RECORD
  Future<void> startRecording() async {
    if (!await _recorder.hasPermission()) return;

    final dir = await getTemporaryDirectory();
    _path = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.m4a';

    await _recorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: _path!,
    );

    state = state.copyWith(isRecording: true, recordDuration: Duration.zero);

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      state = state.copyWith(
        recordDuration: state.recordDuration + const Duration(seconds: 1),
      );
    });
  }

  Future<void> stopRecording() async {
    await _recorder.stop();
    _timer?.cancel();

    state = state.copyWith(
      isRecording: false,
      recordedAt: DateTime.now(),
    );
  }

  void saveAudio() {
    if (_path == null || state.recordedAt == null) return;

    final audio = RecordedAudio(
      path: _path!,
      duration: state.recordDuration,
      recordedAt: state.recordedAt!,
    );

    state = state.copyWith(
      audios: [...state.audios, audio],
      recordDuration: Duration.zero,
      dialogProgress: 0,
    );

    _path = null;
  }

  /// ▶ PLAY / PAUSE
  Future<void> playPauseAudio(int index) async {
    final audio = state.audios[index];

    if (_currentPlayingIndex == index && audio.isPlaying) {
      await _player.pause();
      _updateAudioState(index, isPlaying: false);
    } else {
      if (_currentPlayingIndex != null &&
          _currentPlayingIndex != index) {
        _updateAudioState(_currentPlayingIndex!, isPlaying: false);
      }

      await _player.setFilePath(audio.path);
      await _player.play();

      _updateAudioState(index, isPlaying: true);
      _currentPlayingIndex = index;

      // Listen to position updates
      _player.positionStream.listen((position) {
        final total = audio.duration.inMilliseconds;
        if (total > 0) {
          final progress = position.inMilliseconds / total;
          _updateAudioState(index, progress: progress);
        }
      });

      _player.playerStateStream.listen((statePlayer) {
        if (statePlayer.processingState == ProcessingState.completed) {
          _updateAudioState(index, isPlaying: false, progress: 0);
          _currentPlayingIndex = null;
        }
      });
    }
  }

  /// ⏩ SEEK
  void seekAudio(int index, double value) {
    if (_currentPlayingIndex != index) return;

    final audio = state.audios[index];
    final seekTo = Duration(
      milliseconds: (audio.duration.inMilliseconds * value).toInt(),
    );
    _player.seek(seekTo);

    _updateAudioState(index, progress: value);
  }

  /// DELETE
  void deleteAudio(int index) {
    final list = [...state.audios]..removeAt(index);
    state = state.copyWith(audios: list);

    if (_currentPlayingIndex == index) {
      _player.stop();
      _currentPlayingIndex = null;
    }
  }

  /// HELPER: update audio properties
  void _updateAudioState(int index, {double? progress, bool? isPlaying}) {
    final list = [...state.audios];
    final audio = list[index];
    list[index] = audio.copyWith(
      progress: progress ?? audio.progress,
      isPlaying: isPlaying ?? audio.isPlaying,
    );
    state = state.copyWith(audios: list);
  }

  /// FORMAT TIME
  String formatDuration(Duration d) {
    return "${d.inMinutes.toString().padLeft(2, '0')}:"
        "${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  /// SLIDER (Dialog)
  void seek(double value) {
    final total = _player.duration ?? Duration.zero;
    _player.seek(Duration(milliseconds: (total.inMilliseconds * value).toInt()));
    state = state.copyWith(dialogProgress: value);
  }
}

