import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart'as http;

class AttachmentActionUtils {


  static Future<void> openImage(String imagePath) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final fileName = imagePath.split('/').last;
      final file = File('${tempDir.path}/$fileName');

      Uint8List bytes;

      /// NETWORK IMAGE
      if (imagePath.startsWith('http')) {
        final response = await http.get(Uri.parse(imagePath));
        bytes = response.bodyBytes;
      }
      /// ASSET IMAGE
      else {
        final byteData = await rootBundle.load(imagePath);
        bytes = byteData.buffer.asUint8List();
      }

      await file.writeAsBytes(bytes);

      ///  Opens Google Photos / default gallery
      await OpenFile.open(file.path);
    } catch (e) {
      print('Image open error: $e');
    }
  }

  static Future<void> shareNetworkImage(String imageUrl) async {
    try {
      // Download image
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode != 200) {
        throw 'Image download failed';
      }

      // Get temp directory
      final tempDir = await getTemporaryDirectory();

      // File name with extension
      final file = File(
        '${tempDir.path}/shared_image.jpg',
      );

      // Write bytes
      await file.writeAsBytes(response.bodyBytes);

      // Share
      await Share.shareXFiles(
        [XFile(file.path)],
        text: 'Shared from FlexiBiz',
      );

    } catch (e) {
      debugPrint("Share error: $e");
    }
  }

  static Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      if (await Permission.photos.isGranted ||
          await Permission.storage.isGranted) {
        return true;
      }

      // Android 13+
      if (await Permission.photos.request().isGranted) {
        return true;
      }

      // Android 12 and below
      if (await Permission.storage.request().isGranted) {
        return true;
      }

      return false;
    }
    return true;
  }

  static Future<void> downloadNetworkImage(
      BuildContext context,
      String imageUrl,
      ) async {
    try {
      final hasPermission = await _requestPermission();
      if (!hasPermission) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Storage permission denied. Please allow from settings.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode != 200) throw 'Download failed';

      final dir = Directory('/storage/emulated/0/Download');
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
      }

      final filePath =
          '${dir.path}/flexibiz_${DateTime.now().millisecondsSinceEpoch}.jpg';

      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Image downloaded to Downloads folder'),
          backgroundColor: Colors.green,
          action: SnackBarAction(
            label: 'OPEN',
            onPressed: () => OpenFile.open(file.path),
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to download image'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  
}

