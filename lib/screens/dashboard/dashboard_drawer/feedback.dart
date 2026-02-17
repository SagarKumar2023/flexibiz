import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activites_upload_files/activities_photo_view_screen.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activites_upload_files/activities_video_play_screen.dart';
import 'package:flexibiz/screens/provider/controller/audio_controller/audio_controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FeedbackInDrawer extends ConsumerStatefulWidget {
  const FeedbackInDrawer({super.key});

  @override
  ConsumerState<FeedbackInDrawer> createState() => _FeedbackInDrawerState();
}

class _FeedbackInDrawerState extends ConsumerState<FeedbackInDrawer> {

  double audioProgress = 0.0;

  String whereToUploadImageSelectValue = 'PRODUCT IMAGE';

  final List<String> whereToUploadImageCategoryList = [
    'PRODUCT IMAGE',
    'PRICE LIST',
    'LITERATURE',
    'COMPETITOR',
    'TRADESHOW',
    'MISC'
  ];

  final ImagePicker _picker = ImagePicker();
  List<File> selectedImages = [];
  List<File> selectedVideos = [];

  Future<void> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );

    if (image != null) {
      selectedImages.add(File(image.path));
      setState(() {});
    }
  }

  Future<void> pickImagesFromGallery() async {
    final List<XFile> images = await _picker.pickMultiImage(imageQuality: 70);

    if (images.isNotEmpty) {
      selectedImages.addAll(images.map((e) => File(e.path)));
      setState(() {});
    }
  }

  Future<void> pickVideoFromCamera() async {
    final XFile? video = await _picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(minutes: 5), // optional
    );

    if (video != null) {
      selectedVideos.add(File(video.path));
      setState(() {});
    }
  }

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "Feedback".toUpperCase(),
          textColor: ColorUtils.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.black.withOpacity(0.2),
                  isScrollControlled: true,
                  builder: (bottomSheetContext) {
                    return StatefulBuilder(
                      builder: (context, setModalState) {
                        return  Container(
                          margin: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFFFFFFF),
                                Color(0xFFF8F8FF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              /// HEADER
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FAFB),
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color:ColorUtils.white,width: 1.1),
                                        image: DecorationImage(
                                          image: AssetImage(ImagesUtils.chooseActivitiesIcon),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    TextWidget(
                                      text: "Attachment From",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      textColor: const Color(0xFF1D2939),
                                    ),
                                    const SizedBox(width: 35,height:35),

                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// PAGE VIEW
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.27,
                                  child: PageView(
                                    controller: _pageController,
                                    onPageChanged: (index) {
                                      setModalState(() {
                                        _currentPage = index;
                                      });
                                    },
                                    children: [

                                      /// PAGE 1
                                      SingleChildScrollView(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                BottomSheetActionTile(
                                                  iconImage: ImagesUtils.cameraIcon,
                                                  title: "Camera",
                                                  onTap: () {
                                                    pickImageFromCamera();
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                const SizedBox(width: 10),
                                                BottomSheetActionTile(
                                                  iconImage: ImagesUtils.videoIcon,
                                                  title: "Video",
                                                  onTap: () {
                                                    pickVideoFromCamera();
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                const SizedBox(width: 10),
                                                BottomSheetActionTile(
                                                  iconImage: ImagesUtils.audioIcon,
                                                  title: "Audio",
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Consumer(
                                                          builder: (context, ref, _) {
                                                            final audioState = ref.watch(
                                                              audioProvider,
                                                            );
                                                            final controller = ref.read(
                                                              audioProvider.notifier,
                                                            );

                                                            return Dialog(
                                                              backgroundColor:
                                                              Colors.transparent,
                                                              insetPadding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 20,
                                                              ),
                                                              child: Container(
                                                                height: 210,
                                                                margin: EdgeInsets.only(
                                                                  top: 17,
                                                                ),
                                                                padding: const EdgeInsets.all(
                                                                  16,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(12),
                                                                  gradient:
                                                                  const LinearGradient(
                                                                    begin:
                                                                    Alignment.topCenter,
                                                                    end: Alignment
                                                                        .bottomCenter,
                                                                    colors: [
                                                                      Color(0xFFFFFFFF),
                                                                      Color(0xFFF8F8FF),
                                                                    ],
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize.min,
                                                                  children: [
                                                                    const VerticalSpace(
                                                                      height: 10,
                                                                    ),
                                                                    TextWidget(
                                                                      text: 'My Recording',
                                                                      fontSize: 16,
                                                                      textAlign:
                                                                      TextAlign.center,
                                                                      textColor:
                                                                      ColorUtils.secondary,
                                                                      fontWeight:
                                                                      FontWeight.w700,
                                                                    ),
                                                                    const VerticalSpace(
                                                                      height: 10,
                                                                    ),

                                                                    // AUDIO SLIDER
                                                                    SliderTheme(
                                                                      data: SliderTheme.of(context).copyWith(
                                                                        trackHeight: 3,
                                                                        thumbShape:
                                                                        const RoundSliderThumbShape(
                                                                          enabledThumbRadius:
                                                                          6,
                                                                        ),
                                                                        overlayShape:
                                                                        const RoundSliderOverlayShape(
                                                                          overlayRadius: 12,
                                                                        ),
                                                                        activeTrackColor:
                                                                        ColorUtils.primary,
                                                                        inactiveTrackColor:
                                                                        ColorUtils.primary
                                                                            .withOpacity(
                                                                          0.2,
                                                                        ),
                                                                        thumbColor:
                                                                        ColorUtils.primary,
                                                                        overlayColor: ColorUtils
                                                                            .primary
                                                                            .withOpacity(0.15),
                                                                      ),
                                                                      child: Slider(
                                                                        min: 0,
                                                                        max: 1,
                                                                        value: audioState
                                                                            .dialogProgress,
                                                                        onChanged:
                                                                        audioState
                                                                            .isRecording
                                                                            ? null
                                                                            : (v) {
                                                                          // assuming dialogIndex is the index of the audio being played
                                                                          int
                                                                          dialogIndex =
                                                                              audioState
                                                                                  .audios
                                                                                  .length -
                                                                                  1; // last audio
                                                                          controller
                                                                              .seekAudio(
                                                                            dialogIndex,
                                                                            v,
                                                                          );
                                                                        },
                                                                      ),
                                                                      // child: Slider(
                                                                      //   min: 0,
                                                                      //   max: 1,
                                                                      //   value: audioState
                                                                      //       .dialogProgress,
                                                                      //   onChanged: audioState
                                                                      //       .isRecording
                                                                      //       ? null
                                                                      //       : (v) =>
                                                                      //       controller
                                                                      //           .seekAudio(dialogIndex,v),
                                                                      // ),
                                                                    ),
                                                                    const VerticalSpace(
                                                                      height: 10,
                                                                    ),

                                                                    // RECORD / STOP BUTTON & TIME
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets.symmetric(
                                                                        horizontal: 10,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                        children: [
                                                                          TextWidget(
                                                                            text: controller
                                                                                .formatDuration(
                                                                              audioState
                                                                                  .recordDuration,
                                                                            ),
                                                                            fontSize: 10,
                                                                            textColor: ColorUtils
                                                                                .black
                                                                                .withOpacity(
                                                                              0.8,
                                                                            ),
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              if (!audioState
                                                                                  .isRecording) {
                                                                                controller
                                                                                    .startRecording();
                                                                              } else {
                                                                                controller
                                                                                    .stopRecording();
                                                                              }
                                                                            },
                                                                            child: Icon(
                                                                              audioState
                                                                                  .isRecording
                                                                                  ? Icons
                                                                                  .stop_circle
                                                                                  : Icons.mic,
                                                                              size: 40,
                                                                              color: ColorUtils
                                                                                  .primary.withOpacity(0.7),
                                                                            ),
                                                                          ),
                                                                          TextWidget(
                                                                            text:
                                                                            audioState
                                                                                .recordedAt ==
                                                                                null
                                                                                ? '--:--'
                                                                                : DateFormat(
                                                                              'hh:mm a',
                                                                            ).format(
                                                                              audioState
                                                                                  .recordedAt!,
                                                                            ),
                                                                            fontSize: 10,
                                                                            textColor: ColorUtils
                                                                                .black
                                                                                .withOpacity(
                                                                              0.8,
                                                                            ),
                                                                            fontWeight:
                                                                            FontWeight.w600,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    const VerticalSpace(
                                                                      height: 15,
                                                                    ),

                                                                    // CANCEL / SAVE
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child: ButtonWidget(
                                                                            navigateTo: () {
                                                                              Navigator.pop(
                                                                                context,
                                                                              );
                                                                            },
                                                                            buttonName:
                                                                            'Cancel',
                                                                            borderRadius: 10,
                                                                            height: 40,
                                                                            buttonTextColor:
                                                                            ColorUtils
                                                                                .white,
                                                                            buttonColor:
                                                                            ColorUtils
                                                                                .primary,
                                                                          ),
                                                                        ),
                                                                        const HorizontalSpace(
                                                                          width: 8,
                                                                        ),
                                                                        Expanded(
                                                                          child: ButtonWidget(
                                                                            navigateTo: () {
                                                                              controller
                                                                                  .saveAudio();
                                                                              Navigator.pop(
                                                                                context,
                                                                              );
                                                                            },
                                                                            buttonName: 'Save',
                                                                            borderRadius: 10,
                                                                            height: 40,
                                                                            buttonTextColor:
                                                                            ColorUtils
                                                                                .white,
                                                                            buttonColor:
                                                                            ColorUtils
                                                                                .primary,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                BottomSheetActionTile(
                                                  iconImage: ImagesUtils.fileExplorerIcon,
                                                  title: "File Explorer",
                                                  onTap: () {
                                                    pickImagesFromGallery();
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                const SizedBox(width: 10),
                                                BottomSheetActionTile(
                                                  iconImage: ImagesUtils.cloudServerIcon,
                                                  title: "Server",
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(child: Container())
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
              // onTap: () {
              //   showModalBottomSheet(
              //     context: context,
              //     isScrollControlled: true,
              //     backgroundColor: Colors.transparent,
              //     builder: (context) {
              //       return Container(
              //         padding: const EdgeInsets.only(bottom: 10),
              //         decoration: const BoxDecoration(
              //           // color: Colors.white,
              //           borderRadius: BorderRadius.vertical(
              //             top: Radius.circular(16),
              //           ),
              //           gradient: LinearGradient(
              //             begin: Alignment.topCenter,
              //             end: Alignment.bottomCenter,
              //             colors: [Color(0xFFFFFFFF), Color(0xFFF8F8FF)],
              //             stops: [0.0, 1.0],
              //           ),
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           mainAxisSize: MainAxisSize.min,
              //           children: [
              //             Container(
              //               padding: const EdgeInsets.symmetric(
              //                 horizontal: 16,
              //                 vertical: 14,
              //               ),
              //               decoration: BoxDecoration(
              //                 // color: ColorUtils.primary,
              //                 borderRadius: const BorderRadius.vertical(
              //                   top: Radius.circular(12),
              //                 ),
              //               ),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Expanded(
              //                     child: TextWidget(
              //                       text: 'Attachment From',
              //                       fontSize: 16,
              //                       textColor: Colors.black,
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                   ),
              //                   GestureDetector(
              //                     onTap: () => Navigator.pop(context),
              //                     child: Container(
              //                       height: 25,
              //                       width: 25,
              //                       decoration: BoxDecoration(
              //                         shape: BoxShape.circle,
              //                         color: ColorUtils.red,
              //                         border: Border.all(
              //                           color: ColorUtils.red.withOpacity(0.3),
              //                           width: 1,
              //                         ),
              //                       ),
              //                       child: Icon(
              //                         Icons.close,
              //                         size: 20,
              //                         color: ColorUtils.white,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             VerticalSpace(height: 5),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 15, right: 15),
              //               child: Column(
              //                 children: [
              //                   _threeDotInsideItem(
              //                     icon: ImagesUtils.cameraIcon,
              //                     title: "Camera",
              //                     onTap: () {
              //                       pickImageFromCamera();
              //                       Navigator.pop(context);
              //                     },
              //                   ),
              //                   _threeDotInsideItem(
              //                     icon: ImagesUtils.videoIcon,
              //                     title: "Video",
              //                     onTap: () {
              //                       pickVideoFromCamera();
              //                       Navigator.pop(context);
              //                     },
              //                   ),
              //                   _threeDotInsideItem(
              //                     icon: ImagesUtils.audioIcon,
              //                     title: "Audio",
              //                     onTap: () {
              //                       showDialog(
              //                         context: context,
              //                         builder: (context) {
              //                           return Consumer(
              //                             builder: (context, ref, _) {
              //                               final audioState = ref.watch(
              //                                 audioProvider,
              //                               );
              //                               final controller = ref.read(
              //                                 audioProvider.notifier,
              //                               );
              //
              //                               return Dialog(
              //                                 backgroundColor:
              //                                 Colors.transparent,
              //                                 insetPadding:
              //                                 const EdgeInsets.symmetric(
              //                                   horizontal: 20,
              //                                 ),
              //                                 child: Container(
              //                                   height: 210,
              //                                   margin: EdgeInsets.only(
              //                                     top: 17,
              //                                   ),
              //                                   padding: const EdgeInsets.all(
              //                                     16,
              //                                   ),
              //                                   decoration: BoxDecoration(
              //                                     borderRadius:
              //                                     BorderRadius.circular(12),
              //                                     gradient:
              //                                     const LinearGradient(
              //                                       begin:
              //                                       Alignment.topCenter,
              //                                       end: Alignment
              //                                           .bottomCenter,
              //                                       colors: [
              //                                         Color(0xFFFFFFFF),
              //                                         Color(0xFFF8F8FF),
              //                                       ],
              //                                     ),
              //                                   ),
              //                                   child: Column(
              //                                     mainAxisSize:
              //                                     MainAxisSize.min,
              //                                     children: [
              //                                       const VerticalSpace(
              //                                         height: 10,
              //                                       ),
              //                                       TextWidget(
              //                                         text: 'My Recording',
              //                                         fontSize: 16,
              //                                         textAlign:
              //                                         TextAlign.center,
              //                                         textColor:
              //                                         ColorUtils.secondary,
              //                                         fontWeight:
              //                                         FontWeight.w700,
              //                                       ),
              //                                       const VerticalSpace(
              //                                         height: 10,
              //                                       ),
              //
              //                                       // AUDIO SLIDER
              //                                       SliderTheme(
              //                                         data: SliderTheme.of(context).copyWith(
              //                                           trackHeight: 3,
              //                                           thumbShape:
              //                                           const RoundSliderThumbShape(
              //                                             enabledThumbRadius:
              //                                             6,
              //                                           ),
              //                                           overlayShape:
              //                                           const RoundSliderOverlayShape(
              //                                             overlayRadius: 12,
              //                                           ),
              //                                           activeTrackColor:
              //                                           ColorUtils.primary,
              //                                           inactiveTrackColor:
              //                                           ColorUtils.primary
              //                                               .withOpacity(
              //                                             0.2,
              //                                           ),
              //                                           thumbColor:
              //                                           ColorUtils.primary,
              //                                           overlayColor: ColorUtils
              //                                               .primary
              //                                               .withOpacity(0.15),
              //                                         ),
              //                                         child: Slider(
              //                                           min: 0,
              //                                           max: 1,
              //                                           value: audioState
              //                                               .dialogProgress,
              //                                           onChanged:
              //                                           audioState
              //                                               .isRecording
              //                                               ? null
              //                                               : (v) {
              //                                             // assuming dialogIndex is the index of the audio being played
              //                                             int
              //                                             dialogIndex =
              //                                                 audioState
              //                                                     .audios
              //                                                     .length -
              //                                                     1; // last audio
              //                                             controller
              //                                                 .seekAudio(
              //                                               dialogIndex,
              //                                               v,
              //                                             );
              //                                           },
              //                                         ),
              //                                         // child: Slider(
              //                                         //   min: 0,
              //                                         //   max: 1,
              //                                         //   value: audioState
              //                                         //       .dialogProgress,
              //                                         //   onChanged: audioState
              //                                         //       .isRecording
              //                                         //       ? null
              //                                         //       : (v) =>
              //                                         //       controller
              //                                         //           .seekAudio(dialogIndex,v),
              //                                         // ),
              //                                       ),
              //                                       const VerticalSpace(
              //                                         height: 10,
              //                                       ),
              //
              //                                       // RECORD / STOP BUTTON & TIME
              //                                       Padding(
              //                                         padding:
              //                                         const EdgeInsets.symmetric(
              //                                           horizontal: 10,
              //                                         ),
              //                                         child: Row(
              //                                           mainAxisAlignment:
              //                                           MainAxisAlignment
              //                                               .spaceBetween,
              //                                           children: [
              //                                             TextWidget(
              //                                               text: controller
              //                                                   .formatDuration(
              //                                                 audioState
              //                                                     .recordDuration,
              //                                               ),
              //                                               fontSize: 10,
              //                                               textColor: ColorUtils
              //                                                   .black
              //                                                   .withOpacity(
              //                                                 0.8,
              //                                               ),
              //                                               fontWeight:
              //                                               FontWeight.w600,
              //                                             ),
              //                                             GestureDetector(
              //                                               onTap: () {
              //                                                 if (!audioState
              //                                                     .isRecording) {
              //                                                   controller
              //                                                       .startRecording();
              //                                                 } else {
              //                                                   controller
              //                                                       .stopRecording();
              //                                                 }
              //                                               },
              //                                               child: Icon(
              //                                                 audioState
              //                                                     .isRecording
              //                                                     ? Icons
              //                                                     .stop_circle
              //                                                     : Icons.mic,
              //                                                 size: 40,
              //                                                 color: ColorUtils
              //                                                     .primary.withOpacity(0.7),
              //                                               ),
              //                                             ),
              //                                             TextWidget(
              //                                               text:
              //                                               audioState
              //                                                   .recordedAt ==
              //                                                   null
              //                                                   ? '--:--'
              //                                                   : DateFormat(
              //                                                 'hh:mm a',
              //                                               ).format(
              //                                                 audioState
              //                                                     .recordedAt!,
              //                                               ),
              //                                               fontSize: 10,
              //                                               textColor: ColorUtils
              //                                                   .black
              //                                                   .withOpacity(
              //                                                 0.8,
              //                                               ),
              //                                               fontWeight:
              //                                               FontWeight.w600,
              //                                             ),
              //                                           ],
              //                                         ),
              //                                       ),
              //
              //                                       const VerticalSpace(
              //                                         height: 15,
              //                                       ),
              //
              //                                       // CANCEL / SAVE
              //                                       Row(
              //                                         children: [
              //                                           Expanded(
              //                                             child: ButtonWidget(
              //                                               navigateTo: () {
              //                                                 Navigator.pop(
              //                                                   context,
              //                                                 );
              //                                               },
              //                                               buttonName:
              //                                               'Cancel',
              //                                               borderRadius: 10,
              //                                               height: 40,
              //                                               buttonTextColor:
              //                                               ColorUtils
              //                                                   .white,
              //                                               buttonColor:
              //                                               ColorUtils
              //                                                   .primary,
              //                                             ),
              //                                           ),
              //                                           const HorizontalSpace(
              //                                             width: 8,
              //                                           ),
              //                                           Expanded(
              //                                             child: ButtonWidget(
              //                                               navigateTo: () {
              //                                                 controller
              //                                                     .saveAudio();
              //                                                 Navigator.pop(
              //                                                   context,
              //                                                 );
              //                                               },
              //                                               buttonName: 'Save',
              //                                               borderRadius: 10,
              //                                               height: 40,
              //                                               buttonTextColor:
              //                                               ColorUtils
              //                                                   .white,
              //                                               buttonColor:
              //                                               ColorUtils
              //                                                   .primary,
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                               );
              //                             },
              //                           );
              //                         },
              //                       );
              //                     },
              //                   ),
              //
              //                   // _threeDotInsideItem(
              //                   //   icon: ImagesUtils.audioIcon,
              //                   //   title: "Audio",
              //                   //   onTap: () {
              //                   //     showDialog(
              //                   //       context: context,
              //                   //       builder: (_) => Dialog(
              //                   //       backgroundColor: Colors.transparent,
              //                   //       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              //                   //       child: Container(
              //                   //         height: 200,
              //                   //         margin: EdgeInsets.only(top: 17),
              //                   //         padding: const EdgeInsets.all(16),
              //                   //         decoration: BoxDecoration(
              //                   //           // color: ColorUtils.lightScreenBackground,
              //                   //           borderRadius: BorderRadius.circular(12),
              //                   //           gradient: LinearGradient(
              //                   //             begin: Alignment.topCenter,
              //                   //             end: Alignment.bottomCenter,
              //                   //             colors: [
              //                   //               Color(0xFFFFFFFF),
              //                   //               Color(0xFFF8F8FF),
              //                   //             ],
              //                   //             stops: [0.0, 1.0],
              //                   //           ),
              //                   //         ),
              //                   //         child: Column(
              //                   //           mainAxisSize: MainAxisSize.min,
              //                   //           crossAxisAlignment: CrossAxisAlignment.start,
              //                   //           children: [
              //                   //             const VerticalSpace(height: 10),
              //                   //              TextWidget(
              //                   //               text: 'My Recording',
              //                   //               fontSize: 16,
              //                   //               textAlign: TextAlign.center,
              //                   //               textColor: ColorUtils.secondary,
              //                   //               fontWeight: FontWeight.w700,
              //                   //             ),
              //                   //             const VerticalSpace(height: 5),
              //                   //             Expanded(
              //                   //               child: Column(
              //                   //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                   //                 children: [
              //                   //                   SliderTheme(
              //                   //                     data: SliderTheme.of(context).copyWith(
              //                   //                       trackHeight: 3,
              //                   //                       thumbShape: const RoundSliderThumbShape(
              //                   //                         enabledThumbRadius: 6,
              //                   //                       ),
              //                   //                       overlayShape: const RoundSliderOverlayShape(
              //                   //                         overlayRadius: 12,
              //                   //                       ),
              //                   //                       activeTrackColor: ColorUtils.primary,
              //                   //                       inactiveTrackColor: ColorUtils.primary.withOpacity(0.2),
              //                   //                       thumbColor: ColorUtils.primary,
              //                   //                       overlayColor: ColorUtils.primary.withOpacity(0.15),
              //                   //                     ),
              //                   //                     child: Slider(
              //                   //                       min: 0,
              //                   //                       max: 1,
              //                   //                       value: audioProgress,
              //                   //                       onChanged: isRecording ? null : seekDialogAudio,
              //                   //                     ),
              //                   //                   ),
              //                   //                   VerticalSpace(height: 10),
              //                   //                   Padding(
              //                   //                     padding: const EdgeInsets.only(left: 10,right: 10),
              //                   //                     child: Row(
              //                   //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   //                       children: [
              //                   //                         TextWidget(
              //                   //                           text: formatDuration(recordDuration),
              //                   //                           fontSize: 10,
              //                   //                           textAlign: TextAlign.start,
              //                   //                           textColor:ColorUtils.black.withOpacity(0.8),
              //                   //                           fontWeight: FontWeight.w600,
              //                   //                         ),
              //                   //                         GestureDetector(
              //                   //                           onTap: () {
              //                   //                             if (!isRecording) {
              //                   //                               startRecording();
              //                   //                             } else {
              //                   //                               stopRecording();
              //                   //                             }
              //                   //                           },
              //                   //                           child: Icon(
              //                   //                             isRecording ? Icons.stop_circle : Icons.mic,
              //                   //                             size: 40,
              //                   //                             color: ColorUtils.primary,
              //                   //                           ),
              //                   //                         ),
              //                   //
              //                   //                         TextWidget(
              //                   //                           text:recordedAt == null
              //                   //                               ? '--:--'
              //                   //                               : DateFormat('hh:mm a').format(recordedAt!),
              //                   //                           fontSize: 10,
              //                   //                           textAlign: TextAlign.start,
              //                   //                           textColor:ColorUtils.black.withOpacity(0.8),
              //                   //                           fontWeight: FontWeight.w600,
              //                   //                         ),
              //                   //                       ],
              //                   //                     ),
              //                   //                   ),
              //                   //                 ],
              //                   //               ),
              //                   //             ),
              //                   //             const VerticalSpace(height: 15),
              //                   //             Row(
              //                   //               children: [
              //                   //                 Expanded(
              //                   //                   child: ButtonWidget(
              //                   //                     navigateTo: () {
              //                   //                       Navigator.pop(context);
              //                   //                     },
              //                   //                     buttonName: 'Cancel',
              //                   //                     borderRadius: 10,
              //                   //                     height: 40,
              //                   //                     buttonTextColor: ColorUtils.white,
              //                   //                     buttonColor: ColorUtils.primary,
              //                   //                   ),
              //                   //                 ),
              //                   //                 HorizontalSpace(width: 8),
              //                   //                 Expanded(
              //                   //                   child: ButtonWidget(
              //                   //                     navigateTo: () {
              //                   //                       _onSavePressed();
              //                   //
              //                   //                     },
              //                   //                     buttonName: 'Save',
              //                   //                     borderRadius: 10,
              //                   //                     height: 40,
              //                   //                     buttonTextColor: ColorUtils.white,
              //                   //                     buttonColor: ColorUtils.primary,
              //                   //                   ),
              //                   //                 ),
              //                   //               ],
              //                   //             )
              //                   //
              //                   //           ],
              //                   //         ),
              //                   //       )
              //                   //     ));
              //                   //   },
              //                   // ),
              //                   _threeDotInsideItem(
              //                     icon: ImagesUtils.fileExplorerIcon,
              //                     title: "File Explorer",
              //                     onTap: () {
              //                       pickImagesFromGallery();
              //                       Navigator.pop(context);
              //                     },
              //                   ),
              //                   _threeDotInsideItem(
              //                     icon: ImagesUtils.cloudServerIcon,
              //                     title: "Server",
              //                     onTap: () {},
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     },
              //   );
              // },
              child: Image(
                image: AssetImage(ImagesUtils.attachmentsIcon),
                color: ColorUtils.white,
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Dear User,',
              fontSize: 14,
              textAlign: TextAlign.start,
              textColor:ColorUtils.black.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
            TextWidget(
              text: 'We value your feedback to improve our App. Please let us know if you have any comments. concerns or suggestions',
              fontSize: 13,
              textAlign: TextAlign.start,
              textColor:ColorUtils.black.withOpacity(0.75),
              fontWeight: FontWeight.w500,
            ),
            VerticalSpace(height: 12),
            TextWidget(
              text: 'Remark',
              fontSize: 14,
              textAlign: TextAlign.start,
              textColor:ColorUtils.secondary,
              fontWeight: FontWeight.w600,
            ),
            VerticalSpace(height: 5),
            Container(
              height: 130,
              width: screenWidth(context),
              padding: const EdgeInsets.only(left: 8,right: 8),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: ColorUtils.white,
                border: Border.all(
                  color: const Color(0xFFEAECF0),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF43474D).withOpacity(0.06),
                    blurRadius: 60,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: TextField(
                maxLines: 10,
                minLines: 1,
                expands: false,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color:ColorUtils.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500
                  ),
                ),
                decoration:  InputDecoration(
                  hintText: 'Type Here...',
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 14,
                        color:ColorUtils.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),

            VerticalSpace(height: 12),
            if (selectedImages.isNotEmpty)
              TextWidget(
                text: 'Photos',
                fontSize: 14,
                textAlign: TextAlign.start,
                textColor: ColorUtils.black.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                selectedImages.length,
                    (index) => _imageItem(index),
              ),
            ),
            VerticalSpace(height: 12),
            if (selectedVideos.isNotEmpty)
              TextWidget(
                text: 'Videos',
                fontSize: 14,
                textAlign: TextAlign.start,
                textColor: ColorUtils.black.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(
                selectedVideos.length,
                    (index) => _videoItem(index),
              ),
            ),

            Consumer(
              builder: (context, ref, _) {
                final audioState = ref.watch(audioProvider);
                final controller = ref.read(audioProvider.notifier);
                if (audioState.audios.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Audios',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.black.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    ListView.builder(
                      itemCount: audioState.audios.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final audio = audioState.audios[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child:  Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                width: screenWidth(context),
                                margin: EdgeInsets.only(top: 6.5),
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: ColorUtils.white,
                                  border: Border.all(
                                    color: const Color(0xFFEAECF0),
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF43474D).withOpacity(0.06),
                                      blurRadius: 60,
                                      offset: const Offset(0, 12),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                      },
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.black,

                                        ),
                                        height: 45,
                                        width: 45,
                                        child: Center(child: Icon(Icons.person, color: ColorUtils.white,size: 23,),),
                                      ),
                                    ),

                                    HorizontalSpace(width: 15),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () => controller.playPauseAudio(index),
                                                child: Image(
                                                  image: AssetImage(audio.isPlaying?ImagesUtils.pauseAudioIcon:ImagesUtils.playAudioIcon),
                                                  color: ColorUtils.black.withOpacity(0.8),
                                                  height: 20,
                                                ),
                                              ),

                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: SliderTheme(
                                                  data: SliderTheme.of(context).copyWith(
                                                    trackHeight: 3,
                                                    thumbShape: const RoundSliderThumbShape(
                                                      enabledThumbRadius: 6,
                                                    ),
                                                    overlayShape: const RoundSliderOverlayShape(
                                                      overlayRadius: 12,
                                                    ),
                                                    activeTrackColor: ColorUtils.primary,
                                                    inactiveTrackColor: ColorUtils.primary.withOpacity(0.2),
                                                    thumbColor: ColorUtils.primary,
                                                    overlayColor: ColorUtils.primary.withOpacity(0.15),
                                                  ),
                                                  child:  Slider(
                                                    min: 0,
                                                    max: 1,
                                                    value: audio.progress.clamp(0.0, 1.0),
                                                    onChanged: (v) => controller.seekAudio(index, v),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          VerticalSpace(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                text: controller.formatDuration(audio.duration,),
                                                fontSize: 10,
                                                textAlign: TextAlign.start,
                                                textColor:ColorUtils.black.withOpacity(0.8),
                                                fontWeight: FontWeight.w600,
                                              ),
                                              TextWidget(
                                                text: DateFormat('hh:mm a',).format(audio.recordedAt),
                                                fontSize: 10,
                                                textAlign: TextAlign.start,
                                                textColor:ColorUtils.black.withOpacity(0.8),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ],
                                          ),
                                        ],

                                      ),
                                    )
                                  ],
                                ),
                              ),

                              GestureDetector(
                                onTap: () => controller.deleteAudio(index),
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorUtils.red,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),


            Spacer(),
            ButtonWidget(
              navigateTo: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MediaScreen(),));
              } ,
              buttonName: 'Upload',
              borderRadius: 30,
              width: screenWidth(context),
              height: 50,
              buttonTextColor: ColorUtils.white,
              buttonColor: ColorUtils.primary,
            ),
            VerticalSpace(height: 10),

          ],
        ),
      ),
    );
  }

  Widget _threeDotInsideItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorUtils.secondary
              ),
              child: Image(image: AssetImage(icon),height: 13,color: ColorUtils.white,),
            ),
            const SizedBox(width: 10),
            TextWidget(
              text: title,
              fontSize: 15,
              textColor: ColorUtils.secondary,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageItem(int index) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ActivitiesPhotoViewScreen(
                    imageFile: selectedImages[index],
                  ),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 6, right: 6),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: FileImage(selectedImages[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// remove image
          GestureDetector(
            onTap: () {
              selectedImages.removeAt(index);
              setState(() {});
            },
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.red,
              ),
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoItem(int index) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      VideoPlayScreen(videoFile: selectedVideos[index]),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 6, right: 6),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                  image: AssetImage(ImagesUtils.bgSmallCardOne),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),

          /// remove video
          GestureDetector(
            onTap: () {
              selectedVideos.removeAt(index);
              setState(() {});
            },
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.red,
              ),
              child: const Icon(Icons.close, size: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

}












