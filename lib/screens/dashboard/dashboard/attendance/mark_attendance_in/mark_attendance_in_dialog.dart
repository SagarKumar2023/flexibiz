import 'dart:ui';

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MarkAttendanceInDialog extends StatefulWidget {

  const MarkAttendanceInDialog({
    super.key,
  });

  @override
  State<MarkAttendanceInDialog> createState() => _MarkAttendanceInDialogState();
}

class _MarkAttendanceInDialogState extends State<MarkAttendanceInDialog> {

  final List<String> locationList = [
    "214 Maple Street, Downtown, Springfield, USA",
    "Flat 302 Shanti Apartments, MG Road, Indore, India",
    "89 Baker Lane, Croydon, London, UK",
    "House No 17 Sector 45, Sector 45, Chandigarh, India",
    "560 Palm Avenue, Santa Monica Beach, Santa Monica, USA",
    "Plot 9B Green Valley Colony, Green Valley, Bhopal, India",
    "44 Kingfisher Drive, Westcroft, Milton Keynes, UK",
    "Apartment 12C Skyline Towers, Bandra West, Mumbai, India",
    "781 Lakeview Road, Lake Edge, Madison, USA",
    "Door No 5/112 Anna Nagar West, Anna Nagar, Chennai, India",
    "63 Rosewood Crescent, Meadowvale, Mississauga, Canada",
    "Villa 21 Silver Oak Enclave, Whitefield, Bengaluru, India",
    "902 Ocean Boulevard, South Beach, Miami Beach, USA",
    "H No 48 Rajendra Nagar, Rajendra Nagar, Patna, India",
    "27 Willow Court, Parramatta West, Sydney, Australia",
  ];
  String? selectedLocation;


  @override
  Widget build(BuildContext mainDialogContext) {
    return Dialog(
      backgroundColor:
      Colors.transparent,
      insetPadding:
      const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height:300,
        child: Stack(
          children: [
            Container(
              margin:
              EdgeInsets.only(
                top: 17,
              ),
              padding:
              const EdgeInsets.all(
                16,
              ),
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                  12,
                ),
                gradient: LinearGradient(
                  begin: Alignment
                      .topCenter,
                  end: Alignment
                      .bottomCenter,
                  colors: [
                    Color(
                      0xFFFFFFFF,
                    ),
                    Color(
                      0xFFF8F8FF,
                    ),
                  ],
                  stops: [
                    0.0,
                    1.0,
                  ],
                ),
              ),
              child: Column(
                mainAxisSize:
                MainAxisSize
                    .min,
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,
                children: [
                  const VerticalSpace(
                    height:
                    10,
                  ),
                  TextWidget(
                    text: "Your Location is ${selectedLocation ?? 'Gaur City Mall, Greater Noida West (Noida Extension), near Gaur City 1, Kisan Chowk (Gaur Chowk)'}",
                    fontSize:
                    16,
                    textAlign:
                    TextAlign
                        .start,
                    textColor:
                    Color(
                      0xff1F1F1F,
                    ),
                    fontWeight:
                    FontWeight
                        .w500,
                  ),
                  const VerticalSpace(
                    height:
                    14,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () {
                            Navigator.pop(mainDialogContext);
                          },
                          buttonName:
                          'Cancel',
                          borderRadius:
                          10,
                          height:
                          30,
                          buttonTextColor:
                          ColorUtils.white,
                          buttonColor:
                          ColorUtils.primary,
                        ),
                      ),
                      HorizontalSpace(
                        width:
                        8,
                      ),
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () {
                            showDialog(
                              context: context,
                              builder: (_) => Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: SizedBox(
                                  height: 560,
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 17,
                                        ),
                                        padding: const EdgeInsets.all(
                                          16,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(
                                                0xFFFFFFFF,
                                              ),
                                              Color(
                                                0xFFF8F8FF,
                                              ),
                                            ],
                                            stops: [
                                              0.0,
                                              1.0,
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const VerticalSpace(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 450,
                                              child: ListView.separated(
                                                itemCount: locationList.length,
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (
                                                    _,
                                                    __,
                                                    ) => const SizedBox(),
                                                itemBuilder:
                                                    (
                                                    context,
                                                    index,
                                                    ) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      setState(
                                                            () {
                                                          selectedLocation = locationList[index];
                                                        },
                                                      );
                                                      Navigator.pop(
                                                        context,
                                                      );
                                                    },

                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                      ),
                                                      child: TextWidget(
                                                        text: locationList[index],
                                                        fontSize: 15,
                                                        textAlign: TextAlign.start,
                                                        textColor: const Color(
                                                          0xff1F1F1F,
                                                        ),
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            const VerticalSpace(
                                              height: 14,
                                            ),
                                            ButtonWidget(
                                              navigateTo: () {
                                                Navigator.pop(
                                                  context,
                                                );
                                              },
                                              buttonName: 'Dismiss',
                                              borderRadius: 10,
                                              height: 35,
                                              width: screenWidth(
                                                context,
                                              ),
                                              buttonTextColor: ColorUtils.white,
                                              buttonColor: ColorUtils.primary,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            left: 14,
                                            right: 14,
                                            top: 5,
                                            bottom: 7,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                            color: Color(
                                              0xFFFFFFFF,
                                            ),
                                          ),
                                          child: TextWidget(
                                            text: "Are you in",
                                            fontSize: 15.5,
                                            textColor: ColorUtils.secondary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          buttonName:
                          'Near By',
                          borderRadius:
                          10,
                          height:
                          30,
                          buttonTextColor:
                          ColorUtils.white,
                          buttonColor:
                          ColorUtils.primary,
                        ),
                      ),
                      HorizontalSpace(
                        width:
                        8,
                      ),
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () {
                            /// for success
                            // showDialog(
                            //   context: context,
                            //   builder:(_,) => Dialog(
                            //     backgroundColor: Colors.transparent,
                            //     insetPadding: const EdgeInsets.symmetric(
                            //       horizontal: 20,
                            //     ),
                            //     child: SizedBox(
                            //       height: 125,
                            //       child: Container(
                            //         margin: EdgeInsets.only(
                            //           top: 17,
                            //         ),
                            //         padding: const EdgeInsets.all(
                            //           16,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(
                            //             12,
                            //           ),
                            //           gradient: LinearGradient(
                            //             begin: Alignment.topCenter,
                            //             end: Alignment.bottomCenter,
                            //             colors: [
                            //               Color(
                            //                 0xFFFFFFFF,
                            //               ),
                            //               Color(
                            //                 0xFFF8F8FF,
                            //               ),
                            //             ],
                            //             stops: [
                            //               0.0,
                            //               1.0,
                            //             ],
                            //           ),
                            //         ),
                            //         child: Column(
                            //           mainAxisSize: MainAxisSize.min,
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           mainAxisAlignment: MainAxisAlignment.start,
                            //           children: [
                            //             TextWidget(
                            //               text: "Attendance is saved successfully.",
                            //               fontSize: 16,
                            //               textAlign: TextAlign.start,
                            //               textColor: const Color(
                            //                 0xff1F1F1F,
                            //               ),
                            //               fontWeight: FontWeight.w600,
                            //             ),
                            //             VerticalSpace(height: 15),
                            //             ButtonWidget(
                            //               navigateTo: () {
                            //                 Navigator.pop(
                            //                   context,
                            //                 );
                            //
                            //               },
                            //               buttonName: 'OK',
                            //               borderRadius: 10,
                            //               height: 35,
                            //               width: screenWidth(
                            //                 context,
                            //               ),
                            //               buttonTextColor: ColorUtils.white,
                            //               buttonColor: ColorUtils.primary,
                            //             ),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // );
                            /// for fail
                            Navigator.pop(
                              mainDialogContext,
                            );
                            showDialog(
                              context: context,
                              builder:(successContext) => BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 8,
                                  sigmaY: 8,
                                ),
                                child: Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: SizedBox(
                                    height: 300,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: 17,
                                      ),
                                      padding: const EdgeInsets.all(
                                        16,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          12,
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(
                                              0xFFFFFFFF,
                                            ),
                                            Color(
                                              0xFFF8F8FF,
                                            ),
                                          ],
                                          stops: [
                                            0.0,
                                            1.0,
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: "Dear SUPER",
                                            fontSize: 16,
                                            textAlign: TextAlign.start,
                                            textColor: const Color(
                                              0xff1F1F1F,
                                            ),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          VerticalSpace(height: 5),
                                          TextWidget(
                                            text: "Time out Attendance Allready Logged for 13-jan 2026 at 15:05",
                                            fontSize: 14,
                                            textAlign: TextAlign.start,
                                            textColor: ColorUtils.red,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          VerticalSpace(height: 15),
                                          TextWidget(
                                            text: "With Your Location at",
                                            fontSize: 16,
                                            textAlign: TextAlign.start,
                                            textColor: const Color(
                                              0xff1F1F1F,
                                            ),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          VerticalSpace(height: 5),
                                          TextWidget(
                                            text: "Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, Sector 4, near Kisan Chowk (also known as Gaur Chowk)",
                                            fontSize: 14,
                                            textAlign: TextAlign.start,
                                            textColor: ColorUtils.black.withOpacity(0.8),
                                            fontWeight: FontWeight.w500,
                                          ),
                                          VerticalSpace(height: 15),
                                          ButtonWidget(
                                            navigateTo: () {
                                              Navigator.pop(
                                                successContext,
                                              );
                                            },
                                            buttonName: 'OK',
                                            borderRadius: 10,
                                            height: 35,
                                            width: screenWidth(
                                              context,
                                            ),
                                            buttonTextColor: ColorUtils.white,
                                            buttonColor: ColorUtils.primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          buttonName:
                          'Ok',
                          borderRadius:
                          10,
                          height:
                          30,
                          buttonTextColor:
                          ColorUtils.white,
                          buttonColor:
                          ColorUtils.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment:
              Alignment
                  .topCenter,
              child: Container(
                padding:
                EdgeInsets.only(
                  left:
                  14,
                  right:
                  14,
                  top: 5,
                  bottom:
                  7,
                ),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(
                    20,
                  ),
                  color: Color(
                    0xFFFFFFFF,
                  ),
                ),
                child: TextWidget(
                  text:
                  "Attendance In",
                  fontSize:
                  15.5,
                  textColor:
                  ColorUtils
                      .secondary,
                  fontWeight:
                  FontWeight
                      .w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}