import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerAttachmentsEdit extends StatefulWidget {
  const CustomerAttachmentsEdit({super.key});

  @override
  State<CustomerAttachmentsEdit> createState() => _CustomerAttachmentsEditState();
}

class _CustomerAttachmentsEditState extends State<CustomerAttachmentsEdit> {


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
          text: "Flexibiz erp".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.all(10),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  labelValueWidget(label: "Name", value: "Vaibhav Bansai New test"),
                  labelValueWidget(label: "Date", value: "29-Apr-2023"),
                  labelValueWidget(label: "Executive", value: "SUPER"),
                  labelValueWidget(label: "file name", value: "LeadID122_photo...8293749236.png"),
                  labelValueWidget(label: "size", value: "108.0 Kb")


                ],
              ),
            ),
            VerticalSpace(height: 12),
            Container(
              height: 130,
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
                  hintText: 'Type Here...',
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
            VerticalSpace(height: 12),
            Spacer(),
            ButtonWidget(
              navigateTo: () {
              } ,
              buttonName: 'Submit',
              borderRadius: 30,
              width: screenWidth(context),
              height: 50,
              buttonTextColor: ColorUtils.white,
              buttonColor: ColorUtils.primary,
            ),
            VerticalSpace(height: 10),

          ],
        ),
      ),
    );
  }

  Widget labelValueWidget({
    required String label,
    required String value,
    // int labelFlex = 1,
    // int valueFlex = 2,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: TextWidget(
            text: label,
            fontSize: 14,
            textAlign: TextAlign.start,
            textColor: ColorUtils.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            text: value,
            fontSize: 14,
            textAlign: TextAlign.start,
            textColor: ColorUtils.black.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}












