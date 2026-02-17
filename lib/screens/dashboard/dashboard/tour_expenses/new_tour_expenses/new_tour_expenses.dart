import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/local_database/hive_database_utils/hive_database.dart';
import 'package:flexibiz/local_database/hive_model/new_tour_expense_hive_model/new_tour_expense_hive_model.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTourExpenses extends StatefulWidget {
  const NewTourExpenses({super.key});

  @override
  State<NewTourExpenses> createState() => _NewTourExpensesState();
}

class _NewTourExpensesState extends State<NewTourExpenses> {

  DateTime? selectedDate;
  // Future<void> pickDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate ?? DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //
  //     builder: (context, child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: ColorScheme.light(
  //             primary: ColorUtils.primary,
  //             onPrimary: Colors.white,
  //             onSurface: Colors.black,
  //           ),
  //           datePickerTheme: DatePickerThemeData(
  //             backgroundColor: Colors.white,
  //             yearStyle: GoogleFonts.montserrat(
  //               textStyle: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w500,
  //                 color: ColorUtils.black,
  //               ),
  //             ),
  //             /// Dialog radius
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //
  //             /// Top header
  //             headerBackgroundColor: ColorUtils.primary,
  //             headerForegroundColor: Colors.white,
  //
  //             /// Hide edit icon
  //             headerHelpStyle:GoogleFonts.montserrat(
  //               textStyle: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w500,
  //                 color: ColorUtils.black,
  //               ),
  //             ),
  //
  //             ///  Show ONLY YEAR
  //             headerHeadlineStyle:  GoogleFonts.montserrat(
  //               textStyle: TextStyle(
  //                 fontSize: 28,
  //                 fontWeight: FontWeight.w700,
  //                 color: ColorUtils.black,
  //               ),
  //             ),

  //             /// Month-Year row background
  //             dividerColor: Colors.transparent,
  //
  //             dayStyle:  GoogleFonts.montserrat(
  //               textStyle: TextStyle(
  //                 fontSize: 15,
  //                 fontWeight: FontWeight.w500,
  //                 color: ColorUtils.black,
  //               ),
  //             ),
  //
  //             /// Normal day background
  //             dayBackgroundColor: MaterialStateProperty.resolveWith(
  //                   (states) {
  //                 if (states.contains(MaterialState.selected)) {
  //                   return ColorUtils.primary;
  //                 }
  //                 return Colors.white;
  //               },
  //             ),
  //
  //             /// Day text color
  //             dayForegroundColor: MaterialStateProperty.resolveWith(
  //                   (states) {
  //                 if (states.contains(MaterialState.selected)) {
  //                   return Colors.white;
  //                 }
  //                 return ColorUtils.black;
  //               },
  //             ),
  //             weekdayStyle: GoogleFonts.montserrat(
  //               textStyle: TextStyle(
  //                 fontSize:15,
  //                 fontWeight: FontWeight.w600,
  //                 color: ColorUtils.black.withOpacity(0.8),
  //               ),
  //             ),
  //
  //             cancelButtonStyle: ButtonStyle(
  //               textStyle: MaterialStateProperty.all(
  //                 GoogleFonts.montserrat(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               foregroundColor: MaterialStateProperty.all(
  //                 ColorUtils.grey,
  //               ),
  //             ),
  //
  //             confirmButtonStyle: ButtonStyle(
  //               textStyle: MaterialStateProperty.all(
  //                 GoogleFonts.montserrat(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //               ),
  //               foregroundColor: MaterialStateProperty.all(
  //                 ColorUtils.primary,
  //               ),
  //             ),
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (picked != null) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }


  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
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

              /// Day text color (normal, selected, disabled)
              dayForegroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey; // 👈 not selectable dates
                  }
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return ColorUtils.darkText;
                },
              ),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

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


  String tourListSelectedValue = 'None';

  final List<String> tourPlacesList = [
    'None',
    'Agra',
    'Jaipur',
    'Delhi',
    'Varanasi',
    'Goa',
    'Mumbai',
    'Pune',
    'Udaipur',
    'Jodhpur',
    'Jaisalmer',
    'Rishikesh',
    'Haridwar',
    'Shimla',
    'Manali',
    'Kullu',
    'Pahalgam',
  ];

  TextEditingController amountCtr = TextEditingController();
  TextEditingController remarkCtr = TextEditingController();

  void _validateAndSubmit() async {

    /// 1️ Tour place validation
    if (tourListSelectedValue == 'None') {
      SnackBarUtils.showWarning(
        'Warning',
        'Please select tour place',
      );
      return;
    }

    /// 2️Date validation
    if (selectedDate == null) {
      SnackBarUtils.showWarning(
        'Warning',
        'Please select tour date',
      );
      return;
    }

    /// 3️ Amount validation
    if (amountCtr.text.trim().isEmpty) {
      SnackBarUtils.showWarning(
        'Warning',
        'Please enter amount',
      );
      return;
    }

    /// 4️Save to Hive
    final model = NewTourExpenseHiveModel(
      tourName: tourListSelectedValue,
      tourDate: selectedDate!.toIso8601String(),
      tourRemark: remarkCtr.text.trim(),
      tourAmount: amountCtr.text.trim(),
    );

    final box = HiveDatabase.newTourExpenseDB();
    await box.add(model);

    ///  Success message (optional)
    SnackBarUtils.showSuccess(
      'Success',
      'Tour expense added successfully',
    );

    ///  Back
    Navigator.of(context).pop();
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
        title: TextWidget(
          text: "new tour expenses".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ButtonWidget(
          navigateTo: _validateAndSubmit,
          buttonName: 'Submit',
          borderRadius: 30,
          width: double.infinity,
          height: 50,
          buttonTextColor: ColorUtils.white,
          buttonColor: ColorUtils.primary,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: 'Select Tour',
                fontSize: 15,
                textAlign: TextAlign.center,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
              const VerticalSpace(height: 5),
              Container(
                padding: EdgeInsets.all(15), /// parennt ko padding 15 milna chaiye PopupMenuButton 0
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
                  padding: EdgeInsets.zero,
                  offset: const Offset(0, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: ColorUtils.white,
                  onSelected: (value) {
                    setState(() {
                      tourListSelectedValue = value;
                    });
                  },
                  itemBuilder: (context) {
                    return tourPlacesList.map((item) {
                      return PopupMenuItem<String>(
                        height: 30,
                        value: item,
                        padding: EdgeInsets.only(left: 10,right: 50),
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
                        text: tourListSelectedValue,
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
              VerticalSpace(height: 10),
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
              VerticalSpace(height: 10),

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
                    hintText: 'Remarks',
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
              VerticalSpace(height: 10),
              TextWidget(
                text: 'Amount',
                fontSize: 15,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xFFEAECF0),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06), // #43474D0F ≈ 6% opacity
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: TextFieldWidget(
                  cursorColor: ColorUtils.grey,
                  focusBorderColor: ColorUtils.white.withOpacity(0.9),
                  disableBorderColor: ColorUtils.white.withOpacity(0.3),
                  enableBorderColor: ColorUtils.white.withOpacity(0.9),
                  hintTextColor:ColorUtils.grey,
                  labelTextColor:ColorUtils.grey,
                  controller: amountCtr,
                  borderRadius: 30,
                  hintText: "Enter Amount",
                  keyboardType: TextInputType.number,
                  enabled: true,
                  suffixIcon: InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.all(13),
                      child: Image(
                          height: 20,
                          width:20,
                          color:  ColorUtils.grey.withOpacity(0.65),
                          image: AssetImage(ImagesUtils.amountIcon)
                      ),
                    ),
                  ),
                ),
              ),
              VerticalSpace(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}