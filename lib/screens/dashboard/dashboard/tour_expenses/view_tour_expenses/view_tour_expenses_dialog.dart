import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/view_tour_expenses/view_tour_expenses_screen/view_tour_expenses_screen.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ViewTourExpensesDialog extends StatefulWidget {

  const ViewTourExpensesDialog({
    super.key,
  });

  @override
  State<ViewTourExpensesDialog> createState() => _ViewTourExpensesDialogState();
}

class _ViewTourExpensesDialogState extends State<ViewTourExpensesDialog> {

  DateTime? fromDate;
  DateTime? toDate;

  /// ---------- THEMED DATE PICKER ----------
  Future<void> pickDate({required bool isFrom}) async {
    final DateTime initialDate =
    isFrom ? (fromDate ?? DateTime.now()) : (toDate ?? fromDate!);

    final DateTime firstDate =
    isFrom ? DateTime(2000) : (fromDate ?? DateTime(2000));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
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

              headerHeadlineStyle: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),

              yearStyle: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: ColorUtils.black,
              ),

              dayStyle: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: ColorUtils.black,
              ),

              weekdayStyle: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorUtils.black.withOpacity(0.8),
              ),

              dayBackgroundColor: MaterialStateProperty.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                    ? ColorUtils.primary
                    : Colors.white,
              ),

              dayForegroundColor: MaterialStateProperty.resolveWith(
                    (states) => states.contains(MaterialState.selected)
                    ? Colors.white
                    : ColorUtils.black,
              ),

              cancelButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor:
                MaterialStateProperty.all(ColorUtils.grey),
              ),

              confirmButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor:
                MaterialStateProperty.all(ColorUtils.primary),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
          if (toDate != null && toDate!.isBefore(fromDate!)) {
            toDate = null;
          }
        } else {
          toDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return 'Select date';
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  Widget _dateBox(String text) {
    return Container(
      width: screenWidth(context),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFEAECF0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF43474D).withOpacity(0.06),
            blurRadius: 60,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: TextWidget(
        text: text,
        fontSize: 14,
        textColor:
        text == 'Select date' ? ColorUtils.grey : const Color(0xff1F1F1F),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 185,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              text: 'From',
                              fontSize: 15,
                              textColor: Color(0xff1F1F1F),
                              fontWeight: FontWeight.w500,
                            ),
                            const VerticalSpace(height: 5),
                            InkWell(
                              onTap: () => pickDate(isFrom: true),
                              child: _dateBox(_formatDate(fromDate)),
                            ),
                          ],
                        ),
                      ),
                      const HorizontalSpace(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextWidget(
                              text: 'To',
                              fontSize: 15,
                              textColor: Color(0xff1F1F1F),
                              fontWeight: FontWeight.w500,
                            ),
                            const VerticalSpace(height: 5),
                            InkWell(
                              onTap: fromDate == null
                                  ? null
                                  : () => pickDate(isFrom: false),
                              child: _dateBox(_formatDate(toDate)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const VerticalSpace(height: 14),

                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () => Navigator.pop(context),
                          buttonName: 'Cancel',
                          borderRadius: 10,
                          height: 40,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                      const HorizontalSpace(width: 8),
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: () {
                            if (fromDate == null || toDate == null) {
                              SnackBarUtils.showWarning(
                                'Warning',
                                'Please select both dates',
                              );
                              return;
                            }

                            Navigator.pop(context);

                            ScreenNavigationUtils.push(
                              context,
                              child: ViewTourExpensesScreen(
                                fromDate: fromDate!,
                                toDate: toDate!,
                              ),
                              type: PageTransitionType.fade,
                            );
                          },

                          buttonName: 'Ok',
                          borderRadius: 10,
                          height: 40,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// TITLE
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
                  text: "View Tour Details",
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
}