import 'package:flexibiz/constant/PrefUtils/PrefUtils.dart';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/authentication/register/saved_users.dart';
import 'package:flexibiz/screens/dashboard/dasbard_one.dart';
import 'package:flexibiz/screens/dashboard/dashboard/dashboard.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LoginWithCredential extends StatefulWidget {
  const LoginWithCredential({super.key});

  @override
  State<LoginWithCredential> createState() => _LoginWithCredentialState();
}

class _LoginWithCredentialState extends State<LoginWithCredential> {

  final TextEditingController clientIdCtr = TextEditingController();
  final TextEditingController clientIdPasswordCtr = TextEditingController();
  final TextEditingController userNameCtr = TextEditingController();
  final TextEditingController userNamePasswordCtr = TextEditingController();
  bool clientIdObscureText = true;
  bool userNameObscureText = true;
  bool showMenu = false;
  bool isChecked = false;

  void _validateAndLogin()async {
    String clientId = clientIdCtr.text.trim();
    String clientPassword = clientIdPasswordCtr.text.trim();
    String userName = userNameCtr.text.trim();
    String userPassword = userNamePasswordCtr.text.trim();

    /// STEP 1: ALL FIELDS EMPTY CHECK
    if (clientId.isEmpty && clientPassword.isEmpty &&
        userName.isEmpty && userPassword.isEmpty) {

      SnackBarUtils.showWarning('Warning', 'Please enter login details',);
      return;
    }

    /// ===== Client ID Login =====
    if (isChecked) {
      if (clientId.isEmpty) {
        SnackBarUtils.showWarning('Warning', 'Client ID cannot be empty');
        return;
      }

      if (!RegExp(r'^[0-9]+$').hasMatch(clientId)) {
        SnackBarUtils.showWarning(
            'Warning', 'Client ID must contain only numbers');
        return;
      }

      if (clientPassword.isEmpty) {
        SnackBarUtils.showWarning(
            'Warning', 'Client ID password cannot be empty');
        return;
      }

      /// Default Credential Check
      if (clientId != '1145' || clientPassword != 'super') {
        SnackBarUtils.showWarning(
            'Warning', 'Invalid Client ID or Password');
        return;
      }
    }

    /// ===== Username Login =====
    else {
      if (userName.isEmpty) {
        SnackBarUtils.showWarning('Warning', 'Username cannot be empty');
        return;
      }

      if (userPassword.isEmpty) {
        SnackBarUtils.showWarning('Warning', 'Password cannot be empty');
        return;
      }

      /// Default Credential Check
      if (userName != 'super' || userPassword != 'super798') {
        SnackBarUtils.showWarning(
            'Warning', 'Invalid Username or Password');
        return;
      }
    }

    await PrefUtils.setUserLoggedIn(true);

    /// LOGIN SUCCESS
    ScreenNavigationUtils.pushReplacement(
      context,
      child: const DashboardOne(),
      //child: const Dashboard(),
      type: PageTransitionType.rightToLeft,
    );
  }

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
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios,color: ColorUtils.black,)
                ),
              ),
              const VerticalSpace(height: 35),
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
                            child: const SavedUsers(),
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
                            text: "Saved User",
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
                          text: 'Client Id',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w500,
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
                                color: const Color(0xFF43474D).withOpacity(0.06),
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
                            controller: clientIdCtr,
                            borderRadius: 30,
                            hintText: "Enter Client Id",
                            keyboardType: TextInputType.number,
                            enabled: true,
                            suffixIcon: Container(
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.person,
                                color: ColorUtils.grey.withOpacity(0.65),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'Password',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w500,
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
                                color: const Color(0xFF43474D).withOpacity(0.06),
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
                            controller: clientIdPasswordCtr,
                            borderRadius: 30,
                            hintText: "Enter Password",
                            obscureText: clientIdObscureText,
                            keyboardType: TextInputType.visiblePassword,
                            enabled: clientIdCtr.text.isNotEmpty, // always enabled
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  clientIdObscureText = !clientIdObscureText;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.all(13),
                                child: Image(
                                    height: 20,
                                    width:20,
                                    color:  ColorUtils.grey.withOpacity(0.65),
                                    image: AssetImage(clientIdObscureText ?ImagesUtils.lockIcon:ImagesUtils.unlockIcon)
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'User Name',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w500,
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
                                color: const Color(0xFF43474D).withOpacity(0.06),
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
                            controller: userNameCtr,
                            borderRadius: 30,
                            hintText: "Enter User Name",
                            keyboardType: TextInputType.name,
                            enabled: clientIdPasswordCtr.text.isNotEmpty, // always enabled
                            suffixIcon: Container(
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.person,
                                color: ColorUtils.grey.withOpacity(0.65),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'Password',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w500,
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
                            controller: userNamePasswordCtr,
                            borderRadius: 30,
                            hintText: "Enter Password",
                            obscureText: userNameObscureText,
                            keyboardType: TextInputType.visiblePassword,
                            enabled: userNameCtr.text.isNotEmpty,
                            suffixIcon: InkWell(
                              onTap: (){
                                setState(() {
                                  userNameObscureText = !userNameObscureText;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                padding: EdgeInsets.all(13),
                                child: Image(
                                    height: 20,
                                    width:20,
                                    color:  ColorUtils.grey.withOpacity(0.65),
                                    image: AssetImage(userNameObscureText ?ImagesUtils.lockIcon:ImagesUtils.unlockIcon)
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalSpace(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                text: 'Keep me logged in?',
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                textColor: Color(0xff27364E),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            TextWidget(
                              text: 'Forgot Password?',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.secondary,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                        // Spacer(),
                        const VerticalSpace(height: 90),
                        ButtonWidget(
                          navigateTo: () {
                            _validateAndLogin();
                            } ,
                          buttonName: 'Login',
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