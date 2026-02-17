import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesNoteEdit extends StatefulWidget {
  const ActivitiesNoteEdit({super.key});

  @override
  State<ActivitiesNoteEdit> createState() => _ActivitiesNoteEditState();
}

class _ActivitiesNoteEditState extends State<ActivitiesNoteEdit> {

  DateTime? selectedDate;
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
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
              yearStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black,
                ),
              ),
              /// Dialog radius
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              /// Top header
              headerBackgroundColor: ColorUtils.primary,
              headerForegroundColor: Colors.white,

              /// Hide edit icon
              headerHelpStyle:GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black,
                ),
              ),

              ///  Show ONLY YEAR
              headerHeadlineStyle:  GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: ColorUtils.black,
                ),
              ),

              /// Month-Year row background
              dividerColor: Colors.transparent,

              dayStyle:  GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black,
                ),
              ),

              /// Normal day background
              dayBackgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (states.contains(MaterialState.selected)) {
                    return ColorUtils.primary;
                  }
                  return Colors.white;
                },
              ),

              /// Day text color
              dayForegroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return ColorUtils.black;
                },
              ),
              weekdayStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.black.withOpacity(0.8),
                ),
              ),

              cancelButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  ColorUtils.grey,
                ),
              ),

              confirmButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  ColorUtils.primary,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  TextEditingController remarkCtr = TextEditingController();
  TextEditingController titleCtr = TextEditingController();

  void _validateAndSubmitNote() {

    final String title = titleCtr.text.trim();
    final String remark = remarkCtr.text.trim();

    // ===== Date Validation =====
    if (selectedDate == null) {
      SnackBarUtils.showWarning('Warning', 'Please select date.');
      return;
    }

    // ===== Title Validation =====
    if (title.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Title cannot be empty.');
      return;
    }
    if (title.length < 3) {
      SnackBarUtils.showWarning(
          'Warning', 'Title must be at least 3 characters long.');
      return;
    }

    // ===== Remark Validation =====
    if (remark.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Remark cannot be empty.');
      return;
    }
    if (remark.length < 5) {
      SnackBarUtils.showWarning(
          'Warning', 'Remark must be at least 5 characters long.');
      return;
    }

    /// All validations passed
    final DateTime finalDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
    );

    // final data = {
    //   "title": title,
    //   "remark": remark,
    //   "assignedTo": superExecutiveListSelectedValue,
    //   "dateTime": finalDateTime.toIso8601String(),
    // };

    /// Call your API / controller here
    // taskController.addTask(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: "Create Note".toUpperCase(),
              textColor: ColorUtils.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: "Flexibiz erp",
              textColor: ColorUtils.white.withOpacity(0.7),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: 'Date',
              fontSize: 15,
              textColor: ColorUtils.primary,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            InkWell(
              // onTap: () => pickStyledDate(context),
              onTap: () => pickDate(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: ColorUtils.white,
                  border: Border.all(
                    color: const Color(0xFFEAECF0),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(ImagesUtils.dateIcon),height: 24,color: ColorUtils.secondary,),
                    HorizontalSpace(width: 15),
                    TextWidget(
                      text: selectedDate == null
                          ? 'Select Date'
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                      fontSize: 14,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: 12),
            TextWidget(
              text: 'Title',
              fontSize: 15,
              textColor: ColorUtils.primary,
              fontWeight: FontWeight.w500,
            ),
            VerticalSpace(height: 5),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.only(left: 8,right: 8),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: ColorUtils.white,
                border: Border.all(
                  color: const Color(0xFFEAECF0),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF43474D).withOpacity(0.06),
                    blurRadius: 60,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: TextField(
                controller: titleCtr,
                maxLines: 10,
                minLines: 1,
                expands: false,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color:ColorUtils.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500
                  ),
                ),
                decoration:  InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            VerticalSpace(height: 12),
            TextWidget(
              text: 'Remarks',
              fontSize: 15,
              textColor: ColorUtils.primary,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            Container(
              height: 130,
              width: screenWidth(context),
              padding: const EdgeInsets.only(left: 8,right: 8),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: ColorUtils.white,
                border: Border.all(
                  color: const Color(0xFFEAECF0),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF43474D).withOpacity(0.06),
                    blurRadius: 60,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: TextField(
                controller: remarkCtr,
                maxLines: 10,
                minLines: 1,
                expands: false,
                keyboardType: TextInputType.multiline,
                textAlignVertical: TextAlignVertical.top,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color:ColorUtils.black.withOpacity(0.8),
                      fontWeight: FontWeight.w500
                  ),
                ),
                decoration:  InputDecoration(
                  hintText: 'Define New Note...',
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 14,
                        color:ColorUtils.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
            ),

            Spacer(),
            ButtonWidget(
              navigateTo:_validateAndSubmitNote,
              buttonName: 'Submit',
              borderRadius: 30,
              width: screenWidth(context),
              height: 50,
              buttonTextColor: ColorUtils.white,
              buttonColor: ColorUtils.primary,
            ),
            VerticalSpace(height: 10),

          ],
        ),
      ),
    );
  }
}
