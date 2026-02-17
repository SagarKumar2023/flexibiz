import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
class BottomSheetActionTile extends StatelessWidget {
  final String iconImage ;
  final String title ;
  final VoidCallback onTap;
  final double? boxWidth;
  const BottomSheetActionTile({super.key, required this.iconImage, required this.title, required this.onTap, this.boxWidth});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          width: boxWidth,
          padding: EdgeInsets.all(1.5),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: ColorUtils.white,
            border: Border.all(
              color: const Color(0xFFEAECF0),
              width: 1,
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: const Color(0xFF43474D).withOpacity(0.06),
            //     blurRadius: 60,
            //     offset: const Offset(0, 12),
            //   ),
            // ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(iconImage),height: 22,width:22,
                // color: Color(0xFF22A2F5)
                //color: const Color(0xFF2FA1F9),
                color: ColorUtils.primary,

              ),
              VerticalSpace(height: 10),
              TextWidget(
                text: title,
               textColor: ColorUtils.secondary,
               // textColor: const Color(0xFF344054),
                fontWeight: FontWeight.w600,
                fontSize: 12,
                // fontSize: 12,
                textAlign: TextAlign.center,
                // textColor: ColorUtils.black.withOpacity(0.75),
                // fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}