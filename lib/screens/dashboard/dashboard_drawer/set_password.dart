import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/authentication/register/saved_users.dart';
import 'package:flexibiz/screens/dashboard/dashboard/dashboard.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetPassword extends StatefulWidget {
  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final TextEditingController oldPasswordCtr = TextEditingController();
  final TextEditingController newPasswordCtr = TextEditingController();
  final TextEditingController confirmPasswordCtr = TextEditingController();

  void _validateAndSetPassword() {
    final String oldPassword = oldPasswordCtr.text.trim();
    final String newPassword = newPasswordCtr.text.trim();
    final String confirmPassword = confirmPasswordCtr.text.trim();

    /// ===== OLD PASSWORD =====
    if (oldPassword.isEmpty) {
      SnackBarUtils.showWarning(
          'Warning', 'Old password cannot be empty.');
      return;
    }

    if (oldPassword.length < 6) {
      SnackBarUtils.showWarning(
          'Warning', 'Old password must be at least 6 characters.');
      return;
    }

    /// ===== NEW PASSWORD =====
    if (newPassword.isEmpty) {
      SnackBarUtils.showWarning(
          'Warning', 'New password cannot be empty.');
      return;
    }

    if (newPassword.length < 6) {
      SnackBarUtils.showWarning(
          'Warning', 'New password must be at least 6 characters long.');
      return;
    }

    /// New password should not be same as old password
    if (oldPassword == newPassword) {
      SnackBarUtils.showWarning(
          'Warning', 'New password must be different from old password.');
      return;
    }

    /// ===== CONFIRM PASSWORD =====
    if (confirmPassword.isEmpty) {
      SnackBarUtils.showWarning(
          'Warning', 'Confirm password cannot be empty.');
      return;
    }

    if (newPassword != confirmPassword) {
      SnackBarUtils.showWarning(
          'Warning', 'New password and confirm password do not match.');
      return;
    }

    /// ===== API DATA =====
    final Map<String, dynamic> data = {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
    };

    /// ===== API CALL =====
    // changePasswordController.changePassword(data);
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back_ios,color: ColorUtils.black,)
                    ),
                    TextWidget(
                      text: "Change Password",
                      fontSize: 18.5,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w600,
                    ),
                    Container(height: 50,width: 50,)
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
                          text: 'Old Password',
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
                            controller: oldPasswordCtr,
                            borderRadius: 30,
                            hintText: "Enter Old Password",
                            keyboardType: TextInputType.name,
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
                                    image: AssetImage(ImagesUtils.lockIcon)
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: "New Password",
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
                            controller: newPasswordCtr,
                            borderRadius: 30,
                            hintText: "Enter New Password",
                            keyboardType: TextInputType.name,
                            enabled: true, // always enabled
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
                                    image: AssetImage(ImagesUtils.lockIcon)
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'Confirm Password',
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
                            controller: confirmPasswordCtr,
                            borderRadius: 30,
                            hintText: "Enter Confirm Password",
                            keyboardType: TextInputType.emailAddress,
                            enabled: true, // always enabled
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
                                    image: AssetImage(ImagesUtils.lockIcon)
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Spacer(),
                        const VerticalSpace(height: 210),
                        ButtonWidget(
                          navigateTo:_validateAndSetPassword,
                          buttonName: 'Change Password',
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

