import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class NewQuotationAccounting extends StatefulWidget {
  const NewQuotationAccounting({super.key});

  @override
  State<NewQuotationAccounting> createState() => _NewQuotationAccountingState();
}

class _NewQuotationAccountingState extends State<NewQuotationAccounting> {

  final TextEditingController preparedByController = TextEditingController();
  final TextEditingController designationController = TextEditingController();

  String selectedDocumentType = "Quotation";
  @override
  void dispose() {
    preparedByController.dispose();
    designationController.dispose();
    super.dispose();
  }

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
    return Container(
      decoration: CommonBoxDecorations.screenBackgroundDecoration,
      child:  SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Prepared By
            _fieldsTitle("Quotation Prepared By"),
            VerticalSpace(height: 5),
            Container(
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
              child: TextFieldWidget(
                cursorColor: ColorUtils.grey,
                focusBorderColor: ColorUtils.white.withOpacity(0.9),
                disableBorderColor: ColorUtils.white.withOpacity(0.3),
                enableBorderColor: ColorUtils.white.withOpacity(0.9),
                hintTextColor:ColorUtils.grey,
                labelTextColor:ColorUtils.grey,
                controller: preparedByController,
                borderRadius: 10,
                hintText: "SUPER",
                keyboardType: TextInputType.visiblePassword,

              ),
            ),

            VerticalSpace(height: 12),

            /// Designation
            _fieldsTitle("Designation of Person Sending Quotation"),
            VerticalSpace(height: 5),
            Container(
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
              child: TextFieldWidget(
                cursorColor: ColorUtils.grey,
                focusBorderColor: ColorUtils.white.withOpacity(0.9),
                disableBorderColor: ColorUtils.white.withOpacity(0.3),
                enableBorderColor: ColorUtils.white.withOpacity(0.9),
                hintTextColor:ColorUtils.grey,
                labelTextColor:ColorUtils.grey,
                controller: designationController,
                borderRadius: 10,
                hintText: "Stock List",
                keyboardType: TextInputType.visiblePassword,

              ),
            ),

            VerticalSpace(height: 12),

            /// Quotation Title
            TextWidget(
              text: "Quotation Title",
              textColor: ColorUtils.primary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 4),
            Container(
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
                  documentOption(title: "Quotation"),
                  const Divider(height: 1, color: Color(0xFFEAECF0)),
                  documentOption(title: "Proforma Invoice"),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget documentOption({
    required String title,
  }) {
    final bool isSelected = selectedDocumentType == title;

    return InkWell(
      onTap: () {
        setState(() {
          selectedDocumentType = title;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            TextWidget(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              textColor:
              isSelected ? ColorUtils.darkText : ColorUtils.darkText.withOpacity(0.75),
            ),
            const Spacer(),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xff007BFF) : Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: isSelected
                      ? const Color(0xff007BFF)
                      : const Color(0xFFEAECF0),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Image(
                image: AssetImage(ImagesUtils.checkIcon),
                color: ColorUtils.white,
                height: 14,
                width: 14,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

}
