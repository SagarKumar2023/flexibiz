import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flutter/material.dart';

class ArrowBackButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Color? backButtonColor;
  const ArrowBackButtonWidget({super.key, required this.onTap, this.backButtonColor});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Center(
          child: Image.asset(
            ImagesUtils.arrowBackNewIcon,
            width: 24,
            height: 24,
            color:backButtonColor?? ColorUtils.white,
          ),
        ),
      ),
    );
  }
}
