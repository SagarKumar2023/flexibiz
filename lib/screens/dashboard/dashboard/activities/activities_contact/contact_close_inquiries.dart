import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactCloseInquiries extends StatefulWidget {
  const ContactCloseInquiries({super.key});

  @override
  State<ContactCloseInquiries> createState() => _ContactCloseInquiriesState();
}

class _ContactCloseInquiriesState extends State<ContactCloseInquiries> {
  String closeWonSelectedStatus = "Close";


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
          text: "Close inquiries".toUpperCase(),
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
              padding: const EdgeInsets.only(left: 8,right: 8,top: 6,bottom: 6),
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
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.black
                    ),
                    child: Icon(Icons.person,color: Colors.white,),
                    // child: Image(image: AssetImage(Image),height: 13,color: ColorUtils.white,),
                  ),
                  HorizontalSpace(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Flexibiz ERP',
                        fontSize: 14,
                        textAlign: TextAlign.start,
                        textColor:ColorUtils.black.withOpacity(0.8),
                        fontWeight: FontWeight.w600,
                      ),
                      TextWidget(
                        text: '7295992601',
                        fontSize: 13,
                        textAlign: TextAlign.start,
                        textColor:ColorUtils.black.withOpacity(0.75),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
            VerticalSpace(height: 12),
            TextWidget(
              text: 'Choice',
              fontSize: 16,
              textAlign: TextAlign.start,
              textColor:ColorUtils.secondary,
              fontWeight: FontWeight.w600,
            ),
            VerticalSpace(height: 3),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        closeWonSelectedStatus = "Close";
                      });
                    },
                    child: _statusButton(
                      title: "Close",
                      isSelected: closeWonSelectedStatus == "Close",
                    ),
                  ),
                ),
                const HorizontalSpace(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        closeWonSelectedStatus = "Won";
                      });
                    },
                    child: _statusButton(
                      title: "Won",
                      isSelected: closeWonSelectedStatus == "Won",
                    ),
                  ),
                ),
              ],
            ),
            VerticalSpace(height: 12),
            TextWidget(
              text: 'Remarks',
              fontSize: 16,
              textAlign: TextAlign.start,
              textColor:ColorUtils.secondary,
              fontWeight: FontWeight.w600,
            ),
            VerticalSpace(height: 3),
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

            Spacer(),
            ButtonWidget(
              navigateTo: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MediaScreen(),));
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

  Widget _statusButton({
    required String title,
    required bool isSelected,
  }) {
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 12,right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: ColorUtils.white,
        border: Border.all(
          color: Color(0xFFEAECF0),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            text: title,
            fontSize: 16,
            textAlign: TextAlign.center,
            textColor:ColorUtils.black.withOpacity(0.75) ,

            fontWeight: FontWeight.w600,
          ),
          Container(
            height: 25,
            width: 25,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? ColorUtils.primary.withOpacity(0.8)
                  : ColorUtils.black.withOpacity(0),
              border: Border.all(
                color: isSelected ? ColorUtils.primary:Color(0xFFEAECF0),
                width: 1,
              ),
            ),
            child:  isSelected? Image(image: AssetImage(ImagesUtils.checkIcon),color: ColorUtils.white,):SizedBox()
          ),
        ],
      ),
    );
  }
}












