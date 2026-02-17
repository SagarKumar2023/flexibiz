import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_new_quotation/new_quotation_items/new_quotation_add_item_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';

class NewQuotationItem extends StatefulWidget {
  const NewQuotationItem({super.key});

  @override
  State<NewQuotationItem> createState() => _NewQuotationItemState();
}

class _NewQuotationItemState extends State<NewQuotationItem> {
  TextEditingController quantityCtr = TextEditingController();
  TextEditingController rateCtr = TextEditingController();
  TextEditingController discountCtr = TextEditingController();
  TextEditingController valuesCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          height: screenHeight(context),
          width: screenWidth(context),
          decoration:  CommonBoxDecorations.screenBackgroundDecoration,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFFFFFF),
                          Color(0xFFF8F8FF),
                        ],
                        stops: [0.0, 1.0],
                      ),
                    ),
                    child: SingleChildScrollView(
                      // physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom*0.04 ,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: ColorUtils.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFEAECF0),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF43474D).withOpacity(0.06), // #43474D0F ≈ 6% opacity
                                  blurRadius: 60,
                                  offset: const Offset(0, 12),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: '3 PLY CORRUGATED BOX - LTR',
                                      fontSize: 14,
                                      textColor: ColorUtils.darkText,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            backgroundColor:
                                            Colors.transparent,
                                            builder: (context) {
                                              return Container(
                                                padding: const EdgeInsets.only(top: 15, bottom: 10),
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 15, right: 15),
                                                      child: Column(
                                                        children: [


                                                          _threeDotInsideItem(
                                                            icon: ImagesUtils.editIcon,
                                                            title: "Edit",
                                                            onTap: (){
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
                                                          ),
                                                          _threeDotInsideItem(
                                                            icon: ImagesUtils.deleteIcon,
                                                            title: "Delete",
                                                            onTap: (){},
                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },

                                        child: Image(image: AssetImage(ImagesUtils.more,),color: ColorUtils.secondary,height: 20,))
                                  ],
                                ),
                                VerticalSpace(height: 10),
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
                                            padding: EdgeInsets.only(top: 10,left: 14),
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
                                            text: 'Rate',
                                            fontSize: 14,
                                            textColor: ColorUtils.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            height: 45,
                                            width: double.infinity,
                                            padding: EdgeInsets.only(top: 10,left: 14),
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
                                              padding: EdgeInsets.only(top: 10,left: 14),
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
                                            child: TextWidget(
                                              text: '0.06',
                                              fontSize: 14,
                                              textColor: ColorUtils.darkText,
                                              fontWeight: FontWeight.w500,
                                            )
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
                                            padding: EdgeInsets.only(top: 10,left: 14),
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
                                  padding: const EdgeInsets.only(left: 8,right: 8,top: 10),
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
                                  child: TextWidget(
                                    text: 'GARLIC POWDER',
                                    fontSize: 14,
                                    textColor: ColorUtils.darkText,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const VerticalSpace(height: 10),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ButtonWidget(
              navigateTo: () {
                quantityCtr.clear();
                rateCtr.clear();
                discountCtr.clear();
                valuesCtr.clear();

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
              } ,
              buttonName: 'Add Items',
              borderRadius: 30,
              width: screenWidth(context),
              height: 50,
              buttonTextColor: ColorUtils.white,
              buttonColor: ColorUtils.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _threeDotInsideItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorUtils.secondary,
              ),
              child: Image(
                image: AssetImage(icon),
                height: 13,
                color: ColorUtils.white,
              ),
            ),
            const SizedBox(width: 10),
            TextWidget(
              text: title,
              fontSize: 15,
              textColor: ColorUtils.secondary,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
