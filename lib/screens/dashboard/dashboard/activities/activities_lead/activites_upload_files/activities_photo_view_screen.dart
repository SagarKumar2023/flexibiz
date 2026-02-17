import 'dart:io';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ActivitiesPhotoViewScreen extends StatefulWidget {
  final File imageFile;

  const ActivitiesPhotoViewScreen({super.key,required this.imageFile,});

  @override
  State<ActivitiesPhotoViewScreen> createState() => _ActivitiesPhotoViewScreenState();
}

class _ActivitiesPhotoViewScreenState extends State<ActivitiesPhotoViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: -8,
        backgroundColor: ColorUtils.primary,
        title: TextWidget(
          text: "IMAGE",
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(
          onTap: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Center(
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 4,
            child: Image.file(
              widget.imageFile,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
