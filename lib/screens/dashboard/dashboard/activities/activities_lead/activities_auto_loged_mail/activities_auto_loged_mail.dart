import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_auto_loged_mail/activities_choose_from_server.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesAutoLoggedMail extends StatefulWidget {
  final String? selectedCategory;
  final List<Map<String, dynamic>>? selectedFiles;

  const ActivitiesAutoLoggedMail({
    super.key,
    this.selectedFiles,
    this.selectedCategory,
  });

  @override
  State<ActivitiesAutoLoggedMail> createState() => _ActivitiesAutoLoggedMailState();
}

class _ActivitiesAutoLoggedMailState extends State<ActivitiesAutoLoggedMail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        title: TextWidget(
          text: "VAIBHAV BANSAL NEW TEST".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(
          onTap: (){
            showDialog(
                context: context,
                builder: (_) => Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 150,
                    width: screenWidth(context),
                    child: Container(
                      width: screenWidth(context),
                      margin: EdgeInsets.only(top: 17),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        // color: ColorUtils.lightScreenBackground,
                        borderRadius: BorderRadius.circular(12),
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Would you like to leave the screen?",
                            fontSize: 17,
                            textColor: ColorUtils.black,
                            fontWeight: FontWeight.w600,
                          ),
                          VerticalSpace(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: ButtonWidget(
                                    navigateTo: () {
                                      Navigator.of(context).pop();
                                    } ,
                                    buttonName: 'No',
                                    borderRadius: 30,
                                    width: 150,
                                    height: 35,
                                    buttonTextColor: ColorUtils.white,
                                    buttonColor: ColorUtils.primary,
                                  ),
                                ),
                                HorizontalSpace(width: 10),
                                ButtonWidget(
                                  navigateTo: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  } ,
                                  buttonName: 'Yes',
                                  borderRadius: 30,
                                  width: 150,
                                  height: 35,
                                  buttonTextColor: ColorUtils.white,
                                  buttonColor: ColorUtils.primary,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
            );
          },
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            VerticalSpace(height: 15),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Column(
                                children: [
                                  _threeDotInsideItem(
                                    icon: ImagesUtils.commonFileIcon,
                                    title: "Choose from local files",
                                    onTap: () {
                                    },
                                  ),
                                  VerticalSpace(height: 7),
                                  _threeDotInsideItem(
                                    icon: ImagesUtils.cloudServerIcon,
                                    title: "Choose from server",
                                    onTap: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => ActivitiesChooseFromServer(),));
                                    },
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
                child: Image(image: AssetImage(ImagesUtils.attachmentsIcon),color: ColorUtils.white,height: 20,)),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: SingleChildScrollView(
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
                  children: [
                    commonTextField(prefixText: 'To'),
                    commonTextField(prefixText: 'Cc'),
                    commonTextField(prefixText: 'Bcc'),
          
                  ],
                ),
              ),
              VerticalSpace(height: 12),
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
                child: TextField(
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textAlignVertical: TextAlignVertical.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: ColorUtils.black.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hint: TextWidget(
                      text: "Subject",
                      fontSize: 20,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                    ),
                    isDense: true,
                    border: InputBorder.none,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 35,
                      minHeight: 35,
                    ),
          
                    contentPadding: const EdgeInsets.only(top: 2),
                  ),
                ),
              ),
              VerticalSpace(height: 12),
              if (widget.selectedFiles != null && widget.selectedFiles!.isNotEmpty)
                for (int index = 0; index < widget.selectedFiles!.length; index++)
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                    width: screenWidth(context),
                    padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
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
                    child:Row(
                      children: [
                        Container(
                          height: 34,
                          width: 34,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtils.black,
                              border: Border.all(
                                color: ColorUtils.red.withOpacity(0.3),
                                width: 1,
                              ),
                              image: DecorationImage(image: AssetImage(widget.selectedFiles![index]["Image"]),fit: BoxFit.fill)
                          ),
                        ),
                        HorizontalSpace(width: 10),
                        TextWidget(
                          text:widget.selectedFiles![index]["File"],
                          fontSize: 14,
                          textColor: ColorUtils.black,
                          fontWeight: FontWeight.w500,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              widget.selectedFiles!.removeAt(index);
                            });
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorUtils.red.withOpacity(0.5),
                              border: Border.all(
                                color: ColorUtils.red.withOpacity(0.6),
                                width: 1,
                              ),
                            ),
                            child:  Icon(
                              Icons.close,
                              size: 20,
                              color: ColorUtils.white,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              if (widget.selectedFiles != null && widget.selectedFiles!.isNotEmpty)
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
                    hintText: 'Say Something...',
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
              VerticalSpace(height: 100),
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
      ),
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
                  color: ColorUtils.secondary
              ),
              child: Image(image: AssetImage(icon),height: 13,color: ColorUtils.white,),
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

  Widget commonTextField({
    required String prefixText,
  }) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: TextField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.montserrat(
          fontSize: 14,
          color: ColorUtils.black.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          isDense: true, // ✅ compact
          border: InputBorder.none,

          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6,top: 5),
            child: Text(
              prefixText,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: ColorUtils.secondary,
              ),
            ),
          ),

          prefixIconConstraints: const BoxConstraints(
            minWidth: 35,
            minHeight: 35,
          ),

          contentPadding: const EdgeInsets.only(top: 2),
        ),
      ),
    );
  }


}












