import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
class DashboardListTileWidget extends StatelessWidget {
  final String leadingIcon ;
  final String title ;
  final VoidCallback onTap;
  const DashboardListTileWidget({super.key, required this.leadingIcon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        width: screenWidth(context),
        padding: const EdgeInsets.only(left: 5,top: 5,bottom: 5,right: 10),
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
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                // color: ColorUtils.blue.withOpacity(0.11),
                // color: Color(0xff9694FF).withOpacity(0.2),
                // color: const Color(0xFF2FA1F9).withOpacity(0.12),

                color: const Color(0xFF2FA1F9).withOpacity(0.10),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Image(image: AssetImage(leadingIcon)),
              ),
            ),
            HorizontalSpace(width: 13),
            TextWidget(
              text: title,
              fontSize: 14,
              textAlign: TextAlign.center,
              //textColor: const Color(0xFF1D2939),
              textColor: ColorUtils.secondary,
              softSwap: true,
              overflow: TextOverflow.visible,
              fontWeight: FontWeight.w700,
            ),
            Spacer(),
            Image(image: AssetImage(ImagesUtils.arrowRight),height: 18,
                color: const Color(0xFF98A2B3)
            ),
          ],
        ),
      ),
    );
  }
}

/// color: Color(0xffEFEFEF), container color kya rakhe
class DashboardUi extends StatelessWidget {
  final String cardOneTitle;
  final String cardOneIcon;
  final VoidCallback cardOneOnTap;
  final String cardTwoTitle;
  final String cardTwoIcon;
  final VoidCallback cardTwoOnTap;
  const DashboardUi({
    super.key,
    required this.cardOneTitle,
    required this.cardOneIcon,
    required this.cardOneOnTap,
    required this.cardTwoTitle,
    required this.cardTwoIcon,
    required this.cardTwoOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: cardOneOnTap,
              child: Container(
                padding: EdgeInsets.only(top: 28,bottom: 28),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(13),
                //   color: Color(0xffEFEFEF),
                //   border: Border.all(
                //     //color: const Color(0xFFEAECF0),
                //     color: ColorUtils.colorBlack.withOpacity(0.03),
                //     width: 1.5,
                //   ),
                // ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color(0xFF000000).withOpacity(0.05),
                  //     blurRadius: 20,
                  //     spreadRadius: 1,
                  //     offset: Offset(0, 8),
                  //   ),
                  // ],
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                  border: Border.all(
                    color: const Color(0xFFEAECF0),
                    width: 1,
                  ),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(cardOneIcon),height: 33,color: ColorUtils.primary,),
                    VerticalSpace(height: 15),
                    TextWidget(
                      text: cardOneTitle,
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.secondary,
                      softSwap: true,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
          ),
          HorizontalSpace(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: cardTwoOnTap,
              child: Container(
                padding: EdgeInsets.only(top: 28,bottom: 28),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(13),
                //   color: Color(0xffEFEFEF),
                //   border: Border.all(
                //     //color: const Color(0xFFEAECF0),
                //     color: ColorUtils.colorBlack.withOpacity(0.03),
                //     width: 1.5,
                //   ),
                // ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Color(0xFF000000).withOpacity(0.05),
                  //     blurRadius: 20,
                  //     spreadRadius: 1,
                  //     offset: Offset(0, 8),
                  //   ),
                  // ],
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                  border: Border.all(
                    color: const Color(0xFFEAECF0),
                    width: 1,
                  ),
                ),

                child: Column(
                  children: [
                    Image(image: AssetImage(cardTwoIcon),height: 33,color: ColorUtils.primary,),
                    VerticalSpace(height: 15),
                    TextWidget(
                      text: cardTwoTitle,
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.secondary,
                      softSwap: true,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
