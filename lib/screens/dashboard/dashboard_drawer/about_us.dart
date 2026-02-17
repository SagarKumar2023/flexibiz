import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
          text: "ABOUT US",
          textColor: ColorUtils.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          width: screenWidth(context),
          decoration: CommonBoxDecorations.screenBackgroundDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              TextWidget(
                text: 'Flexibiz CRM',
                fontSize: 22,
                textColor: ColorUtils.secondary,
                fontWeight: FontWeight.w800,
              ),

              const SizedBox(height: 12),

              /// PARAGRAPH 1
              TextWidget(
                text:
                'Welcome To Kiran Consultants Pvt. Ltd. -> Flexibiz CRM mobile application.',
                fontSize: 13.5,
                textColor: ColorUtils.black.withOpacity(0.75),
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 14),

              /// PARAGRAPH 2
              TextWidget(
                text:
                'Kiran Consultants(P) Ltd is a renowned software company at Delhi having catered to diverse industry segments with special focus on the Printing & Packaging industry.',
                fontSize: 13.5,
                textColor: ColorUtils.black.withOpacity(0.75),
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 14),

              /// PARAGRAPH 3
              TextWidget(
                text:
                'Flexibiz CRM app can be used by majority of Business Entities and Industries for their marketing activities like Leads Management, Contacts Management, Quotations, Sales Targets, Tour Expenses Monitoring, Marketing Representative Attendance, their online logging of the followups, tasks management, auto logging of mails thru the mobiles as well. This also help in Managing any type of file attachments with specific leads and/or common library of of files shared by all Marketing persons.',
                fontSize: 13.5,
                textColor: ColorUtils.black.withOpacity(0.75),
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 14),

              /// PARAGRAPH 4
              TextWidget(
                text:
                'Flexibiz CRM is also suitable for Post Sales complaints and recording their complete followups with the clients, service costs, travel expenses, engineer costs on the services etc.',
                fontSize: 13.5,
                textColor: ColorUtils.black.withOpacity(0.75),
                fontWeight: FontWeight.w500,
              ),

              const SizedBox(height: 20),

              /// LINK
              InkWell(
                onTap: () {
                  ContactActionUtils.openWebsite("https://flexibiz-erp.com");
                  //"https://flexibiz-erp.com" website pe ye redirect hoga
                },
                child: TextWidget(
                  text: 'Visit Our Site For Details',
                  fontSize: 14,
                  textColor: ColorUtils.primary,
                  fontWeight: FontWeight.w600,
                  textDecoration: TextDecoration.underline,
                  decorationColor: ColorUtils.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}












