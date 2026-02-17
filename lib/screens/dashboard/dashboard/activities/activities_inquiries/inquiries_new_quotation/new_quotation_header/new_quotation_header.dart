import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class NewQuotationHeader extends StatefulWidget {
  const NewQuotationHeader({super.key});

  @override
  State<NewQuotationHeader> createState() => _NewQuotationHeaderState();
}

class _NewQuotationHeaderState extends State<NewQuotationHeader> {

  TextEditingController exchangeRateCtr = TextEditingController();
  TextEditingController paymentTermCtr = TextEditingController();
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

  String unitSelectedValue = 'None';
  final List<String> unitList = [
    'None',
    'UNIT NO 1 UNDER COMPANY 1',
    'UNIT NO 2 UNDER COMPANY 1',
    'UNIT NO 3 UNDER COMPANY 2',
    'UNIT NO 4 UNDER COMPANY 3',
    'UNIT NO 5 UNDER COMPANY 3',
    'UNIT NO 6 UNDER COMPANY 4',
    'UNIT NO 7 UNDER COMPANY 4',
    'UNIT NO 8 UNDER COMPANY 5',
    'UNIT NO 9 UNDER COMPANY 6',
    'UNIT NO 10 UNDER COMPANY 6',
  ];

  String currencySelectedValue = 'None';
  final List<String> currencyList = [
    'None',
    'AUSTRALIAN DOLLAR (AUD)',
    'UNITED STATES DOLLAR (USD)',
    'INDIAN RUPEE (INR)',
    'EURO (EUR)',
    'BRITISH POUND (GBP)',
    'JAPANESE YEN (JPY)',
    'CANADIAN DOLLAR (CAD)',
    'SINGAPORE DOLLAR (SGD)',
    'UAE DIRHAM (AED)',
    'SWISS FRANC (CHF)',
  ];

  final List<String> customerList = [
    'Amit Kumar',
    'Ravi Sharma',
    'Neha Verma',
    'Suresh Singh',
    'Pooja Gupta',
  ];

  final List<TotalItemValueModel> totalItemList = [
    TotalItemValueModel(
      itemCount: "1",
      itemAmount: "100.00",
      itemTaxesCount: "0",
      itemTaxesAmount: "0.00",
      itemDiscountCount: "1",
      itemDiscountAmount: "10.00",
      itemQuotationValue: "90.00",
    ),
    TotalItemValueModel(
      itemCount: "2",
      itemAmount: "250.50",
      itemTaxesCount: "1",
      itemTaxesAmount: "12.50",
      itemDiscountCount: "0",
      itemDiscountAmount: "0.00",
      itemQuotationValue: "263.00",
    ),
    TotalItemValueModel(
      itemCount: "3",
      itemAmount: "780.00",
      itemTaxesCount: "2",
      itemTaxesAmount: "39.00",
      itemDiscountCount: "1",
      itemDiscountAmount: "25.00",
      itemQuotationValue: "794.00",
    ),

  ];


  Widget _fieldsTitle(String title) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextWidget(
          text: title,
          textColor: ColorUtils.primary,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        Positioned(
          right: -6,
          top: 0,
          child: Container(
            width: 6,
            height: 6,
            margin: EdgeInsets.only(left: 5),
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(12),
      height: screenHeight(context),
      width: screenWidth(context),
      decoration: CommonBoxDecorations.screenBackgroundDecoration,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fieldsTitle("Unit"),
            const VerticalSpace(height: 5),
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
                    unitSelectedValue = value;
                  });
                },
                itemBuilder: (context) {
                  return unitList.map((item) {
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
                      text: unitSelectedValue,
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
            _fieldsTitle("Customer"),
            const VerticalSpace(height: 5),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: ColorUtils.white,
                borderRadius: BorderRadius.circular(10),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// CUSTOMER LIST COLUMN
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: customerList.map((customer) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: TextWidget(
                          text: customer,
                          fontSize: 14,
                          textColor: ColorUtils.darkText,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }).toList(),
                  ),
        
                  /// CHECK OUT
                  TextWidget(
                    text: 'Check Out',
                    fontSize: 13,
                    textColor: ColorUtils.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            VerticalSpace(height: 10),
            _fieldsTitle("Currency"),
            const VerticalSpace(height: 5),
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
                    currencySelectedValue = value;
                  });
                },
                itemBuilder: (context) {
                  return currencyList.map((item) {
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
                      text: currencySelectedValue,
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _fieldsTitle("Exchange Rate"),
                      const SizedBox(height: 5),
                      Container(
                        height: 45,
                        width: double.infinity,
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
                        child: Center(
                          child: TextFieldWidget(
                            cursorColor: ColorUtils.grey,
                            focusBorderColor: ColorUtils.white.withOpacity(0.9),
                            disableBorderColor: ColorUtils.white.withOpacity(0.3),
                            enableBorderColor: ColorUtils.white.withOpacity(0.9),
                            hintTextColor:ColorUtils.grey,
                            labelTextColor:ColorUtils.grey,
                            controller: exchangeRateCtr,
                            borderRadius: 30,
                            hintText: "Enter Rate",
                            keyboardType: TextInputType.visiblePassword,
                            enabled: true, // always enabled
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        
                const SizedBox(width: 10),
        
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Quotation valid up to',
                        fontSize: 14,
                        textColor: ColorUtils.primary,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(height: 5),
                      InkWell(
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
                    ],
                  ),
                ),
              ],
            ),
            VerticalSpace(height: 10),
            _fieldsTitle("Payment Terms"),
            const VerticalSpace(height: 5),
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
                    color: const Color(0xFF43474D).withOpacity(0.06),
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
                controller: paymentTermCtr,
                borderRadius: 10,
                hintText: "Enter Payment Terms",
                keyboardType: TextInputType.text,
                enabled: true,
                suffixIcon: Container(
                  height: 30,
                  width: 30,
                  padding: const EdgeInsets.all(10),
                  child:Image(image: AssetImage(ImagesUtils.amountIcon),color:ColorUtils.grey.withOpacity(0.7),)
                ),
              ),
            ),

            VerticalSpace(height: 10),
        
            _fieldsTitle("Additional Info"),
        
            const SizedBox(height: 5),
            Container(
              height: 100,
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
                  hintText: 'Additional Info',
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
            _fieldsTitle("Total Item Value"),
            const VerticalSpace(height: 5),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              // padding: EdgeInsets.all(10),
              itemCount: totalItemList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = totalItemList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.circular(11),
                    border: Border.all(color: const Color(0xFFEAECF0)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(
                          0xFF43474D,
                        ).withOpacity(0.06),
                        blurRadius: 60,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        /// LEFT INFO
                        Expanded(
                          flex: 5,
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                LabelValueWidget(
                                  label: "Item (${item.itemCount})",
                                  value: item.itemAmount,
                                ),
                                LabelValueWidget(
                                  label: "Taxes (${item.itemTaxesCount})",
                                  value: item.itemTaxesAmount,
                                ),
                                LabelValueWidget(
                                  label: "Discount (${item.itemDiscountCount})",
                                  value: item.itemDiscountAmount,
                                ),
                                LabelValueWidget(
                                  label: "Quotation Value",
                                  value: item.itemQuotationValue,
                                ),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
            VerticalSpace(height: 10),          ],
        ),
      ),
    );
  }
}

class TotalItemValueModel {
  final String itemCount;
  final String itemAmount;
  final String itemTaxesCount;
  final String itemTaxesAmount;
  final String itemDiscountCount;
  final String itemDiscountAmount;
  final String itemQuotationValue;


  TotalItemValueModel({
    required this.itemCount,
    required this.itemAmount,
    required this.itemTaxesCount,
    required this.itemTaxesAmount,
    required this.itemDiscountCount,
    required this.itemDiscountAmount,
    required this.itemQuotationValue,

  });
}
