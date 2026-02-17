import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ActivitiesEditContact extends StatefulWidget {
  const ActivitiesEditContact({super.key});

  @override
  State<ActivitiesEditContact> createState() => _ActivitiesEditContactState();
}

class _ActivitiesEditContactState extends State<ActivitiesEditContact> {
  bool addressIsExpanded = false;
  bool groupingsIsExpanded = false;
  bool showMenu = false;

  /// ye validation addon applya karo
  final TextEditingController contactNameCtr = TextEditingController();
  final TextEditingController mobNoCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController designationCtr = TextEditingController();
  final TextEditingController companyCtr = TextEditingController();
  final TextEditingController siteCtr = TextEditingController();
  final TextEditingController addressCtr = TextEditingController();

  String categoryListSelectedValue = 'None';
  String subCategoryListSelectedValue = 'None';
  String industryListSelectedValue = 'None';
  String groupListSelectedValue = 'None';
  String zoneListSelectedValue = 'None';
  String leadSourceListSelectedValue = 'None';
  String leadTypeListSelectedValue = 'None';

  void _editAndSubmitData() {
    final String name = contactNameCtr.text.trim();
    final String mobile = mobNoCtr.text.trim();
    final String email = emailCtr.text.trim();
    final String designation = designationCtr.text.trim();
    final String company = companyCtr.text.trim();
    final String site = siteCtr.text.trim();
    final String address = addressCtr.text.trim();

    // ===== Name =====
    if (name.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Contact name is required.');
      return;
    }
    if (name.length < 2) {
      SnackBarUtils.showWarning('Warning', 'Contact name must be at least 2 characters.');
      return;
    }

    // ===== Mobile =====
    if (mobile.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Mobile number is required.');
      return;
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
      SnackBarUtils.showWarning('Warning', 'Enter valid 10-digit mobile number.');
      return;
    }

    // ===== Email =====
    if (email.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Email is required.');
      return;
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      SnackBarUtils.showWarning('Warning', 'Enter valid email address.');
      return;
    }

    // ===== Designation =====
    if (designation.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Designation is required.');
      return;
    }

    // ===== Company =====
    if (company.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Company name is required.');
      return;
    }

    // ===== Category dropdown validations =====
    if (categoryListSelectedValue == 'None') {
      SnackBarUtils.showWarning('Warning', 'Please select category.');
      return;
    }

    if (subCategoryListSelectedValue == 'None') {
      SnackBarUtils.showWarning('Warning', 'Please select sub category.');
      return;
    }

    if (industryListSelectedValue == 'None') {
      SnackBarUtils.showWarning('Warning', 'Please select industry.');
      return;
    }

    if (groupListSelectedValue == 'None') {
      SnackBarUtils.showWarning('Warning', 'Please select group.');
      return;
    }

    if (zoneListSelectedValue == 'None') {
      SnackBarUtils.showWarning('Warning', 'Please select zone.');
      return;
    }

    if (leadSourceListSelectedValue == 'None') {
      SnackBarUtils.showWarning('Warning', 'Please select lead source.');
      return;
    }

    if (leadTypeListSelectedValue == 'None') {
      SnackBarUtils.showWarning('Warning', 'Please select lead type.');
      return;
    }

    // ===== Optional fields validation =====
    if (site.isNotEmpty &&
        !Uri.tryParse(site)!.hasAbsolutePath) {
      SnackBarUtils.showWarning('Warning', 'Enter valid website URL.');
      return;
    }

    if (address.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Address is required.');
      return;
    }

    /// All validations passed
    final data = {
      "name": name,
      "mobile": mobile,
      "email": email,
      "designation": designation,
      "company": company,
      "website": site,
      "address": address,
      "category": categoryListSelectedValue,
      "subCategory": subCategoryListSelectedValue,
      "industry": industryListSelectedValue,
      "group": groupListSelectedValue,
      "zone": zoneListSelectedValue,
      "leadSource": leadSourceListSelectedValue,
      "leadType": leadTypeListSelectedValue,
    };

    /// call API / controller
    // controller.updateContact(data);
  }

  final List<String> subCategoryList = [
    'None',
    'CRM Sub Category 1',
    'CRM Sub Category 2',
    'CRM Sub Category 3',
  ];

  final List<String> leadSourceList = [
    'None',
    'CRM LEAD 1',
    'CRM LEAD 2',
    'CRM LEAD 3',
  ];

  final List<String> categoryList = [
    'None',
    'CRM Category 1',
    'CRM Category 2',
    'CRM Category 3',
  ];

  final List<String> industryList = [
    'None',
    'FMCG',
    'Flexibles',
    'Food Seasonings',
    'General',
    'Hair Color',
    'Lavels',
    'Pharma'
  ];

  final List<String> groupList = [
    'None',
    'CRM GROUP 1',
    'CRM GROUP 2',
    'CRM GROUP 3',
  ];

  final List<String> zoneList = [
    'None',
    'Asia',
    'EAST ZONE',
    'WEST ZONE',
    'NORTH ZONE',
    'SOUTH ZONE'
  ];

  final List<String> leadTypeList = [
    'None',
    'Hot',
    'Warm',
    'Cold'
  ];

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
              Expanded(
                child: Container(
                  // padding: const EdgeInsets.all(15),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    // color: ColorUtils.lightScreenBackground
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
                    // physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom*0.04 ,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VerticalSpace(height: 10),
                              TextWidget(
                                text: 'Contact Name',
                                fontSize: 15,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                // textColor: Color(0xff1F1F1F),
                                fontWeight: FontWeight.w500,
                              ),
                              const VerticalSpace(height: 5),
                              Container(
                                decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                child: TextFieldWidget(
                                  cursorColor: ColorUtils.grey,
                                  focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                  disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                  enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                  hintTextColor:ColorUtils.grey,
                                  labelTextColor:ColorUtils.grey,
                                  controller: contactNameCtr,
                                  borderRadius: 30,
                                  hintText: "Enter Contact Name",
                                  keyboardType: TextInputType.url,
                                  enabled: true,
                                  preFixIcon: Padding(
                                    padding: const EdgeInsets.only(top: 14),
                                    child: TextWidget(
                                      text: 'Mr.',
                                      fontSize: 15,
                                      textAlign: TextAlign.center,
                                      textColor: ColorUtils.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  suffixIcon: Container(
                                    height: 30,
                                    width: 30,
                                    padding: const EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.person,
                                      color: ColorUtils.secondary.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpace(height: 10),
                              const TextWidget(
                                text: 'Mobile No',
                                fontSize: 15,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                // textColor: Color(0xff1F1F1F),
                                fontWeight: FontWeight.w500,
                              ),
                              const VerticalSpace(height: 5),
                              Container(
                                decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                child: TextFieldWidget(
                                  cursorColor: ColorUtils.grey,
                                  focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                  disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                  enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                  hintTextColor:ColorUtils.grey,
                                  labelTextColor:ColorUtils.grey,
                                  controller: mobNoCtr,
                                  borderRadius: 30,
                                  hintText: "Enter Mobile No",
                                  keyboardType: TextInputType.visiblePassword,
                                  enabled: true, // always enabled
                                  suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(13),
                                      child: Image(
                                          height: 20,
                                          width:20,
                                          color: ColorUtils.secondary.withOpacity(0.6),
                                          // color:  ColorUtils.grey.withOpacity(0.65),
                                          image: AssetImage(ImagesUtils.mobileNoIcon)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpace(height: 10),
                              const TextWidget(
                                text: 'Email',
                                fontSize: 15,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                // textColor: Color(0xff1F1F1F),
                                fontWeight: FontWeight.w500,
                              ),
                              const VerticalSpace(height: 5),
                              Container(
                                decoration:CommonBoxDecorations.textFieldDecorationDecoration,
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
                                    padding: EdgeInsets.all(13),
                                    child: Image(
                                        height: 20,
                                        width:20,
                                        // color:  ColorUtils.grey.withOpacity(0.65),
                                        color: ColorUtils.secondary.withOpacity(0.6),
                                        image: AssetImage(ImagesUtils.emailIcon)
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpace(height: 10),
                              const TextWidget(
                                text: 'Designation',
                                fontSize: 15,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                // textColor: Color(0xff1F1F1F),
                                fontWeight: FontWeight.w500,
                              ),
                              const VerticalSpace(height: 5),
                              Container(
                                decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                child: TextFieldWidget(
                                  cursorColor: ColorUtils.grey,
                                  focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                  disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                  enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                  hintTextColor:ColorUtils.grey,
                                  labelTextColor:ColorUtils.grey,
                                  controller: designationCtr,
                                  borderRadius: 30,
                                  hintText: "Enter Designation",
                                  keyboardType: TextInputType.text,
                                  enabled: true,
                                  suffixIcon: InkWell(
                                    onTap: (){
                                      setState(() {
                                      });
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(13),
                                      child: Image(
                                          height: 20,
                                          width:20,
                                          color: ColorUtils.secondary.withOpacity(0.6),
                                          // color:  ColorUtils.grey.withOpacity(0.65),
                                          image: AssetImage(ImagesUtils.designationIcon)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 10),
                              const TextWidget(
                                text: 'Company',
                                fontSize: 15,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                // textColor: Color(0xff1F1F1F),
                                fontWeight: FontWeight.w500,
                              ),
                              const VerticalSpace(height: 5),
                              Container(
                                decoration:CommonBoxDecorations.textFieldDecorationDecoration,
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
                                  keyboardType: TextInputType.url,
                                  enabled: true,
                                  suffixIcon: Container(
                                    height: 30,
                                    width: 30,
                                    padding: EdgeInsets.all(13),
                                    child: Image(
                                        height: 20,
                                        width:20,
                                        color: ColorUtils.secondary.withOpacity(0.6),
                                        image: AssetImage(ImagesUtils.company1Icon,)
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpace(height: 10),
                              const TextWidget(
                                text: 'Site',
                                fontSize: 15,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              const VerticalSpace(height: 5),
                              Container(
                                decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                child: TextFieldWidget(
                                  cursorColor: ColorUtils.grey,
                                  focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                  disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                  enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                  hintTextColor:ColorUtils.grey,
                                  labelTextColor:ColorUtils.grey,
                                  controller: contactNameCtr,
                                  borderRadius: 30,
                                  hintText: "Enter Site",
                                  keyboardType: TextInputType.url,
                                  enabled: true,
                                  suffixIcon: Container(
                                    height: 30,
                                    width: 30,
                                    padding: EdgeInsets.all(13),
                                    child: Image(
                                        height: 20,
                                        width:20,
                                        color: ColorUtils.secondary.withOpacity(0.6),
                                        // color:  ColorUtils.grey.withOpacity(0.65),
                                        image: AssetImage(ImagesUtils.siteIcon)
                                    ),
                                  ),
                                ),
                              ),
                              VerticalSpace(height: 10),
                              const TextWidget(
                                text: 'Lead Source',
                                fontSize: 16,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                // textColor: Color(0xff1F1F1F),
                                fontWeight: FontWeight.w500,
                              ),
                              const VerticalSpace(height: 5),
                              Container(
                                padding: EdgeInsets.all(15),
                                decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                child: PopupMenuButton<String>(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  color: ColorUtils.white,
                                  onSelected: (value) {
                                    setState(() {
                                      leadSourceListSelectedValue = value;
                                    });
                                  },
                                  itemBuilder: (context) {
                                    return leadSourceList.map((item) {
                                      return PopupMenuItem<String>(
                                        height: 30,
                                        value: item,
                                        child: TextWidget(
                                          text: item,
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      );
                                    }).toList();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text: leadSourceListSelectedValue,
                                        fontSize: 14,
                                        textAlign: TextAlign.center,
                                        textColor: ColorUtils.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: ColorUtils.secondary.withOpacity(0.3),
                                            width: 1,
                                          ),
                                        ),
                                        child:  Icon(
                                          Icons.arrow_drop_down,
                                          size: 20,
                                          color: ColorUtils.secondary.withOpacity(0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpace(height: 10),
                        /// ----------------------- Address section ------------------------------
                        Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 14.5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const TextWidget(
                                      text: 'Address',
                                      fontSize: 15,
                                      textAlign: TextAlign.center,
                                      textColor: ColorUtils.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        setState(() {
                                          addressIsExpanded = !addressIsExpanded;
                                        });
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: ColorUtils.secondary.withOpacity(0.3),
                                            // color: const Color(0xFFEAECF0),
                                            width: 1,
                                          ),
                                        ),
                                        child:  Icon(
                                          addressIsExpanded
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          size: 20,
                                          color: ColorUtils.secondary.withOpacity(0.8),

                                          // color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              if(addressIsExpanded) ...[
                                const VerticalSpace(height: 10),
                                Container(
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: TextFieldWidget(
                                    cursorColor: ColorUtils.grey,
                                    focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                    disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                    enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                    hintTextColor:ColorUtils.grey,
                                    labelTextColor:ColorUtils.grey,
                                    controller: addressCtr,
                                    borderRadius: 30,
                                    hintText: "Enter Address",
                                    keyboardType: TextInputType.streetAddress,
                                    enabled: true,
                                    suffixIcon: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(13),
                                      child: Image(
                                          height: 20,
                                          width:20,
                                          color: ColorUtils.secondary.withOpacity(0.6),
                                          image: AssetImage(ImagesUtils.addressIcon)
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalSpace(height: 10),
                                const TextWidget(
                                  text: 'Locality',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: TextFieldWidget(
                                    cursorColor: ColorUtils.grey,
                                    focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                    disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                    enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                    hintTextColor:ColorUtils.grey,
                                    labelTextColor:ColorUtils.grey,
                                    controller: addressCtr,
                                    borderRadius: 30,
                                    hintText: "Enter Locality",
                                    keyboardType: TextInputType.streetAddress,
                                    enabled: true,
                                    suffixIcon: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(13),
                                      child: Image(
                                          height: 20,
                                          width:20,
                                          color: ColorUtils.secondary.withOpacity(0.6),
                                          image: AssetImage(ImagesUtils.locationMarkIcon)
                                      ),
                                    ),
                                  ),
                                ),
                                const VerticalSpace(height: 10),
                                const TextWidget(
                                  text: 'City/Country',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),

                                Container(
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: TextFieldWidget(
                                    cursorColor: ColorUtils.grey,
                                    focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                    disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                    enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                    hintTextColor:ColorUtils.grey,
                                    labelTextColor:ColorUtils.grey,
                                    controller: addressCtr,
                                    borderRadius: 30,
                                    hintText: "Enter City/Country",
                                    keyboardType: TextInputType.streetAddress,
                                    enabled: true,
                                    suffixIcon: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(13),
                                      child: Image(
                                          height: 20,
                                          width:20,
                                          color: ColorUtils.secondary.withOpacity(0.6),
                                          image: AssetImage(ImagesUtils.countryIcon)
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),
                                const TextWidget(
                                  text: 'Additional Info',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: TextFieldWidget(
                                    cursorColor: ColorUtils.grey,
                                    focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                    disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                    enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                    hintTextColor:ColorUtils.grey,
                                    labelTextColor:ColorUtils.grey,
                                    controller: contactNameCtr,
                                    borderRadius: 30,
                                    hintText: "Enter Additional Info",
                                    keyboardType: TextInputType.url,
                                    enabled: true,
                                    suffixIcon: Container(
                                      height: 30,
                                      width: 30,
                                      padding: const EdgeInsets.all(10),
                                      child: Icon(
                                        Icons.person,
                                        color: ColorUtils.secondary.withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),

                                const TextWidget(
                                  text: 'Phone No',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  // textColor: Color(0xff1F1F1F),
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: TextFieldWidget(
                                    cursorColor: ColorUtils.grey,
                                    focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                    disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                    enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                    hintTextColor:ColorUtils.grey,
                                    labelTextColor:ColorUtils.grey,
                                    controller: contactNameCtr,
                                    borderRadius: 30,
                                    hintText: "Enter Phone No",
                                    keyboardType: TextInputType.url,
                                    enabled: true,
                                    suffixIcon: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(13),
                                      child: Image(
                                          height: 20,
                                          width:20,
                                          color: ColorUtils.secondary.withOpacity(0.6),
                                          image: AssetImage(ImagesUtils.telephoneIcon)
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),
                              ]
                            ],
                          ),
                        ),
                        VerticalSpace(height:20),
                        /// ----------------------- Grouping section ------------------------------
                        Padding(
                          padding:  EdgeInsets.only(left: 15,right:15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(
                                text: 'Groupings',
                                fontSize: 15,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.primary,
                                fontWeight: FontWeight.w500,
                              ),
                              GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  setState(() {
                                    groupingsIsExpanded = !groupingsIsExpanded;
                                  });
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  margin: EdgeInsets.only(right: 13.5),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: ColorUtils.secondary.withOpacity(0.3),
                                      // color: const Color(0xFFEAECF0),
                                      width: 1,
                                    ),
                                  ),
                                  child:  Icon(
                                    groupingsIsExpanded
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    // Icons.arrow_drop_down,
                                    size: 20,
                                    color: ColorUtils.secondary.withOpacity(0.8),

                                    // color: Colors.grey,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        VerticalSpace(height: groupingsIsExpanded?10:0),

                        if(groupingsIsExpanded)
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextWidget(
                                  text: 'Job Interested',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: TextFieldWidget(
                                    cursorColor: ColorUtils.grey,
                                    focusBorderColor: ColorUtils.white.withOpacity(0.9),
                                    disableBorderColor: ColorUtils.white.withOpacity(0.3),
                                    enableBorderColor: ColorUtils.white.withOpacity(0.9),
                                    hintTextColor:ColorUtils.grey,
                                    labelTextColor:ColorUtils.grey,
                                    controller: contactNameCtr,
                                    borderRadius: 30,
                                    hintText: "Enter Job Interested",
                                    keyboardType: TextInputType.url,
                                    enabled: true,
                                    suffixIcon: Container(
                                      height: 30,
                                      width: 30,
                                      padding: EdgeInsets.all(13),
                                      child: Image(
                                          height: 20,
                                          width:20,
                                          color: ColorUtils.secondary.withOpacity(0.6),
                                          image: AssetImage(ImagesUtils.jobInterestedIcon)
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),

                                const TextWidget(
                                  text: 'Lead Type',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: PopupMenuButton<String>(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    color: ColorUtils.white,
                                    onSelected: (value) {
                                      setState(() {
                                        leadTypeListSelectedValue = value;
                                      });
                                    },
                                    itemBuilder: (context) {
                                      return leadTypeList.map((item) {
                                        return PopupMenuItem<String>(
                                          height: 30,
                                          value: item,
                                          child: TextWidget(
                                            text: item,
                                            fontSize: 14,
                                            textAlign: TextAlign.center,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: leadTypeListSelectedValue,
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorUtils.secondary.withOpacity(0.3),
                                              width: 1,
                                            ),
                                          ),
                                          child:  Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: ColorUtils.secondary.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),

                                const TextWidget(
                                  text: 'Industry',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: PopupMenuButton<String>(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    color: ColorUtils.white,
                                    onSelected: (value) {
                                      setState(() {
                                        industryListSelectedValue = value;
                                      });
                                    },
                                    itemBuilder: (context) {
                                      return industryList.map((item) {
                                        return PopupMenuItem<String>(
                                          height: 30,
                                          value: item,
                                          child: TextWidget(
                                            text: item,
                                            fontSize: 14,
                                            textAlign: TextAlign.center,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: industryListSelectedValue,
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorUtils.secondary.withOpacity(0.3),
                                              width: 1,
                                            ),
                                          ),
                                          child:  Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: ColorUtils.secondary.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                VerticalSpace(height: 10),

                                const TextWidget(
                                  text: 'Zone',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,
                                  child: PopupMenuButton<String>(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    color: ColorUtils.white,
                                    onSelected: (value) {
                                      setState(() {
                                        zoneListSelectedValue = value;
                                      });
                                    },
                                    itemBuilder: (context) {
                                      return zoneList.map((item) {
                                        return PopupMenuItem<String>(
                                          height: 30,
                                          value: item,
                                          child: TextWidget(
                                            text: item,
                                            fontSize: 14,
                                            textAlign: TextAlign.center,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: zoneListSelectedValue,
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorUtils.secondary.withOpacity(0.3),
                                              width: 1,
                                            ),
                                          ),
                                          child:  Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: ColorUtils.secondary.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                VerticalSpace(height: 10),

                                const TextWidget(
                                  text: 'Group',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,

                                  child: PopupMenuButton<String>(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    color: ColorUtils.white,
                                    onSelected: (value) {
                                      setState(() {
                                        groupListSelectedValue = value;
                                      });
                                    },
                                    itemBuilder: (context) {
                                      return groupList.map((item) {
                                        return PopupMenuItem<String>(
                                          height: 30,
                                          value: item,
                                          child: TextWidget(
                                            text: item,
                                            fontSize: 14,
                                            textAlign: TextAlign.center,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: groupListSelectedValue,
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorUtils.secondary.withOpacity(0.3),
                                              width: 1,
                                            ),
                                          ),
                                          child:  Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: ColorUtils.secondary.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),

                                const TextWidget(
                                  text: 'Category',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,

                                  child: PopupMenuButton<String>(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    color: ColorUtils.white,
                                    onSelected: (value) {
                                      setState(() {
                                        categoryListSelectedValue = value;
                                      });
                                    },
                                    itemBuilder: (context) {
                                      return categoryList.map((item) {
                                        return PopupMenuItem<String>(
                                          height: 30,
                                          value: item,
                                          child: TextWidget(
                                            text: item,
                                            fontSize: 14,
                                            textAlign: TextAlign.center,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: categoryListSelectedValue,
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorUtils.secondary.withOpacity(0.3),
                                              width: 1,
                                            ),
                                          ),
                                          child:  Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: ColorUtils.secondary.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),

                                const TextWidget(
                                  text: 'Sub Category',
                                  fontSize: 15,
                                  textAlign: TextAlign.center,
                                  textColor: ColorUtils.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                                const VerticalSpace(height: 5),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  decoration:CommonBoxDecorations.textFieldDecorationDecoration,

                                  child: PopupMenuButton<String>(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    color: ColorUtils.white,
                                    onSelected: (value) {
                                      setState(() {
                                        subCategoryListSelectedValue = value;
                                      });
                                    },
                                    itemBuilder: (context) {
                                      return subCategoryList.map((item) {
                                        return PopupMenuItem<String>(
                                          height: 30,
                                          value: item,
                                          child: TextWidget(
                                            text: item,
                                            fontSize: 14,
                                            textAlign: TextAlign.center,
                                            textColor: ColorUtils.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: subCategoryListSelectedValue,
                                          fontSize: 14,
                                          textAlign: TextAlign.center,
                                          textColor: ColorUtils.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: ColorUtils.secondary.withOpacity(0.3),
                                              width: 1,
                                            ),
                                          ),
                                          child:  Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: ColorUtils.secondary.withOpacity(0.8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                VerticalSpace(height: 10),
                              ],
                            ),
                          ),

                        const VerticalSpace(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: ButtonWidget(
                            navigateTo: _editAndSubmitData ,
                            buttonName: 'Submit',
                            borderRadius: 30,
                            width: screenWidth(context),
                            height: 50,
                            buttonTextColor: ColorUtils.white,
                            buttonColor: ColorUtils.primary,
                          ),
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
