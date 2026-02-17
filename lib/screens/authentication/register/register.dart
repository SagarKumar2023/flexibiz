import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/authentication/login/url_Login.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController nameCtr = TextEditingController();
  final TextEditingController mobileNoCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController companyCtr = TextEditingController();
  final TextEditingController websiteCtr = TextEditingController();
  bool isPasswordEntered = false;
  bool showMenu = false;
  bool isChecked = false;
  String selectedType = 'CRM';

  void _validateAndRegister() {
    String name = nameCtr.text.trim();
    String mobileNumber = mobileNoCtr.text.trim();
    String email = emailCtr.text.trim();
    String company = companyCtr.text.trim();
    String website = websiteCtr.text.trim();

    // ===== Name Validation =====
    if (name.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
      return;
    } else if (name.length < 2) {
      SnackBarUtils.showWarning(
          'Warning', 'Name must be at least 2 characters long.');
      return;
    }

    // ===== Email Validation =====
    if (email.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
      return;
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      SnackBarUtils.showWarning('Warning', 'Please enter a valid email address.');
      return;
    }

    // ===== Mobile Number Validation =====
    if (mobileNumber.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Mobile number cannot be empty.');
      return;
    } else if (mobileNumber.length != 10) {
      SnackBarUtils.showWarning('Warning', 'Please enter a valid 10-digit mobile number.');
      return;
    } else if (!RegExp(r'^[0-9]+$').hasMatch(mobileNumber)) {
      SnackBarUtils.showWarning('Warning', 'Mobile number must contain only digits.');
      return;
    }

    // ===== Company Validation =====
    if (company.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Company cannot be empty.');
      return;
    }

    // ===== Website Validation =====
    if (website.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Website cannot be empty.');
      return;
    } else {
      final uri = Uri.tryParse(website);
      if (uri == null ||
          uri.scheme.isEmpty ||
          !(uri.scheme == 'http' || uri.scheme == 'https') ||
          uri.host.isEmpty) {
        SnackBarUtils.showWarning('Warning', 'Please enter a valid website URL.');
        return;
      }
    }

    ScreenNavigationUtils.push(
      context,
      child: const UrlLogin(),
      type: PageTransitionType.rightToLeft,
    );

    // ===== Registration Data =====
    // final data = {
    //   "email": email,
    //   "phone": mobileNumber,
    //   "company": company,
    //   "website": website,
    //   "name": name,
    //   "typeReg": "email",
    //   "photoUrl": ""
    // };

    /// Call register API
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
              const VerticalSpace(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_back_ios,color: ColorUtils.black,)
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              const VerticalSpace(height: 25),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
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
                            controller: nameCtr,
                            borderRadius: 30,
                            hintText: "Enter Name",
                            keyboardType: TextInputType.url,
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
                            controller: mobileNoCtr,
                            borderRadius: 30,
                            hintText: "Enter Mobile No",
                            keyboardType: TextInputType.number,
                            enabled: true, // always enabled
                            maxLength: 10,
                            suffixIcon: Container(
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.call,
                                color: ColorUtils.grey.withOpacity(0.65),
                              ),
                            ),
                            inputFormatter: [
                              FilteringTextInputFormatter.digitsOnly,      // only numbers
                              LengthLimitingTextInputFormatter(10),        // max 10 digits
                            ],
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
                            controller: emailCtr,
                            borderRadius: 30,
                            hintText: "Enter Email",
                            keyboardType: TextInputType.emailAddress,
                            enabled: true, // always enabled
                            suffixIcon: Container(
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.email_outlined,
                                color: ColorUtils.grey.withOpacity(0.65),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'Company',
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
                            controller: companyCtr,
                            borderRadius: 30,
                            hintText: "Enter Company",
                            keyboardType: TextInputType.visiblePassword,
                            enabled: true, // always enabled
                            suffixIcon: Container(
                              height: 30,
                              width: 30,
                              padding: const EdgeInsets.all(12.5),
                              child: Image(image: AssetImage(ImagesUtils.companyIcon)),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'Website',
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
                            controller: websiteCtr,
                            borderRadius: 30,
                            hintText: "Enter Website",
                            keyboardType: TextInputType.visiblePassword,
                            enabled: true, // always enabled
                            suffixIcon: Container(
                              height: 30,
                              width: 30,
                              // padding: const EdgeInsets.all(10),
                              // child: Icon(
                              //   Icons.lock_open_rounded,
                              //   color: ColorUtils.grey.withOpacity(0.65),
                              // ),
                              padding: const EdgeInsets.all(12.5),
                              child: Image(image: AssetImage(ImagesUtils.websiteIcon)),
                            ),
                          ),
                        ),
                        const VerticalSpace(height: 10),
                        const TextWidget(
                          text: 'App Choice',
                          fontSize: 16,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff1F1F1F),
                          fontWeight: FontWeight.w500,
                        ),
                        const VerticalSpace(height: 5),
                        Container(
                          height: 55,
                          width: screenWidth(context),
                          padding: const EdgeInsets.only(left: 5,right: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: const Color(0xFFEAECF0)),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF43474D).withOpacity(0.06),
                                blurRadius: 60,
                                offset: const Offset(0, 12),
                              ),
                            ],
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              menuWidth: 250,
                              alignment: AlignmentGeometry.center,
                              borderRadius: BorderRadius.circular(10),
                              padding: EdgeInsets.zero,
                              elevation: 5,
                              dropdownColor: ColorUtils.lightScreenBackground,
                              value: selectedType,
                              icon: Image.asset(
                                ImagesUtils.arrowDownIcon,
                                height: 20,
                                color: ColorUtils.grey.withOpacity(0.65),
                              ),
                              // isExpanded: true,
                              items: const [
                                DropdownMenuItem(
                                    value: 'CRM',
                                    child:  TextWidget(
                                      text: 'CRM',
                                      fontSize: 14,
                                      textAlign: TextAlign.start,
                                      textColor: Color(0xff1F1F1F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                ),
                                DropdownMenuItem(
                                    value: 'E-Order',
                                    child:  TextWidget(
                                      text: 'E-Order',
                                      fontSize: 14,
                                      textAlign: TextAlign.start,
                                      textColor: Color(0xff1F1F1F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                ),
                                DropdownMenuItem(
                                    value: 'ERP',
                                    child:  TextWidget(
                                      text: 'ERP',
                                      fontSize: 14,
                                      textAlign: TextAlign.start,
                                      textColor: Color(0xff1F1F1F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  selectedType = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        VerticalSpace(height: 20),
                        // Spacer(),
                        ButtonWidget(
                          navigateTo: _validateAndRegister ,
                          buttonName: 'Next',
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

