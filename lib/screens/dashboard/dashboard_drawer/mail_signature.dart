import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/authentication/register/saved_users.dart';
import 'package:flexibiz/screens/dashboard/dashboard/dashboard.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MailSignature extends StatefulWidget {
  const MailSignature({super.key});

  @override
  State<MailSignature> createState() => _MailSignatureState();
}

class _MailSignatureState extends State<MailSignature> {
  final TextEditingController oldPasswordCtr = TextEditingController();
  final TextEditingController newPasswordCtr = TextEditingController();
  final TextEditingController confirmPasswordlCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF8F8FF),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration:  BoxDecoration(
            color:ColorUtils.lightScreenBackground
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const VerticalSpace(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // InkWell(
                    //   borderRadius: BorderRadius.circular(24),
                    //   onTap: ()=>Navigator.of(context).pop(),
                    //   child: Center(
                    //     child: Image.asset(
                    //       ImagesUtils.arrowBackNewIcon,
                    //       width: 24,
                    //       height: 24,
                    //       color:ColorUtils.darkText,
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios,color: ColorUtils.black,)
                    ),
                    TextWidget(
                      text: "Change Mail Signature",
                      fontSize: 18.5,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 50,width: 50,)
                  ],
                ),
              ),
              const VerticalSpace(height: 25),
              Center(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Flexibiz ',
                            style: GoogleFonts.vidaloka(
                              textStyle: TextStyle(
                                fontSize: 45,
                                color: ColorUtils.primary,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: 'CRM',
                            style: GoogleFonts.vidaloka(
                              textStyle: TextStyle(
                                fontSize: 45,
                                color: ColorUtils.secondary,
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextWidget(
                      text: "Kiran consultants Pvt. Ltd.",
                      fontSize: 18.5,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              const VerticalSpace(height: 40),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
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
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom*0.04 ,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'Mail Signature',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w500,
                        ),
                        const VerticalSpace(height: 5),
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
                              hintText: 'Enter Mail Signature...',
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
                        const VerticalSpace(height: 15),
                         TextWidget(
                          text: 'Enter following syntax for social media links.\n[fb] - Facebook Link\n[g+] - Google Link\n[Ln] - Linked in\n[Tw] - Twitter\n[MyPic] - My Picture',
                          fontSize: 14,
                          textAlign: TextAlign.start,
                          textColor: ColorUtils.black.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                        const VerticalSpace(height: 180),
                        ButtonWidget(
                          navigateTo: () {
                          } ,
                          buttonName: 'Save',
                          borderRadius: 30,
                          width: screenWidth(context),
                          height: 50,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                        const VerticalSpace(height: 15),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

