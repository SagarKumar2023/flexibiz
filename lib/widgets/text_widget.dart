import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? textTwoColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  final bool? softSwap;
  final int? maxLine;
  final TextDecoration? textDecoration;
  final Color? decorationColor ;
  final bool softWrap;
  final int maxLines;
  const TextWidget({
    super.key,
    this.text,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.textTwoColor,
    this.textAlign = TextAlign.start, this.overflow, this.softSwap, this.maxLine, this.textDecoration, this.decorationColor, this.softWrap = true, this.maxLines = 10
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLine,
      "$text",
      softWrap: softWrap,
      overflow: overflow,
      textAlign: textAlign,
      // montserrat
      style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
            decoration: textDecoration,
              decorationColor:decorationColor?? Colors.black.withOpacity(0.8),

          ),
      ),
    );
  }
}



class MyRichText extends StatelessWidget {
  final String? textOne;
  final String? textTwo;
  final String? textThree;
  final String? textFour;
  final Color? textColor;
  final Color? textTwoColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;


  const MyRichText({
    super.key,
    this.textOne,
    this.textTwo,
    this.textThree,
    this.textColor,
    this.textTwoColor,
    this.fontWeight,
    this.fontSize, this.textFour, this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign!,
      text: TextSpan(
        children: <InlineSpan>[
          if (textOne != null)
            TextSpan(
              text: textOne,
              /// GoogleFonts.montserrat
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
            ),
          if (textTwo != null)
            TextSpan(
              text: textTwo,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textTwoColor,
                ),
              ),
            ),
          if (textThree != null)
            TextSpan(
              text: textThree,
              style: GoogleFonts.playfairDisplay(
                textStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class CommonKhandText extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final double? fontSize;
  const CommonKhandText({
    super.key,
    this.title,
    this.textColor,
    this.fontWeight,
    this.fontSize, this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title",
      textAlign: textAlign,
      style: GoogleFonts.playfairDisplay(
          textStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          )),
    );
  }
}
