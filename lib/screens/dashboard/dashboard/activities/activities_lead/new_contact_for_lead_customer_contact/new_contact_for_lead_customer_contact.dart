import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/new_contact_for_lead_customer_contact/contact_new_contact.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/new_contact_for_lead_customer_contact/customer_new_contact.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/new_contact_for_lead_customer_contact/lead_new_contact.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

enum ContactTabType {lead,customer,contact}

class NewContactsForLeadCustomerContact extends StatefulWidget {
  const NewContactsForLeadCustomerContact({super.key});

  @override
  State<NewContactsForLeadCustomerContact> createState() => _NewContactsForLeadCustomerContactState();
}

class _NewContactsForLeadCustomerContactState extends State<NewContactsForLeadCustomerContact> {

  ContactTabType selectedTab = ContactTabType.lead;

  void onTabChange(ContactTabType type) {
    setState(() {
      selectedTab = type;
    });
  }

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
          text: "New contact".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8,bottom: 5),
            child: Row(
              children: [
                _tabItem("Lead", ContactTabType.lead),
                _tabItem("Customer", ContactTabType.customer),
                _tabItem("Contact", ContactTabType.contact),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration:  BoxDecoration(
            color:ColorUtils.lightScreenBackground
        ),
        child: SafeArea(
          child: _buildTabUI(),
        ),
      ),
    );
  }

  Widget _buildTabUI() {
    switch (selectedTab) {
      case ContactTabType.lead:
        return LeadNewContact();

      case ContactTabType.customer:
        return CustomerNewContact();

      case ContactTabType.contact:
        return ContactNewContact();
    }
  }

  Widget _tabItem(String title, ContactTabType type) {
    final bool isSelected = selectedTab == type;

    return Expanded(
      child: InkWell(
        onTap: () => onTabChange(type),
        borderRadius: BorderRadius.circular(11),
        child: Container(
          height: 38,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            gradient:isSelected?
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3742fa),
                Color(0xff70a1ff),
              ],
            ) :null,
            borderRadius: BorderRadius.circular(isSelected?100:0),
            border: Border.all(
              color: isSelected? ColorUtils.white.withOpacity(0.8):Colors.transparent,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: title,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                textColor:isSelected?  ColorUtils.white:ColorUtils.white.withOpacity(0.75),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
