import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InquiriesLogFollowups extends StatefulWidget {
  const InquiriesLogFollowups({super.key});

  @override
  State<InquiriesLogFollowups> createState() => _InquiriesLogFollowupsState();
}

class _InquiriesLogFollowupsState extends State<InquiriesLogFollowups> {
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
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 15,
                    width: 15,
                    child: Image(image: AssetImage(ImagesUtils.lineChartIcon),height: 14,color: ColorUtils.secondary,)),
                HorizontalSpace(width: 5),
                Expanded(
                  child: TextWidget(
                    text: 'Flexibiz ERP',
                    fontSize: 15,
                    textAlign:TextAlign.start,
                    textColor:ColorUtils.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            VerticalSpace(height: 3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 15,
                    width: 15,
                    child: Image(image: AssetImage(ImagesUtils.customerIcon),height: 14,color: ColorUtils.secondary,)),
                HorizontalSpace(width: 5),
                Expanded(
                  child: TextWidget(
                    text: 'Test Sagar New Test',
                    fontSize: 14,
                    textAlign: TextAlign.start,
                    textColor:ColorUtils.black.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            VerticalSpace(height: 3),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 15,
                    width: 15,
                    child: Image(image: AssetImage(ImagesUtils.mobileNoIcon),height: 14,color: ColorUtils.secondary,)),
                HorizontalSpace(width: 5),
                Expanded(
                  child: TextWidget(
                    text: '7295992601',
                    fontSize: 14,
                    textAlign: TextAlign.start,
                    textColor:ColorUtils.black.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            VerticalSpace(height: 15),
            Container(
              height: 160,
              width: screenWidth(context),
              padding: const EdgeInsets.only(left: 8,right: 8),
              decoration: BoxDecoration(
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
                  hintText: 'Remark...',
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

            Spacer(),
            ButtonWidget(
              navigateTo: () {} ,
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
}
