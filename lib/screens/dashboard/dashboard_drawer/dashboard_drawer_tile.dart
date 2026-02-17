import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DashboardDrawerTile extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final String leadingIcon;
  final Color? leadingIconColor;
  final VoidCallback onTap;
  const DashboardDrawerTile({super.key, required this.title, required this.leadingIcon, required this.onTap, this.titleColor, this.leadingIconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        height: 45,
        padding: EdgeInsets.only(left: 14,right: 14,top: 7,bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(leadingIcon),height: 25,width:25,color:leadingIconColor?? ColorUtils.black.withOpacity(0.65),),
            HorizontalSpace(width: 15),
            TextWidget(
              text: title,
              fontSize: 14,
              textColor:titleColor?? ColorUtils.black.withOpacity(0.75),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
