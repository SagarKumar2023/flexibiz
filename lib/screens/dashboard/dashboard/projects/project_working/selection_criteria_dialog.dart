import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SelectionCriteriaDialog extends StatefulWidget {
  final String dialogTitle;
  final TextEditingController nameCtr;
  final VoidCallback onDismiss;
  final VoidCallback onOk;

  const SelectionCriteriaDialog({
    super.key,
    required this.nameCtr,
    required this.onDismiss,
    required this.onOk,
    required this.dialogTitle,
  });

  @override
  State<SelectionCriteriaDialog> createState() => _SelectionCriteriaDialogState();
}

class _SelectionCriteriaDialogState extends State<SelectionCriteriaDialog> {
  bool isSelectAll = false;
  bool isShowClosed = false;

  void _onSelectAllTap() {
    setState(() {
      isSelectAll = true;
      isShowClosed = false;
    });
  }

  void _onShowClosedTap() {
    setState(() {
      isShowClosed = true;
      isSelectAll = false;
    });
  }

  Widget _checkBox({required bool isChecked}) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isChecked ? const Color(0xff007BFF) : Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isChecked ? const Color(0xff007BFF) : const Color(0xFFEAECF0),
          width: 2,
        ),
      ),
      child: isChecked
          ? Image(
        height: 16,
        width: 16,
        color: ColorUtils.white,
        image: AssetImage(ImagesUtils.checkIcon),
      )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 260,
        child: Stack(
          children: [
            /// MAIN CARD
            Container(
              margin: const EdgeInsets.only(top: 18),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFFFFFFF),
                    Color(0xFFF8F8FF),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpace(height: 12),

                  /// NAME LABEL
                  const TextWidget(
                    text: 'Name',
                    fontSize: 16,
                    textColor: Color(0xff1F1F1F),
                    fontWeight: FontWeight.w500,
                  ),

                  const VerticalSpace(height: 6),

                  /// TEXT FIELD
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: const Color(0xFFEAECF0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF43474D).withOpacity(0.06),
                          blurRadius: 60,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: TextFieldWidget(
                      controller: widget.nameCtr,
                      hintText: "Enter Name",
                      borderRadius: 30,
                      keyboardType: TextInputType.text,
                      cursorColor: ColorUtils.grey,
                      enableBorderColor: Colors.transparent,
                      focusBorderColor: Colors.transparent,
                      disableBorderColor: Colors.transparent,
                      suffixIcon: Icon(
                        Icons.person,
                        color: ColorUtils.grey.withOpacity(0.65),
                      ),
                    ),
                  ),

                  const VerticalSpace(height: 14),

                  /// CHECKBOX ROW
                  Row(
                    children: [
                      /// SELECT ALL
                      InkWell(
                        onTap: _onSelectAllTap,
                        child: Row(
                          children: [
                            _checkBox(isChecked: isSelectAll),
                            const HorizontalSpace(width: 8),
                            const TextWidget(
                              text: 'Select All',
                              fontSize: 14,
                              textColor: Color(0xff27364E),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      /// SHOW CLOSED
                      InkWell(
                        onTap: _onShowClosedTap,
                        child: Row(
                          children: [
                            _checkBox(isChecked: isShowClosed),
                            const HorizontalSpace(width: 8),
                            const TextWidget(
                              text: 'Show Closed',
                              fontSize: 14,
                              textColor: Color(0xff27364E),
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const VerticalSpace(height: 18),

                  /// BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: widget.onDismiss,
                          buttonName: 'Dismiss',
                          borderRadius: 30,
                          height: 50,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                      const HorizontalSpace(width: 10),
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: widget.onOk,
                          buttonName: 'Ok',
                          borderRadius: 30,
                          height: 50,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// TITLE CHIP
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: TextWidget(
                  text: widget.dialogTitle,
                  fontSize: 15.5,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
