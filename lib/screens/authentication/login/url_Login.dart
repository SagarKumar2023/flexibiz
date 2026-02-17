import 'dart:ui';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/authentication/login/favourite_sites.dart';
import 'package:flexibiz/screens/authentication/login/login_With_credentical.dart';
import 'package:flexibiz/screens/authentication/register/register.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class UrlLogin extends StatefulWidget {
  const UrlLogin({super.key});

  @override
  State<UrlLogin> createState() => _UrlLoginState();
}

class _UrlLoginState extends State<UrlLogin> {
  final TextEditingController registerLinkCtr = TextEditingController();
  List<String> savedLinks = [
    "http://35.154.116.247",
    "http://36.155.117.248",
    "http://37.156.118.249",
    "https://flexibiz-erp.com",
  ];

  @override
  void initState() {
    super.initState();
    // initial value (1st item)
    registerLinkCtr.text = savedLinks.first;
  }

  bool isPasswordEntered = false;
  bool showMenu = false;

  void _validateAndNext() {
    String registerLink = registerLinkCtr.text.trim();

    const String defaultRegisterLink = 'http://35.154.116.247';

    /// Empty check
    if (registerLink.isEmpty) {
      SnackBarUtils.showWarning(
        'Warning',
        'Please enter register link',
      );
      return;
    }

    /// URL format validation
    final uri = Uri.tryParse(registerLink);
    if (uri == null ||
        uri.scheme.isEmpty ||
        !(uri.scheme == 'http' || uri.scheme == 'https') ||
        uri.host.isEmpty) {
      SnackBarUtils.showWarning(
        'Warning',
        'Please enter a valid register link',
      );
      return;
    }

    ///  Default register link check
    if (registerLink != defaultRegisterLink) {
      SnackBarUtils.showWarning(
        'Warning',
        'Invalid register link',
      );
      return;
    }

    /// Success → Go Next
    ScreenNavigationUtils.push(
      context,
      child: const LoginWithCredential(),
      type: PageTransitionType.rightToLeft,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              const VerticalSpace(height: 75),
              Stack(
                alignment: Alignment.center,
                children: [
                  if (showMenu)
                    Positioned.fill(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          setState(() {
                            showMenu = false;
                          });
                        },
                        child: const SizedBox(),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20, width: 20),
                      Column(
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

                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showMenu = !showMenu;
                            });
                          },
                          child: Image(
                            image: AssetImage(ImagesUtils.more),
                            height: 18,
                            color: ColorUtils.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  if (showMenu)
                    Positioned(
                      top: 0,
                      right:30,
                      child: InkWell(
                        onTap: (){
                          ScreenNavigationUtils.push(
                            context,
                            child: const FavouriteSites(),
                            type: PageTransitionType.rightToLeft,
                          );
                        },
                        child: Container(
                          width: screenWidth(context)*0.38,
                          padding: EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),

                                  topLeft: Radius.circular(100),
                                  bottomLeft: Radius.circular(100)
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 6,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3), // downward shadow
                                ),
                              ],
                              color: ColorUtils.white
                          ),
                          child:  TextWidget(
                            text: "Favourite Site",
                            fontSize: 15,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.black,
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const VerticalSpace(height: 40),
              // Email Field
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
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpace(height: 10),
                      const TextWidget(
                        text: 'Register Link',
                        fontSize: 14,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.darkText,
                        fontWeight: FontWeight.w600,
                      ),
                      const VerticalSpace(height: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
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
                          controller: registerLinkCtr,
                          borderRadius: 30,
                          hintText: "Enter Register Link",
                          keyboardType: TextInputType.url,
                          enabled: true, // always enabled
                          suffixIcon: Container(
                            height: 48,
                            // color: Colors.black,
                            width: 80,
                            padding: EdgeInsets.only(right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 30,
                                  width: 2,
                                  color: Color(0xFFEAECF0),
                                  // color: Colors.grey.withOpacity(0.6),
                                ),
                                HorizontalSpace(width: 8),
                                InkWell(
                                  onTap: (){
                                    registerLinkCtr.clear();
                                  },
                                  child: Container(
                                      height: 25,
                                      width: 25,
                                      padding: EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFFEAECF0),
                                          width: 1,
                                        ),
                                        // color: ColorUtils.black.withOpacity(0.6)
                                      ),
                                      child: Image(image: AssetImage(ImagesUtils.closeIcons),height: 20,color: ColorUtils.secondary,width: 10,)),
                                ),

                                HorizontalSpace(width: 5),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Colors.black.withOpacity(0.2),
                                      isScrollControlled: true,
                                      builder: (bottomSheetContext) {
                                        return BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 8,
                                            sigmaY: 8,
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.all(12),
                                            padding: const EdgeInsets.all(10),
                                            decoration:  BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFFFFFFFF),
                                                  Color(0xFFF8F8FF),
                                                ],
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Center(
                                                  child: TextWidget(
                                                    text: "Saved Link".toUpperCase(),
                                                    fontSize: 14,
                                                    textColor: ColorUtils.secondary,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                /// Dynamic list
                                                ...savedLinks.map((link) {
                                                  final bool isSelected = registerLinkCtr.text == link;
                                                  return InkWell(
                                                    onTap: () {
                                                      // registerLinkCtr.text = link;
                                                      // Navigator.pop(context);
                                                      // setState(() {});
                                                      setState(() {
                                                        registerLinkCtr.text = link;
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                      width: screenWidth(context),
                                                      margin: EdgeInsets.only(top: 5),
                                                      padding: EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        color: isSelected
                                                            ? const Color(0xff9694FF).withOpacity(0.2)
                                                            : Colors.transparent,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                                                            child: TextWidget(
                                                              text: link,
                                                              fontSize: 14,
                                                              textColor: ColorUtils.black.withOpacity(0.8),
                                                              fontWeight: FontWeight.w500,
                                                            ),
                                                          ),
                                                          // Divider(color: ColorUtils.black.withOpacity(0.2)),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                  },
                                  child: Container(
                                      height: 25,
                                      width: 25,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFFEAECF0),
                                          width: 1,
                                        ),
                                        // color: ColorUtils.black.withOpacity(0.6)
                                      ),
                                      child: Center(child: Image(image: AssetImage(ImagesUtils.icArrowDropDown),height: 25,color: ColorUtils.secondary,width: 10,))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const VerticalSpace(height: 10),
                      const TextWidget(
                        text: 'Unique Id',
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.darkText,
                        fontWeight: FontWeight.w500,
                      ),
                      const VerticalSpace(height: 5),
                      Container(
                        width: screenWidth(context),
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
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
                        child:  TextWidget(
                          text: '860384d8b4ff1e05',
                          fontSize: 16,
                          textAlign: TextAlign.start,
                          textColor: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const VerticalSpace(height: 15),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonWidget(
                            navigateTo: (){
                              _validateAndNext();
                            },
                            buttonName: 'Next',
                            borderRadius: 30,
                            width: screenWidth(context),
                            height: 50,
                            buttonTextColor: ColorUtils.white,
                            buttonColor: ColorUtils.primary,
                          ),
                          const VerticalSpace(height: 15),
                          InkWell(
                            onTap: (){
                              ScreenNavigationUtils.push(
                                context,
                                child: const Register(),
                                type: PageTransitionType.rightToLeft,
                              );
                            },
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Don\'t have an account ? ',
                                      style: GoogleFonts.vidaloka(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          color: ColorUtils.grey,
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Register',
                                      style: GoogleFonts.vidaloka(
                                        textStyle: TextStyle(
                                          fontSize: 15,
                                          color: ColorUtils.primary,
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Spacer(),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: "Developer & Designed By:",
                                  fontSize: 14,
                                  textColor: ColorUtils.black.withOpacity(0.7),
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                  fontWeight: FontWeight.w500,
                                ),
                                VerticalSpace(height: 3),
                                TextWidget(
                                  text: "Kiran consultants Pvt. Ltd.",
                                  fontSize: 16,
                                  textColor: ColorUtils.secondary,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                  fontWeight: FontWeight.w500,
                                ),
                                VerticalSpace(height: 5),
                                TextWidget(
                                  text: "info@flexibiz-erp.com",
                                  fontSize: 15,
                                  textColor: ColorUtils.primary,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                  // fontWeight: FontWeight.w500,
                                ),
                                VerticalSpace(height: 3),
                                TextWidget(
                                  text: "http://www.flexibiz-erp.com",
                                  fontSize: 15,
                                  textColor: ColorUtils.primary,
                                  softSwap: true,
                                  overflow: TextOverflow.visible,
                                  //fontWeight: FontWeight.w500,
                                ),
                                VerticalSpace(height: 20),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
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

