import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkOrderApprove extends StatefulWidget {
  const WorkOrderApprove({super.key});

  @override
  State<WorkOrderApprove> createState() => _WorkOrderApproveState();
}

class _WorkOrderApproveState extends State<WorkOrderApprove> {

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

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

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),

            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,

              /// Dialog radius
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              /// Header (time text)
              hourMinuteTextStyle: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: ColorUtils.white,
              ),
              hourMinuteColor: ColorUtils.primary,


              /// AM / PM style
              dayPeriodTextStyle: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              dayPeriodColor: ColorUtils.primary.withOpacity(0.15),

              /// Dial
              dialHandColor: ColorUtils.primary,
              dialBackgroundColor: ColorUtils.primary.withOpacity(0.08),
              dialTextColor: ColorUtils.black,
              entryModeIconColor: ColorUtils.primary,
              dialTextStyle:  GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorUtils.black,
              ),

              /// Buttons
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
        selectedTime = picked;
      });
    }
  }

  String superExecutiveListSelectedValue = 'None';
  final List<String> superExecutiveList = [
    'None',
    'ACCOUNTS',
    'CLERK',
    'DEMOCRM',
    'DEMOEORDER',
    'DEMOERP',
    'ERP DEMO',
    'EXERCISE1',
    'FRIENDS',
    'GAURAV BANSAL',
    'KCPLADMIN',
    'KRISHNA',
    'MADMIN',
    'MANAGER LEBEL 2',
    'NEW CFA REF 1 (patiala)',
    'Namit',
    'SALES REP 1',
    'SALES REP 2',
    'SALES REP 3',
    'SALES REP 5',
    'SALES REP 5',
    'Sandeep',
    'STORES',
    'super',
    'SUPERNO',
    'SUPERYES',
    'TEST USER 1',
    'SAGAR KR',
    'RAJNEESH',
    'RAVI',
    'PRASHANT',
    'BABLU',
    'RAHUL'
  ];

  String selectedValue = 'None';

  final List<String> choiceList = [
    'None',
    'Approve',
    'Hold',
    'Cancel'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "work order approve".toUpperCase(),
              fontSize: 15,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: "CHANGE WO STATUS :",
              fontSize: 12,
              textAlign: TextAlign.start,
              textColor:ColorUtils.white.withOpacity(0.85),
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
              text: 'Choice',
              fontSize: 15,
              textColor: ColorUtils.primary,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(15),
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
              child: PopupMenuButton<String>(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: ColorUtils.white,
                onSelected: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                itemBuilder: (context) {
                  return choiceList.map((item) {
                    return PopupMenuItem<String>(
                      height: 30,
                      value: item,
                      child: TextWidget(
                        text: item,
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.black,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }).toList();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: selectedValue,
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.black,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: ColorUtils.secondary.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child:  Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                        color: ColorUtils.secondary.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpace(height: 12),
            TextWidget(
              text: 'Remark',
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
                  hintText: 'Define new remark...',
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
            VerticalSpace(height: 12),
            Spacer(),
            ButtonWidget(
              navigateTo: () {} ,
              buttonName: 'Save',
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

  void openSuperExecutiveSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            color: ColorUtils.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: ColorUtils.primary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextWidget(
                        text: 'EXECUTIVE',
                        fontSize: 16,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorUtils.red,
                          border: Border.all(
                            color: ColorUtils.red.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child:  Icon(
                          Icons.close,
                          size: 20,
                          color: ColorUtils.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// BODY LIST
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: superExecutiveList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6,),
                  itemBuilder: (_, index) {
                    final item = superExecutiveList[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          superExecutiveListSelectedValue = item;
                        });
                        Navigator.pop(context);
                      },
                      child: TextWidget(
                        text: item,
                        fontSize: 16,
                        textColor: ColorUtils.black,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
