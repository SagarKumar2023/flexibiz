import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';

class NewQuotationTaxesEditDialog extends StatefulWidget {
  final TextEditingController designCharge;
  final TextEditingController rateCtr;
  final TextEditingController valueCtr;
  final VoidCallback cancelOnTap;
  final VoidCallback saveOnTap;



  const NewQuotationTaxesEditDialog({
    super.key,
    required this.designCharge,
    required this.rateCtr,
    required this.valueCtr,
    required this.cancelOnTap,
    required this.saveOnTap,

  });

  @override
  State<NewQuotationTaxesEditDialog> createState() => _NewQuotationTaxesEditDialogState();
}

class _NewQuotationTaxesEditDialogState extends State<NewQuotationTaxesEditDialog> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFF8F8FF)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TextWidget(
                text: 'Design Charges',
                fontSize: 14,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
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
                    controller:widget.rateCtr ,
                    borderRadius: 30,
                    keyboardType: TextInputType.visiblePassword,
                    enabled: true, // always enabled
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /// Fields
              Row(
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
                              controller:widget.rateCtr ,
                              borderRadius: 30,
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
                          text: 'Value',
                          fontSize: 14,
                          textColor: ColorUtils.primary,
                          fontWeight: FontWeight.w500,
                        ),
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
                              controller: widget.valueCtr,
                              borderRadius: 30,
                              keyboardType: TextInputType.visiblePassword,
                              enabled: true, // always enabled
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      navigateTo: widget.cancelOnTap  ,
                      buttonName: 'Cancel',
                      borderRadius: 6,
                      width: screenWidth(context),
                      height: 37,
                      buttonTextColor: ColorUtils.white,
                      buttonColor: ColorUtils.primary,
                    ),
                  ),
                  HorizontalSpace(width: 10),
                  Expanded(
                    child: ButtonWidget(
                      navigateTo: widget.saveOnTap ,
                      buttonName: 'Save',
                      borderRadius: 6,
                      width: screenWidth(context),
                      height: 37,
                      buttonTextColor: ColorUtils.white,
                      buttonColor: ColorUtils.primary,
                    ),
                  ),
                ],
              ),
              /// Buttons

            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String title, TextEditingController controller, String hint) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: title,
            fontSize: 14,
            textColor: ColorUtils.primary,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 6),
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: ColorUtils.backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ColorUtils.tabGrey),
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
