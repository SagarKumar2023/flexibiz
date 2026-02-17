import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SortingCriteriaDialog extends StatefulWidget {
  final String dialogTitle;
  final String selectedValue;
  final bool isAscending;

  const SortingCriteriaDialog({
    super.key,
    required this.dialogTitle,
    required this.selectedValue,
    required this.isAscending,
  });

  @override
  State<SortingCriteriaDialog> createState() =>
      _SortingCriteriaDialogState();
}

class _SortingCriteriaDialogState extends State<SortingCriteriaDialog> {
  late String unitSelectValue;
  late bool isAscending; // ⭐ boolean (cleaner)

  final List<String> sortingCriteriaList = [
    'Customer Name',
    'Job Name',
    'Unit Name',
    'Release Date',
    'Work Order',
  ];

  @override
  void initState() {
    super.initState();
    unitSelectValue = widget.selectedValue;
    isAscending = widget.isAscending; // ⭐ RESTORE LAST STATE
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 255,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 17),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF8F8FF),
                  ],
                ),
              ),
              child: Column(
                children: [
                  ///ASC / DESC
                  VerticalSpace(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() => isAscending = true);
                          },
                          child: _orderButton(
                            title: "Ascending",
                            isSelected: isAscending,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() => isAscending = false);
                          },
                          child: _orderButton(
                            title: "Descending",
                            isSelected: !isAscending,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// SORTING LIST
                  Column(
                    children: sortingCriteriaList.map((item) {
                      final isSelected = unitSelectValue == item;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(
                              context,
                              SortingResult(
                                criteria: item,
                                isAscending: isAscending,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              _checkBox(isSelected),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextWidget(
                                  text: item,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            ///  Title
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextWidget(
                  text: widget.dialogTitle,
                  fontSize: 15.5,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _checkBox(bool isSelected) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff007BFF) : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected
              ? const Color(0xff007BFF)
              : const Color(0xFFEAECF0),
          width: 2,
        ),
      ),
      child: isSelected
          ? Image.asset(ImagesUtils.checkIcon, color: Colors.white)
          : null,
    );
  }

  Widget _orderButton({
    required String title,
    required bool isSelected,
  }) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: const Color(0xFFEAECF0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(text: title, fontWeight: FontWeight.w600),
          _checkBox(isSelected),
        ],
      ),
    );
  }
}


class SortingResult {
  final String criteria;
  final bool isAscending;

  SortingResult({
    required this.criteria,
    required this.isAscending,
  });
}

// class SortingCriteriaDialog extends StatefulWidget {
//   final String dialogTitle;
//   final String selectedValue;
//
//   const SortingCriteriaDialog({
//     super.key,
//     required this.dialogTitle,
//     required this.selectedValue,
//   });
//
//   @override
//   State<SortingCriteriaDialog> createState() => _SortingCriteriaDialogState();
// }
//
// class _SortingCriteriaDialogState extends State<SortingCriteriaDialog> {
//   late String unitSelectValue;
//
//   final List<String> sortingCriteriaList = [
//     'Customer Name',
//     'Job Name',
//     'Unit Name',
//     'Release Date',
//     'Work Order',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     // ⭐ last selected value restore
//     unitSelectValue = widget.selectedValue;
//   }
//
//   String ascendingDecendingStatus = "Accending";
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
//       child: SizedBox(
//         height: 350,
//         child: Stack(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(top: 17),
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFFFFFFFF),
//                     Color(0xFFF8F8FF),
//                   ],
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   VerticalSpace(height: 3),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               ascendingDecendingStatus = "Accending";
//                             });
//                           },
//                           child: _statusButton(
//                             title: "Accending",
//                             isSelected: ascendingDecendingStatus == "Accending",
//                           ),
//                         ),
//                       ),
//                       const HorizontalSpace(width: 10),
//                       Expanded(
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               ascendingDecendingStatus = "Decending";
//                             });
//                           },
//                           child: _statusButton(
//                             title: "Decending",
//                             isSelected: ascendingDecendingStatus == "Decending",
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: sortingCriteriaList.map((item) {
//                       final bool isSelected = unitSelectValue == item;
//
//                       return InkWell(
//                         onTap: () {
//                           // select + close dialog
//                           Navigator.pop(context, item);
//                         },
//                         child: Container(
//                           height: 30,
//                           padding: const EdgeInsets.symmetric(horizontal: 5),
//                           margin: const EdgeInsets.only(bottom: 6),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                   color: isSelected
//                                       ? const Color(0xff007BFF)
//                                       : Colors.white,
//                                   borderRadius: BorderRadius.circular(4),
//                                   border: Border.all(
//                                     color: isSelected
//                                         ? const Color(0xff007BFF)
//                                         : const Color(0xFFEAECF0),
//                                     width: 2,
//                                   ),
//                                 ),
//                                 child: isSelected
//                                     ? Image(
//                                   height: 18,
//                                   width: 18,
//                                   color: ColorUtils.white,
//                                   image: AssetImage(ImagesUtils.checkIcon),
//                                 )
//                                     : null,
//                               ),
//                               const SizedBox(width: 10),
//                               Expanded(
//                                 child: TextWidget(
//                                   text: item,
//                                   fontSize: 14,
//                                   textColor: ColorUtils.black,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   )
//                 ],
//               ),
//             ),
//
//             ///  Title
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                 ),
//                 child: TextWidget(
//                   text: widget.dialogTitle,
//                   fontSize: 15.5,
//                   textColor: ColorUtils.secondary,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _statusButton({
//     required String title,
//     required bool isSelected,
//   }) {
//     return Container(
//       height: 40,
//       padding: EdgeInsets.only(left: 12,right: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(11),
//         color: ColorUtils.white,
//         border: Border.all(
//           color: Color(0xFFEAECF0),
//           width: 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFF43474D).withOpacity(0.06),
//             blurRadius: 60,
//             offset: const Offset(0, 12),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           TextWidget(
//             text: title,
//             fontSize: 16,
//             textAlign: TextAlign.center,
//             textColor:ColorUtils.black.withOpacity(0.75) ,
//
//             fontWeight: FontWeight.w600,
//           ),
//           Container(
//               height: 25,
//               width: 25,
//               padding: EdgeInsets.all(3),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: isSelected
//                     ? ColorUtils.primary.withOpacity(0.8)
//                     : ColorUtils.black.withOpacity(0),
//                 border: Border.all(
//                   color: isSelected ? ColorUtils.primary:Color(0xFFEAECF0),
//                   width: 1,
//                 ),
//               ),
//               child:  isSelected? Image(image: AssetImage(ImagesUtils.checkIcon),color: ColorUtils.white,):SizedBox()
//           ),
//         ],
//       ),
//     );
//   }
// }
