import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class NewQuotationTerms extends StatefulWidget {
  const NewQuotationTerms({super.key});

  @override
  State<NewQuotationTerms> createState() => _NewQuotationTermsState();
}

class _NewQuotationTermsState extends State<NewQuotationTerms> {
  final List<Map<String, dynamic>> terms = [
    {"terms": "Price subject to change any date without any prior notice.", "isSelected": false},
    {"terms": "Variations Permissible: +/-2% in size, +/-10% in Quantity, +/-5% in thickness.", "isSelected": false},
    {"terms": "Delivery Period: Delivery within 15 to 17 working days from the date of PO issue.", "isSelected": false},
    {"terms": "Payment terms: 50% Advance; Balance Against Proforma invoice.", "isSelected": false},
    {"terms": "Duties/Taxes applicable shall be charged additionally.", "isSelected": false},
    {"terms": "hmgqwedfgyh;lk;", "isSelected": false},
    {"terms": "nvhgfigub", "isSelected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      body: Container(
        // padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          children: [
            /// Header text
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.all(14),
              color: ColorUtils.darkText.withOpacity(0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                    text: "Dear User,",
                    textColor: ColorUtils.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                  const SizedBox(height: 1),
                  TextWidget(
                    text: "Please select the terms applicable for this quotation.",
                    textColor: ColorUtils.secondary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ],
              ),
            ),

            /// Terms list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: terms.length,
                itemBuilder: (context, index) {
                  final item = terms[index];
                  final bool isChecked = item["isSelected"] ?? false;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        item["isSelected"] = !isChecked;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(12),
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
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// TERMS TEXT
                          Expanded(
                            child: TextWidget(
                              text: item["terms"],
                              textColor: ColorUtils.darkText,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          HorizontalSpace(width: 8),

                          /// CUSTOM CHECKBOX
                          InkWell(
                            onTap: () {
                              setState(() {
                                item["isSelected"] = !isChecked;
                              });
                            },
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: isChecked
                                    ? const Color(0xff007BFF)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: isChecked
                                      ? const Color(0xff007BFF)
                                      : const Color(0xFFEAECF0),
                                  width: 2,
                                ),
                              ),
                              child: isChecked
                                  ? Image(
                                image:
                                AssetImage(ImagesUtils.checkIcon),
                                color: ColorUtils.white,
                                height: 14,
                                width: 14,
                              )
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
