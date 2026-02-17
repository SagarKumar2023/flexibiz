import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/model/lead_activity_model.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_activities_with_details/inquiries_activities_with_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_attachments/inquiries_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_auto_loged_mail/inquiries_auto_loged_mail.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_close_inquiries.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_edit_contact.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_log_followups.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_items/new_quotation_add_item_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_items/new_quotation_search_and_add_item_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_task.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_note/inquiries_note.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_upload_files/inquiries_upload_files.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_verification.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/new_contact_for_lead_customer_contact/new_contact_for_lead_customer_contact.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';

class NewQuotationSelectItems extends StatefulWidget {
  const NewQuotationSelectItems({super.key});

  @override
  State<NewQuotationSelectItems> createState() => _NewQuotationSelectItemsState();
}

class _NewQuotationSelectItemsState extends State<NewQuotationSelectItems> {

  TextEditingController quantityCtr = TextEditingController();
  TextEditingController rateCtr = TextEditingController();
  TextEditingController discountCtr = TextEditingController();
  TextEditingController valuesCtr = TextEditingController();

  final List<ItemListModel> itemList = [
    ItemListModel(
      itemName: "BASIL 6MM",
      uom: "KGS",
      rate: "100.00",
      discount: "10.00",
    ),
    ItemListModel(
      itemName: "OREGANO DRIED",
      uom: "KGS",
      rate: "250.00",
      discount: "15.00",
    ),
    ItemListModel(
      itemName: "BLACK PEPPER",
      uom: "KGS",
      rate: "780.50",
      discount: "25.00",
    ),
    ItemListModel(
      itemName: "RED CHILLI POWDER",
      uom: "KGS",
      rate: "420.00",
      discount: "20.00",
    ),
    ItemListModel(
      itemName: "TURMERIC POWDER",
      uom: "KGS",
      rate: "180.75",
      discount: "5.00",
    ),
    ItemListModel(
      itemName: "CORIANDER SEEDS",
      uom: "KGS",
      rate: "210.00",
      discount: "12.00",
    ),
    ItemListModel(
      itemName: "CUMIN SEEDS",
      uom: "KGS",
      rate: "540.00",
      discount: "30.00",
    ),
    ItemListModel(
      itemName: "FENNEL SEEDS",
      uom: "KGS",
      rate: "360.00",
      discount: "18.00",
    ),
    ItemListModel(
      itemName: "CINNAMON STICKS",
      uom: "KGS",
      rate: "950.00",
      discount: "50.00",
    ),
    ItemListModel(
      itemName: "CLOVE WHOLE",
      uom: "KGS",
      rate: "1100.00",
      discount: "75.00",
    ),
    ItemListModel(
      itemName: "CARDAMOM GREEN",
      uom: "KGS",
      rate: "1800.00",
      discount: "120.00",
    ),
    ItemListModel(
      itemName: "BAY LEAF",
      uom: "KGS",
      rate: "90.00",
      discount: "5.00",
    ),
    ItemListModel(
      itemName: "GARLIC POWDER",
      uom: "KGS",
      rate: "320.00",
      discount: "15.00",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "select items".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: (){
                  showDialog(
                      context: context,
                      builder: (_) => NewQuotationSearchAndAddItemDialog(
                        searchCtr: TextEditingController(),
                        onCancel: () {
                          Navigator.pop(context);
                        },
                        onSearch: () {

                        },
                      )
                  );
                },
                child: Image(image: AssetImage(ImagesUtils.filterListIcon),color: ColorUtils.white,height: 20,)),
          )

        ],
      ),
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          children: [
            /// BODY  SECTION
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: itemList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = itemList[index];
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
                                showDialog(
                                    context: context,
                                    builder: (_) => NewQuotationAddItemDialog(
                                      dialogTitle: "ITEMS",
                                      quantity: quantityCtr,
                                      rate: rateCtr,
                                      discount: discountCtr,
                                      values: valuesCtr,
                                      onDismiss: () {
                                        Navigator.pop(context);
                                      },
                                      onOk: () {
                                        print("Qty: ${quantityCtr.text}");
                                        print("Rate: ${rateCtr.text}");
                                        print("Discount: ${discountCtr.text}");
                                        print("Value: ${valuesCtr.text}");
                                        Navigator.pop(context);
                                      },
                                    )
                                );
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  LabelValueWidget(
                                    label: "ITEM NAME",
                                    value: item.itemName,
                                  ),
                                  LabelValueWidget(
                                    label: "UOM",
                                    value: item.uom,
                                  ),
                                  LabelValueWidget(
                                    label: "RATE",
                                    value: item.rate,
                                  ),
                                  LabelValueWidget(
                                    label: "DISCOUNT",
                                    value: item.discount,
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
            ),
          ],
        ),
      ),
    );
  }
}


class ItemListModel {
  final String itemName;
  final String uom;
  final String rate;
  final String discount;


  ItemListModel({
    required this.itemName,
    required this.uom,
    required this.rate,
    required this.discount,

  });
}
