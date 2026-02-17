import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';


class MyButton extends StatelessWidget {
  final VoidCallback navigateTo;
  final double? radius ;
  final String buttonName;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final double? fontsize;
  final EdgeInsetsGeometry? margin;
  const MyButton({
    super.key,
    required this.navigateTo,
    required this.buttonName,
    this.margin,
    this.height,
    this.width,
    this.buttonColor,
    this.fontsize, this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      margin: margin,
      width: width ?? screenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius??45),
      ),
      child: ElevatedButton(
        onPressed: () {
          navigateTo();
        },
        style: ElevatedButton.styleFrom(
            surfaceTintColor: buttonColor ?? ColorUtils.primary,
            elevation: 0,
            backgroundColor: buttonColor ?? ColorUtils.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius??45),
            )
        ),
        child: Text(
          buttonName,
          style: GoogleFonts.nunito(
              textStyle: TextStyle(
                  color: ColorUtils.white,
                  fontSize: fontsize??16
              )
          ),
        ),
      ),
    );
  }
}


class ButtonWidget extends StatelessWidget {
  final VoidCallback? navigateTo;
  final String buttonName;
  final double? height;
  final double? width;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final double? fontsize;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;

  const ButtonWidget({
    super.key,
    required this.navigateTo,
    required this.buttonName,
    this.margin,
    this.height,
    this.width,
    this.buttonColor,
    this.fontsize,
    this.borderRadius,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateTo,
      child: Container(
        padding: EdgeInsets.only(left: 8,right: 8),
        height: height ?? 45,
        margin: margin,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 45),
            color: buttonColor ?? ColorUtils.grey
        ),
        child: Center(
          child: Text(
            buttonName,
            style: GoogleFonts.robotoSlab(
              textStyle: TextStyle(
                  color: buttonTextColor ?? ColorUtils.white,
                  fontSize: fontsize ?? 16,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ),
      ),
    );
  }
}
