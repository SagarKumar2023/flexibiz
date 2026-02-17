// import 'package:flexibiz/constant/color_Utils.dart';
// import 'package:flexibiz/constant/images.dart';
// import 'package:flexibiz/constant/spacer.dart';
// import 'package:flexibiz/widgets/text_widget.dart';
// import 'package:flutter/material.dart';
// class DashboardUi extends StatelessWidget {
//   final String cardOneTitle;
//   final String cardOneIcon;
//   final VoidCallback cardOneOnTap;
//   final String cardTwoTitle;
//   final String cardTwoIcon;
//   final VoidCallback cardTwoOnTap;
//   const DashboardUi({super.key, required this.cardOneTitle, required this.cardOneIcon, required this.cardOneOnTap, required this.cardTwoTitle, required this.cardTwoIcon, required this.cardTwoOnTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 18),
//       child: Row(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onTap: cardOneOnTap,
//               child: Card(
//                 margin: EdgeInsets.zero,
//                 elevation: 5,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: ColorUtils.white,
//                       borderRadius: BorderRadius.circular(12)
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 115,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(image: AssetImage(ImagesUtils.bgSmallCardOne),fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(12)
//                         ),
//                         child: Center(
//                           child: Container(
//                             margin: EdgeInsets.only(bottom: 20),
//                             height: 90,
//                             width: 90,
//                             decoration: BoxDecoration(
//                               // color: Colors.black,
//                               image: DecorationImage(image: AssetImage(cardOneIcon),fit: BoxFit.cover),
//
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 2,right: 2,top: 7,bottom: 7),
//                         child: TextWidget(
//                           text: cardOneTitle,
//                           fontSize: 12,
//                           textAlign: TextAlign.center,
//                           textColor: ColorUtils.secondary,
//                           softSwap: true,
//                           overflow: TextOverflow.visible,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           HorizontalSpace(width: 14),
//           Expanded(
//             child: GestureDetector(
//               onTap: cardTwoOnTap,
//               child: Card(
//                 margin: EdgeInsets.zero,
//                 elevation: 5,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: ColorUtils.white,
//                       borderRadius: BorderRadius.circular(12)
//                   ),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 115,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(image: AssetImage(ImagesUtils.bgSmallCardOne),fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(12)
//                         ),
//                         child: Center(
//                           child: Container(
//                             margin: EdgeInsets.only(bottom: 20),
//                             height: 90,
//                             width: 90,
//                             decoration: BoxDecoration(
//                               // color: Colors.black,
//                               image: DecorationImage(image: AssetImage(cardTwoIcon),fit: BoxFit.cover),
//
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 2,right: 2,top: 7,bottom: 7),
//                         child: TextWidget(
//                           text: cardTwoTitle,
//                           fontSize: 12,
//                           textAlign: TextAlign.center,
//                           textColor: ColorUtils.secondary,
//                           softSwap: true,
//                           overflow: TextOverflow.visible,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
class DashboardUi extends StatelessWidget {

  final String cardOneTitle;
  final String cardOneIcon;
  final VoidCallback cardOneOnTap;
  final String cardTwoTitle;
  final String cardTwoIcon;
  final VoidCallback cardTwoOnTap;
  const DashboardUi({super.key, required this.cardOneTitle, required this.cardOneIcon, required this.cardOneOnTap, required this.cardTwoTitle, required this.cardTwoIcon, required this.cardTwoOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: cardOneOnTap,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 5,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: AssetImage("assets/images/bg_card_one.jpg"),fit: BoxFit.cover),

                  ),
                  child: Column(
                    children: [
                      VerticalSpace(height: 10),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          image: DecorationImage(image: AssetImage(cardOneIcon),fit: BoxFit.cover),
                        ),
                      ),
                      TextWidget(
                        text: cardOneTitle,
                        fontSize: 12,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.black.withOpacity(0.75),
                        softSwap: true,
                        overflow: TextOverflow.visible,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          HorizontalSpace(width: 14),
          Expanded(
            child: GestureDetector(
              onTap: cardTwoOnTap,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 5,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: AssetImage("assets/images/bg_card_one.jpg"),fit: BoxFit.cover),

                  ),
                  child: Column(
                    children: [
                      VerticalSpace(height: 10),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          // color: Colors.black,
                          image: DecorationImage(image: AssetImage(cardTwoIcon),fit: BoxFit.cover),

                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2,right: 2),
                        child: TextWidget(
                          text: cardTwoTitle,
                          fontSize: 12,
                          textAlign: TextAlign.center,
                          textColor: ColorUtils.black.withOpacity(0.75),
                          softSwap: true,
                          overflow: TextOverflow.visible,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

