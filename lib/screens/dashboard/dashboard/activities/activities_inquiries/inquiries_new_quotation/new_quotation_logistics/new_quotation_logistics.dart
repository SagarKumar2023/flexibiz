import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class NewQuotationLogistics extends StatefulWidget {
  const NewQuotationLogistics({super.key});

  @override
  State<NewQuotationLogistics> createState() => _NewQuotationLogisticsState();
}

class _NewQuotationLogisticsState extends State<NewQuotationLogistics> {
  final TextEditingController address1 = TextEditingController();
  final TextEditingController address2 = TextEditingController();
  final TextEditingController address3 = TextEditingController();

  @override
  void dispose() {
    address1.dispose();
    address2.dispose();
    address3.dispose();
    super.dispose();
  }

  Widget _buildInput(TextEditingController controller, String hint) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
       // color: ColorUtils.white,
        color: Color(0xfff1f2f6),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          // color: const Color(0xFFEAECF0),
          color: ColorUtils.darkText.withOpacity(0.05),
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
        focusBorderColor: Color(0xfff1f2f6),
        disableBorderColor: Color(0xfff1f2f6),
        enableBorderColor:Color(0xfff1f2f6),
        // focusBorderColor: ColorUtils.white.withOpacity(0.9),
        // disableBorderColor: ColorUtils.white.withOpacity(0.3),
        // enableBorderColor: ColorUtils.white.withOpacity(0.9),
        hintTextColor:ColorUtils.grey,
        labelTextColor:ColorUtils.grey,
        controller: controller,
        borderRadius: 10,
        hintText: hint,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context),
      width: screenWidth(context),
      decoration: CommonBoxDecorations.screenBackgroundDecoration,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ColorUtils.darkText.withOpacity(0.05),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Bill To",
                    textColor: ColorUtils.darkText,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 12),
                  _buildInput(address1, "Address 1"),
                  _buildInput(address2, "Address 2"),
                  _buildInput(address3, "Address 3"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Ship To

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: ColorUtils.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Ship To",
                    textColor: ColorUtils.darkText,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 12),
                  _buildInput(address1, "Address 1"),
                  _buildInput(address2, "Address 2"),
                  _buildInput(address3, "Address 3"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
