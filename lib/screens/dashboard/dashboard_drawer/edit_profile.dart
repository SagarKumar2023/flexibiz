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

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController nameCtr = TextEditingController();
  final TextEditingController abrNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController phoneCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();

  void _validateAndEditProfile() {
    final String name = nameCtr.text.trim();
    final String abrName = abrNameCtr.text.trim();
    final String mobileNumber = phoneCtr.text.trim();
    final String email = emailCtr.text.trim();
    final String password = passwordCtr.text.trim();

    /// ===== NAME =====
    if (name.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
      return;
    }
    if (name.length < 2) {
      SnackBarUtils.showWarning(
          'Warning', 'Name must be at least 2 characters long.');
      return;
    }

    /// ===== ABBREVIATED NAME (OPTIONAL) =====
    if (abrName.isNotEmpty && abrName.length < 2) {
      SnackBarUtils.showWarning(
          'Warning', 'Abbreviated name must be at least 2 characters.');
      return;
    }

    /// ===== EMAIL =====
    if (email.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
      return;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      SnackBarUtils.showWarning(
          'Warning', 'Please enter a valid email address.');
      return;
    }

    /// ===== MOBILE =====
    if (mobileNumber.isEmpty) {
      SnackBarUtils.showWarning(
          'Warning', 'Mobile number cannot be empty.');
      return;
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber)) {
      SnackBarUtils.showWarning(
          'Warning', 'Please enter a valid 10-digit mobile number.');
      return;
    }

    /// ===== PASSWORD =====
    if (password.isEmpty) {
      SnackBarUtils.showWarning(
          'Warning', 'Password cannot be empty.');
      return;
    }
    if (password.length < 6) {
      SnackBarUtils.showWarning(
          'Warning', 'Password must be at least 6 characters long.');
      return;
    }

    /// ===== API DATA =====
    final Map<String, dynamic> data = {
      "name": name,
      "abrName": abrName,
      "email": email,
      "phone": mobileNumber,
      "password": password,
      "typeReg": "email",
      "photoUrl": "",
    };

    /// ===== API CALL =====
    // registerController.registerUser(data);
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
                      text: "Edit Profile",
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
                          text: 'Name',
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
                            controller: nameCtr,
                            borderRadius: 30,
                            hintText: "Enter Name",
                            keyboardType: TextInputType.name,
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
                          text: "ABR Name",
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
                            controller: abrNameCtr,
                            borderRadius: 30,
                            hintText: "Enter Abr Name",
                            keyboardType: TextInputType.name,
                            enabled: true, // always enabled
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
                          text: 'Email',
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
                            controller: emailCtr,
                            borderRadius: 30,
                            hintText: "Enter Email",
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
                                    image: AssetImage(ImagesUtils.emailIcon)
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'Mobile No',
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
                            controller: phoneCtr,
                            borderRadius: 30,
                            hintText: "Enter Mobile No",
                            keyboardType: TextInputType.phone,
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
                                    image: AssetImage(ImagesUtils.mobileNoIcon)
                                ),
                              ),
                            ),
                          ),
                        ),
                        VerticalSpace(height: 8),
                        // Spacer(),
                        const VerticalSpace(height: 110),
                        ButtonWidget(
                          navigateTo: _validateAndEditProfile,
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

