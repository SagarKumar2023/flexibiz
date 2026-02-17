import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckAttendanceDialog extends StatefulWidget {
  final VoidCallback onDismiss;
  final VoidCallback onOk;

  const CheckAttendanceDialog({
    super.key,
    required this.onDismiss,
    required this.onOk,
  });

  @override
  State<CheckAttendanceDialog> createState() => _CheckAttendanceDialogState();
}

class _CheckAttendanceDialogState extends State<CheckAttendanceDialog> {

  DateTime? fromDate;
  DateTime? toDate;

  Future<void> pickDate({required BuildContext context, required bool isFromDate,}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate ? (fromDate ?? DateTime.now()) : (toDate ?? DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              headerBackgroundColor: ColorUtils.primary,
              headerForegroundColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 17),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          // color: ColorUtils.lightScreenBackground,
          borderRadius: BorderRadius.circular(12),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Center(
               child: TextWidget(
                text: 'Check Attendance Between',
                fontSize: 17,
                textColor: ColorUtils.secondary,
                fontWeight: FontWeight.w700,
                             ),
             ),
            const VerticalSpace(height: 20),
            Row(
              children: [
                /// ================= DATE =================
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'From Date',
                        fontSize: 15,
                        textColor: ColorUtils.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () => pickDate(context: context, isFromDate: true),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: const Color(0xFFEAECF0)),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Image.asset(ImagesUtils.dateIcon, height: 22, color: ColorUtils.secondary),
                              const SizedBox(width: 10),
                              TextWidget(
                                text: fromDate == null
                                    ? 'Select Date'
                                    : '${fromDate!.day}/${fromDate!.month}/${fromDate!.year}',
                                fontSize: 14,
                                textColor: ColorUtils.black.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                const SizedBox(width: 10),

                /// ================= TIME =================
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'To Date',
                        fontSize: 15,
                        textColor: ColorUtils.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 5),
                      InkWell(
                        onTap: () => pickDate(context: context, isFromDate: false),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: const Color(0xFFEAECF0)),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Image.asset(ImagesUtils.dateIcon, height: 22, color: ColorUtils.secondary),
                              const SizedBox(width: 10),
                              TextWidget(
                                text: toDate == null
                                    ? 'Select Date'
                                    : '${toDate!.day}/${toDate!.month}/${toDate!.year}',
                                fontSize: 14,
                                textColor: ColorUtils.black.withOpacity(0.7),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            const VerticalSpace(height: 15),
            Row(
              children: [
                Expanded(
                  child: ButtonWidget(
                    navigateTo:widget.onDismiss ,
                    buttonName: 'Cancel',
                    borderRadius: 10,
                    height: 40,
                    buttonTextColor: ColorUtils.white,
                    buttonColor: ColorUtils.primary,
                  ),
                ),
                HorizontalSpace(width: 8),
                Expanded(
                  child: ButtonWidget(
                    navigateTo: widget.onOk,
                    buttonName: 'Ok',
                    borderRadius: 10,
                    height: 40,
                    buttonTextColor: ColorUtils.white,
                    buttonColor: ColorUtils.primary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}





