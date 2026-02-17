import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_items/new_quotation_search_and_add_item_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_items/new_quotation_select_items.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewQuotationAddItemDialog extends StatefulWidget {
  final String dialogTitle;
  final TextEditingController quantity;
  final TextEditingController rate;
  final TextEditingController discount;
  final TextEditingController values;
  final bool showMapView;
  final bool showClosed;
  final VoidCallback? onMapTap;
  final VoidCallback onDismiss;
  final VoidCallback onOk;

  const NewQuotationAddItemDialog({
    super.key,
    required this.onDismiss,
    required this.onOk,
    this.showMapView = false,
    this.showClosed = false,
    this.onMapTap,
    required this.dialogTitle,
    required this.quantity,
    required this.rate,
    required this.discount,
    required this.values,
  });

  @override
  State<NewQuotationAddItemDialog> createState() => _NewQuotationAddItemDialogState();
}

class _NewQuotationAddItemDialogState extends State<NewQuotationAddItemDialog> {
  @override
  void initState() {
    super.initState();
    widget.quantity.addListener(_calculateValue);
    widget.rate.addListener(_calculateValue);
    widget.discount.addListener(_calculateValue);
  }

  @override
  void dispose() {
    widget.quantity.removeListener(_calculateValue);
    widget.rate.removeListener(_calculateValue);
    widget.discount.removeListener(_calculateValue);
    super.dispose();
  }

  void _calculateValue() {
    final qty = double.tryParse(widget.quantity.text) ?? 0;
    final rate = double.tryParse(widget.rate.text) ?? 0;
    final discount = double.tryParse(widget.discount.text) ?? 0;

    double total = qty * rate;
    double discounted = total - (total * discount / 100);

    widget.values.text = discounted.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 17),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFFFFF), Color(0xFFF8F8FF)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Quantity (UOM)',
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
                              controller:widget.quantity ,
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
                              controller: widget.rate,
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
              const VerticalSpace(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Discount %',
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
                              controller:widget.discount ,
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
                          text: 'Values',
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
                              controller: widget.values,
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
              const VerticalSpace(height: 10),
              const TextWidget(
                text: 'Specs',
                fontSize: 14,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
              const VerticalSpace(height: 5),
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
              const VerticalSpace(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      navigateTo: () {
                        showDialog(
                            context: context,
                            builder: (_) => NewQuotationSearchAndAddItemDialog(
                             searchCtr: TextEditingController(),
                              onCancel: () {
                                Navigator.pop(context);
                              },
                              onSearch: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => NewQuotationSelectItems(),));

                              },
                            )
                        );
                      } ,
                      buttonName: 'Add Item',
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
                      navigateTo: () {
                      } ,
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
                      navigateTo: () {
                      } ,
                      buttonName: 'Save Item',
                      borderRadius: 6,
                      width: screenWidth(context),
                      height: 37,
                      buttonTextColor: ColorUtils.white,
                      buttonColor: ColorUtils.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
