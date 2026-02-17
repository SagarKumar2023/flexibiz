import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';

class NewQuotationCustomerSearchDialog extends StatefulWidget {
  const NewQuotationCustomerSearchDialog({super.key});

  @override
  State<NewQuotationCustomerSearchDialog> createState() => _NewQuotationCustomerSearchDialogState();
}

class _NewQuotationCustomerSearchDialogState extends State<NewQuotationCustomerSearchDialog> {

  TextEditingController name = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextWidget(
        text: "Search For",
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      content: SizedBox(
        height: 200,
        width: double.maxFinite,
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: Icon(Icons.contact_mail_outlined),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: ColorUtils.tabGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(color: ColorUtils.primary),
                ),
                hintText: "Name",
                hintStyle: TextStyle(
                  color: ColorUtils.tabGrey,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Checkbox(
                    value: isChecked,
                    activeColor: ColorUtils.primary,
                    onChanged: (val){
                      setState(() {
                        isChecked = val!;
                      });
                    }
                ),
                SizedBox(width: 10,),
                TextWidget(
                  text:"Select All",
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const TextWidget(
                      text: "CANCEL",
                      textColor: ColorUtils.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(width: 40,),

                  const TextWidget(
                    text: "SEARCH",
                    textColor: ColorUtils.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
