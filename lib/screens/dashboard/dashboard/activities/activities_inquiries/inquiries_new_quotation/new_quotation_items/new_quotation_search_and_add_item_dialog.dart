import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewQuotationSearchAndAddItemDialog extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onSearch;
  final TextEditingController searchCtr ;

  const NewQuotationSearchAndAddItemDialog({
    super.key,
    required this.onCancel,
    required this.onSearch, required this.searchCtr,
  });

  @override
  State<NewQuotationSearchAndAddItemDialog> createState() => _NewQuotationSearchAndAddItemDialogState();
}

class _NewQuotationSearchAndAddItemDialogState extends State<NewQuotationSearchAndAddItemDialog> {

  bool isChecked = false;
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

              const TextWidget(
                text: 'Search For',
                fontSize: 16,
                textAlign: TextAlign.center,
                textColor:ColorUtils.darkText,
                fontWeight: FontWeight.w500,
              ),
              const VerticalSpace(height: 5),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
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
                child: TextFieldWidget(
                  cursorColor: ColorUtils.grey,
                  focusBorderColor: ColorUtils.white.withOpacity(0.9),
                  disableBorderColor: ColorUtils.white.withOpacity(0.3),
                  enableBorderColor: ColorUtils.white.withOpacity(0.9),
                  hintTextColor:ColorUtils.grey,
                  labelTextColor:ColorUtils.grey,
                  controller: widget.searchCtr,
                  borderRadius: 30,
                  hintText: "Enter Name",
                  keyboardType: TextInputType.visiblePassword,
                  enabled: true,
                  suffixIcon: InkWell(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      padding: EdgeInsets.all(13),
                      child: Image(
                          height: 20,
                          width:20,
                          color:  ColorUtils.grey.withOpacity(0.65),
                          image: AssetImage(ImagesUtils.searchIcon)
                      ),
                    ),
                  ),
                ),
              ),
              VerticalSpace(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color:isChecked ? Color(0xff007BFF) : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isChecked ? Color(0xff007BFF) : Color(0xFFEAECF0),
                          width: 2,
                        ),
                      ),
                      child: isChecked ?
                      Image(height: 18,width:18,color: ColorUtils.white,image: AssetImage(ImagesUtils.checkIcon))
                          : null,
                    ),
                  ),
                  const HorizontalSpace(width: 8),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: const TextWidget(
                      text: 'Select All',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: Color(0xff27364E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              VerticalSpace(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      navigateTo: widget.onCancel  ,
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
                      navigateTo: widget.onSearch ,
                      buttonName: 'Search',
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
