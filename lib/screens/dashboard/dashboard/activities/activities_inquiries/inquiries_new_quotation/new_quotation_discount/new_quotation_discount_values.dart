import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../constant/color_Utils.dart';

class NewQuotationDiscountValues extends StatefulWidget {
  final String title;
  final String rate;
  final String value;

  const NewQuotationDiscountValues({
    super.key,
    required this.title,
    required this.rate,
    required this.value,
  });

  @override
  State<NewQuotationDiscountValues> createState() => _NewQuotationDiscountValuesState();
}

class _NewQuotationDiscountValuesState extends State<NewQuotationDiscountValues> {
  late TextEditingController discountRate;
  late TextEditingController discountValue;

  @override
  void initState() {
    super.initState();
    discountRate = TextEditingController(text: widget.rate);
    discountValue = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: widget.title,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, size: 22),
                )
              ],
            ),

            const SizedBox(height: 16),
            Divider(height: 1),
            const SizedBox(height: 20),

            /// Inputs
            Row(
              children: [
                _inputField("Rate %", discountRate, "0.0"),
                const SizedBox(width: 16),
                _inputField("Value", discountValue, "0.0"),
              ],
            ),

            const SizedBox(height: 28),

            /// Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorUtils.primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, {
                        "rate": discountRate.text,
                        "value": discountValue.text,
                      });
                    },
                    child: const Text("Save"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String title, TextEditingController controller, String hint) {
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
