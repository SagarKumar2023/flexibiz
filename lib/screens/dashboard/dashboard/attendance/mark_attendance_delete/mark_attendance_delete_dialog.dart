import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MarkAttendanceDeleteDialog extends StatefulWidget {
  const MarkAttendanceDeleteDialog({super.key});

  @override
  State<MarkAttendanceDeleteDialog> createState() => _MarkAttendanceDeleteDialogState();
}

class _MarkAttendanceDeleteDialogState extends State<MarkAttendanceDeleteDialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 17),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFFFFFF), Color(0xFFF8F8FF)],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VerticalSpace(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () {
                            // Navigator.pop(context);
                            inDialog();
                          },
                          buttonName: 'In',
                          borderRadius: 10,
                          height: 30,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                      HorizontalSpace(width: 8),
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () {
                            outDialog();
                          },
                          buttonName: 'Out',
                          borderRadius: 10,
                          height: 30,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                      HorizontalSpace(width: 8),
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () {
                            bothDialog();
                          },
                          buttonName: 'Both',
                          borderRadius: 10,
                          height: 30,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                    ],
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
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFFFFFF),
                ),
                child: TextWidget(
                  text: "Delete Attendance?",
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

  void inDialog(){
    showDialog(
      context: context,
      builder: (inDialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 17),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFF8F8FF),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const VerticalSpace(height: 10),
                    TextWidget(
                      text:
                      "Are you sure want to delete your attendance?",
                      fontSize: 15,
                      textAlign: TextAlign.start,
                      textColor: const Color(
                        0xff1F1F1F,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                    const VerticalSpace(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            navigateTo: () {
                              Navigator.pop(inDialogContext);
                            },
                            buttonName: 'Cancel',
                            borderRadius: 10,
                            height: 35,
                            width: screenWidth(context),
                            buttonTextColor:
                            ColorUtils.white,
                            buttonColor:
                            ColorUtils.primary,
                          ),
                        ),
                        HorizontalSpace(width: 8),
                        Expanded(
                          child: ButtonWidget(
                            navigateTo: () {
                              Navigator.pop(inDialogContext);
                              showDialog(
                                context: context,
                                builder: (inDialogOkContext) => Dialog(
                                  backgroundColor: Colors.transparent,
                                  insetPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: SizedBox(
                                    height: 185,
                                    child: Container(
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
                                            height: 8,
                                          ),
                                          TextWidget(
                                            text:
                                            "Attendance In Deleted successfully for today.",
                                            fontSize:
                                            16,
                                            textAlign:
                                            TextAlign
                                                .start,
                                            textColor:
                                            ColorUtils
                                                .black,
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                          ),
                                          const VerticalSpace(
                                            height: 5,
                                          ),
                                          TextWidget(
                                            text:
                                            "You can Mark Attendance again...",
                                            fontSize:
                                            15,
                                            textAlign:
                                            TextAlign
                                                .start,
                                            textColor:
                                            const Color(
                                              0xff1F1F1F,
                                            ),
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                          ),
                                          const VerticalSpace(
                                            height: 14,
                                          ),
                                          ButtonWidget(
                                            navigateTo: () {
                                              Navigator.pop(
                                                inDialogOkContext,
                                              );
                                            },
                                            buttonName:
                                            'Ok',
                                            borderRadius:
                                            10,
                                            height: 35,
                                            width:
                                            screenWidth(
                                              context,
                                            ),
                                            buttonTextColor:
                                            ColorUtils
                                                .white,
                                            buttonColor:
                                            ColorUtils
                                                .primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            buttonName: 'Ok',
                            borderRadius: 10,
                            height: 35,
                            width: screenWidth(context),
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
                    color: Color(0xFFFFFFFF),
                  ),
                  child: TextWidget(
                    text: "Delete Attendance In?",
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
  }

  void outDialog(){
    showDialog(
      context: context,
      builder: (outDialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 17),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFF8F8FF),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const VerticalSpace(height: 10),
                    TextWidget(
                      text:
                      "Are you sure want to delete your attendance?",
                      fontSize: 15,
                      textAlign: TextAlign.start,
                      textColor: const Color(
                        0xff1F1F1F,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                    const VerticalSpace(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            navigateTo: () {
                              Navigator.pop(outDialogContext);
                            },
                            buttonName: 'Cancel',
                            borderRadius: 10,
                            height: 35,
                            width: screenWidth(context),
                            buttonTextColor:
                            ColorUtils.white,
                            buttonColor:
                            ColorUtils.primary,
                          ),
                        ),
                        HorizontalSpace(width: 8),
                        Expanded(
                          child: ButtonWidget(
                            navigateTo: () {
                              Navigator.pop(outDialogContext);
                              showDialog(
                                context: context,
                                builder: (outDialogSuccessContext) => Dialog(
                                  backgroundColor:
                                  Colors
                                      .transparent,
                                  insetPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: SizedBox(
                                    height: 185,
                                    child: Container(
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
                                            height: 8,
                                          ),
                                          TextWidget(
                                            text:
                                            "Attendance Out Deleted successfully for today.",
                                            fontSize:
                                            16,
                                            textAlign:
                                            TextAlign
                                                .start,
                                            textColor:
                                            ColorUtils
                                                .black,
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                          ),
                                          const VerticalSpace(
                                            height: 5,
                                          ),
                                          TextWidget(
                                            text:
                                            "You can Mark Attendance again...",
                                            fontSize:
                                            15,
                                            textAlign:
                                            TextAlign
                                                .start,
                                            textColor:
                                            const Color(
                                              0xff1F1F1F,
                                            ),
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                          ),
                                          const VerticalSpace(
                                            height: 14,
                                          ),
                                          ButtonWidget(
                                            navigateTo: () {
                                              Navigator.pop(
                                                outDialogSuccessContext,
                                              );
                                            },
                                            buttonName:
                                            'Ok',
                                            borderRadius:
                                            10,
                                            height: 35,
                                            width:
                                            screenWidth(
                                              context,
                                            ),
                                            buttonTextColor:
                                            ColorUtils
                                                .white,
                                            buttonColor:
                                            ColorUtils
                                                .primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            buttonName: 'Ok',
                            borderRadius: 10,
                            height: 35,
                            width: screenWidth(context),
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
                    color: Color(0xFFFFFFFF),
                  ),
                  child: TextWidget(
                    text: "Delete Attendance Out?",
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
  }

  void bothDialog(){
    showDialog(
      context: context,
      builder: (bothDialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SizedBox(
          height: 200,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 17),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFF8F8FF),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const VerticalSpace(height: 10),
                    TextWidget(
                      text:
                      "Are you sure want to delete your attendance?",
                      fontSize: 15,
                      textAlign: TextAlign.start,
                      textColor: const Color(
                        0xff1F1F1F,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                    const VerticalSpace(height: 14),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonWidget(
                            navigateTo: () {
                              Navigator.pop(bothDialogContext);
                            },
                            buttonName: 'Cancel',
                            borderRadius: 10,
                            height: 35,
                            width: screenWidth(context),
                            buttonTextColor:
                            ColorUtils.white,
                            buttonColor:
                            ColorUtils.primary,
                          ),
                        ),
                        HorizontalSpace(width: 8),
                        Expanded(
                          child: ButtonWidget(
                            navigateTo: () {
                              Navigator.pop(bothDialogContext);
                              showDialog(
                                context: context,
                                builder: (bothDialogSuccessContext) => Dialog(
                                  backgroundColor:
                                  Colors
                                      .transparent,
                                  insetPadding:
                                  const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: SizedBox(
                                    height: 185,
                                    child: Container(
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
                                            height: 8,
                                          ),
                                          TextWidget(
                                            text:
                                            "Attendance Out Deleted successfully for today.",
                                            fontSize:
                                            16,
                                            textAlign:
                                            TextAlign
                                                .start,
                                            textColor:
                                            ColorUtils
                                                .black,
                                            fontWeight:
                                            FontWeight
                                                .w600,
                                          ),
                                          const VerticalSpace(
                                            height: 5,
                                          ),
                                          TextWidget(
                                            text:
                                            "You can Mark Attendance again...",
                                            fontSize:
                                            15,
                                            textAlign:
                                            TextAlign
                                                .start,
                                            textColor:
                                            const Color(
                                              0xff1F1F1F,
                                            ),
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                          ),
                                          const VerticalSpace(
                                            height: 14,
                                          ),
                                          ButtonWidget(
                                            navigateTo: () {
                                              Navigator.pop(
                                                bothDialogSuccessContext,
                                              );
                                            },
                                            buttonName:
                                            'Ok',
                                            borderRadius:
                                            10,
                                            height: 35,
                                            width:
                                            screenWidth(
                                              context,
                                            ),
                                            buttonTextColor:
                                            ColorUtils
                                                .white,
                                            buttonColor:
                                            ColorUtils
                                                .primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            buttonName: 'Ok',
                            borderRadius: 10,
                            height: 35,
                            width: screenWidth(context),
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
                    color: Color(0xFFFFFFFF),
                  ),
                  child: TextWidget(
                    text: "Delete Attendance Both?",
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
  }
}