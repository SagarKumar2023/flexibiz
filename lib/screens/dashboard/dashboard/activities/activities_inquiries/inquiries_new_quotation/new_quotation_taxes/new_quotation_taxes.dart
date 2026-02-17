import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_taxes/new_quotation_taxes_values.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class NewQuotationTaxes extends StatefulWidget {
  const NewQuotationTaxes({super.key});

  @override
  State<NewQuotationTaxes> createState() => _NewQuotationTaxesState();
}

class _NewQuotationTaxesState extends State<NewQuotationTaxes> {

  final List<Map<String, dynamic>> taxesRate = [
    {
      "Category": "DESIGN CHARGES",
      "rate": "0.0",
      "value": "0.0",
      "rateQuantity": TextEditingController(),
      "rateValue": TextEditingController(),
    },
    {
      "Category": "INSURANCE",
      "rate": "0.0",
      "value": "0.0",
      "rateQuantity": TextEditingController(),
      "rateValue": TextEditingController(),
    },
    {
      "Category": "FREIGHT",
      "rate": "0.0",
      "value": "0.0",
      "rateQuantity": TextEditingController(),
      "rateValue": TextEditingController(),
    },
    {
      "Category": "MISC EXPENSES",
      "rate": "0.0",
      "value": "0.0",
      "rateQuantity": TextEditingController(),
      "rateValue": TextEditingController(),
    },
    {
      "Category": "GST",
      "rate": "0.0",
      "value": "0.0",
      "rateQuantity": TextEditingController(),
      "rateValue": TextEditingController(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: taxesRate.length,
          itemBuilder: (context, index) {
            final item = taxesRate[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: ColorUtils.white,
                borderRadius: BorderRadius.circular(11),
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
              child: Column(
                children: [

                  /// Header
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: item["Category"],
                          fontSize: 14,
                          textColor: ColorUtils.darkText,
                          fontWeight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: ()  {
                            showDialog(
                              context: context,
                              builder: (_) => NewQuotationTaxesEditDialog(
                                  designCharge: TextEditingController(),
                                  rateCtr: TextEditingController(),
                                  valueCtr: TextEditingController(),
                                  cancelOnTap: (){},
                                  saveOnTap: (){}
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: ColorUtils.primary.withOpacity(.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(Icons.edit, color: ColorUtils.primary, size: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(height: 1.5,color: ColorUtils.darkText.withOpacity(0.2),),
                  /// Rate & Value
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Rate',
                                fontSize: 14,
                                textColor: ColorUtils.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 45,
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 12,left: 14),
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: ColorUtils.white,
                                  border: Border.all(
                                    color: const Color(0xFFEAECF0),
                                    width: 1,
                                  ),
                                ),
                                child: TextWidget(
                                  text: '5363.00',
                                  fontSize: 14,
                                  textColor: ColorUtils.darkText,
                                  fontWeight: FontWeight.w500,
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
                                text: 'Value',
                                fontSize: 14,
                                textColor: ColorUtils.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(height: 5),
                              Container(
                                height: 45,
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 12,left: 14),
                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color: ColorUtils.white,
                                  border: Border.all(
                                    color: const Color(0xFFEAECF0),
                                    width: 1,
                                  ),

                                ),
                                child: TextWidget(
                                  text: '0.0',
                                  fontSize: 14,
                                  textColor: ColorUtils.darkText,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
