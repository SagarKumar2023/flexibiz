import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_attachments/activities_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_note/activities_note.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ProjectWorkingCustomerDetailsView extends StatefulWidget {
  const ProjectWorkingCustomerDetailsView({super.key});

  @override
  State<ProjectWorkingCustomerDetailsView> createState() => _ProjectWorkingCustomerDetailsViewState();
}

class _ProjectWorkingCustomerDetailsViewState extends State<ProjectWorkingCustomerDetailsView> {
  final TextEditingController registerLinkCtr = TextEditingController();
  int _expandedIndex = 0; // 1st tile open by default
  bool isFavourite = false;
  final Set<String> favouriteItems = {};

  void showFavouriteDialog({
    required BuildContext context,
    required String message,
    required VoidCallback onOk,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          backgroundColor: ColorUtils.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: TextWidget(
            text: message,
            fontSize: 16,
            textAlign: TextAlign.center,
            textColor: ColorUtils.black,
            fontWeight: FontWeight.w500,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ButtonWidget(
              navigateTo: () {
                Navigator.pop(context);
                onOk();
              } ,
              buttonName: 'OK',
              borderRadius: 10,
              width: screenWidth(context),
              height: 40,
              buttonTextColor: ColorUtils.white,
              buttonColor: ColorUtils.primary,
            ),
          ],
        );
      },
    );
  }

   String mailContentText = '''
Dear Sir

Greetings!!!!

We are ERP and CRM Solution providers for Flexible Packaging Industry since 1988 having UFLEX Group as one of many clients.

Our ERP Solution Coverage: Auto Logged mail
1. Materials Management
2. PPC, Production, Scheduling, QC
3. Cylinder/Plates Handling
4. Plant Maintenance
5. Customer Complaints handling
6. Dispatch and Sales MIS
7. Accounts and Finance

Our Pre-Sales CRM coverage:

1. Enquiry and Leads Management
2. Job Cost Estimation based on Laminate Structure
3. Quotations, Amendments, Follow-up Tracking
4. Account ownership and security - Sales Rep wise
5. Marketing Rep/Team performance analysis, Value Additions
6. Sales Target, Sales Projections
7. Marketing Mail campaigns
8. Central Data Repository - Files/Images/Flyers/Price Lists

Solution is cost effective and Industry Specific. EASY TO USE. It can be hosted on Cloud or In-House Server.
Let us know if there is any opportunity in your organization.
Feel free to contact the undersigned for more details.

Thanks & Regards

SUPER
CMO
Kiran Consultants (P) Ltd
A 89 Sector 58, Noida
U.P.
+91-0120-6404080
+91-9810170432
E: kcnoida@gmail.com
W: www.flexibiz-erp.com
''';



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
          text: "new customer mob".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                if (!isFavourite) {
                  /// ADD
                  showFavouriteDialog(
                    context: context,
                    message: 'Added to your Favourite Successfully..',
                    onOk: () {
                      setState(() {
                        isFavourite = true;
                        favouriteItems.add('lead_1'); // store
                      });
                    },
                  );
                } else {
                  /// REMOVE
                  showFavouriteDialog(
                    context: context,
                    message: 'Remove Successfully from your Favourites..',
                    onOk: () {
                      setState(() {
                        isFavourite = false;
                        favouriteItems.remove('lead_1');
                      });
                    },
                  );
                }
              },
              child: Image(
                image: AssetImage(
                  isFavourite
                      ? ImagesUtils.starWithColorIcon
                      : ImagesUtils.starWithoutColorIcon,
                ),
                color: Colors.orange,
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        color: ColorUtils.lightScreenBackground,
        height: screenHeight(context),
        width: screenWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// =================== Customer Information Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('lead_info'),
                    initiallyExpanded: _expandedIndex == 0,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 0 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'Customer Information',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "Executive", value: "Rohit Sharma"),
                      LeadInformationInnerWidget(label: "Create Date", value: "12-Aug-2024"),
                      LeadInformationInnerWidget(label: "Name", value: "FlexiBiz ERP Solutions"),
                      LeadInformationInnerWidget(
                        label: "Abr Name",
                        value: "Gaur City 1, Near Kisan Chowk, Greater Noida West",
                      ),
                      LeadInformationInnerWidget(label: "Division", value: "Sales & Marketing"),
                      LeadInformationInnerWidget(label: "Industry", value: "Information Technology"),
                      LeadInformationInnerWidget(label: "Zone", value: "North Zone"),
                      LeadInformationInnerWidget(label: "Group", value: "CRM Category 2"),
                      LeadInformationInnerWidget(label: "Category", value: "Enterprise Software"),
                      LeadInformationInnerWidget(label: "Sub Category", value: "ERP Implementation"),
                      LeadInformationInnerWidget(
                        label: "Address",
                        value: "A-12, Tech Park, Sector 63, Noida",
                      ),
                      LeadInformationInnerWidget(
                        label: "Website",
                        value: "https://www.flexibiz-erp.com",
                      ),
                      LeadInformationInnerWidget(
                        label: "MailId",
                        value: "contact@flexibiz-erp.com",
                      ),
                      LeadInformationInnerWidget(
                        label: "PhNo",
                        value: "+91 98765 43210",
                      ),
                      LeadInformationInnerWidget(
                        label: "PmtTerms",
                        value: "30 Days Credit",
                      ),
                      LeadInformationInnerWidget(
                        label: "MontReq",
                        value: "₹2,50,000 per month",
                      ),
                      LeadInformationInnerWidget(
                        label: "History",
                        value: "Client since 2021, renewed annually",
                      ),
                      LeadInformationInnerWidget(
                        label: "StopMail",
                        value: "No",
                      ),
                      LeadInformationInnerWidget(
                        label: "Adl Info",
                        value: "Interested in mobile app integration",
                      ),

                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Files", value: "13 Files", valueIcon: ImagesUtils.uploadFileIcon,isUnderline: true,
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ActivitiesAttachments(),));
                        },
                      ),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Notes", value: "2 Notes", valueIcon: ImagesUtils.noteIcon,isUnderline: true,
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ActivitiesNote(),));
                        },
                      ),

                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Customer Contacts Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('followups'),
                    initiallyExpanded: _expandedIndex == 1,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 1 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'Customer Contacts',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "Main", value: "Kiran Bansal Desig : SW consultant changed Kiran"),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Mobile", value: "7295992601", valueIcon: ImagesUtils.mobileNoIcon,isUnderline: true,
                        onTap: (){
                          ContactActionUtils.makePhoneCall("7295992601");
                        },
                      ),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "MailId", value: "kiran@gail.com", valueIcon: ImagesUtils.emailIcon,isUnderline: true,
                        onTap: (){
                          ContactActionUtils.sendEmail("kiran@gail.com");

                        },
                      ),
                      LeadInformationInnerWidget(label: "Other", value: "Yashasvi Bansal Desig : GM TGGGG"),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Mobile", value: "8234567876", valueIcon: ImagesUtils.mobileNoIcon,isUnderline: true,
                        onTap: (){
                          ContactActionUtils.makePhoneCall("8234567876");
                        },
                      ),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "MailId", value: "kcNoid@gail.com", valueIcon: ImagesUtils.emailIcon,isUnderline: true,
                        onTap: (){
                          ContactActionUtils.sendEmail("kcNoid@gail.com");

                        },
                      ),


                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// ===================  Access to Executive Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('pending_tasks'),
                    initiallyExpanded: _expandedIndex == 2,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 2 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: "Access to Executive",
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "", value: "SUPER \nMOB : 8767976456  \nDesign : Stockist  \nMailId : KcNoida@gmial.com"),

                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Projects Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('pending_tasks'),
                    initiallyExpanded: _expandedIndex == 2,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 2 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'Projects',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "Name", value: "2nd Project Name Full Name Start  Date : 10-jan-2018 status : Open",valueColor: ColorUtils.secondary,),

                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),

              /// ===================  FollowUps Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('closed_tasks'),
                    initiallyExpanded: _expandedIndex == 3,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 3 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'Followups',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "SUPER", value: "17-Mar-2020\nPET 12 120 DELDT 05/01/17 "),
                      LeadInformationInnerWidget(label: "SUPER", value: "18-Mar-2017 Mail Sent :\nKiranbansal222@gmail.com\nSubject : ERP and CRM solution for flexibiz packaging laminations, labels  "),
                      LeadInformationInnerWidget(
                        label: "SUPER", value: "07-Mar-2020\n text Click ",valueColor: ColorUtils.secondary,
                        valueOnTap: (){
                          showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              backgroundColor:
                              Colors.transparent,
                              insetPadding:
                              const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: SizedBox(
                                height: 600,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin:
                                      EdgeInsets.only(
                                        top: 17,
                                      ),
                                      padding:
                                      const EdgeInsets.all(
                                        16,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(
                                          12,
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment
                                              .topCenter,
                                          end: Alignment
                                              .bottomCenter,
                                          colors: [
                                            Color(
                                              0xFFFFFFFF,
                                            ),
                                            Color(
                                              0xFFF8F8FF,
                                            ),
                                          ],
                                          stops: [
                                            0.0,
                                            1.0,
                                          ],
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const VerticalSpace(height: 10,),
                                            /// image saare content yaha pe display karna hai
                                            TextWidget(
                                              text: mailContentText,
                                              fontSize: 14,
                                              textAlign: TextAlign.start,
                                              textColor: const Color(0xff1F1F1F),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            const VerticalSpace(
                                              height:
                                              14,
                                            ),
                                        
                                            ButtonWidget(
                                              navigateTo: () {
                                                Navigator.pop(
                                                  context,
                                                );
                                              },
                                              buttonName:
                                              'OK',
                                              borderRadius:
                                              10,
                                              height:
                                              30,
                                              buttonTextColor:
                                              ColorUtils.white,
                                              buttonColor:
                                              ColorUtils.primary,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                      Alignment
                                          .topCenter,
                                      child: Container(
                                        padding:
                                        EdgeInsets.only(
                                          left:
                                          14,
                                          right:
                                          14,
                                          top: 5,
                                          bottom:
                                          7,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                            20,
                                          ),
                                          color: Color(
                                            0xFFFFFFFF,
                                          ),
                                        ),
                                        child: TextWidget(
                                          text:
                                          "Mail Content",
                                          fontSize:
                                          15.5,
                                          textColor:
                                          ColorUtils
                                              .secondary,
                                          fontWeight:
                                          FontWeight
                                              .w700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class LeadInformationInnerWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor ;
  final VoidCallback? valueOnTap;
  const LeadInformationInnerWidget({super.key, required this.label, required this.value, this.valueColor, this.valueOnTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TextWidget(
              text: label,
              fontSize: 13,
              textAlign: TextAlign.start,
              textColor: ColorUtils.primary,
              // textColor: Color(0xff1F1F1F),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextWidget(
            text: ':',
            fontSize: 12,
            textAlign: TextAlign.start,
            textColor: ColorUtils.black.withOpacity(0.85),
            fontWeight: FontWeight.w700,
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: valueOnTap,
              child: TextWidget(
                text: ' $value',
                fontSize: 14,
                textAlign: TextAlign.start,
                textColor:valueColor??ColorUtils.black.withOpacity(0.85),
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LeadInformationInnerWidgetWithValueIcon extends StatelessWidget {
  final String label;
  final String value;
  final String? valueIcon;
  final bool isUnderline;
  final VoidCallback? onTap;

  const LeadInformationInnerWidgetWithValueIcon({
    super.key,
    required this.label,
    required this.value,
    this.valueIcon,
    this.isUnderline = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Expanded(
            flex: 1,
            child: TextWidget(
              text: label,
              fontSize: 13,
              textAlign: TextAlign.start,
              textColor: ColorUtils.primary,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// :
          TextWidget(
            text: ': ',
            fontSize: 12,
            textColor: ColorUtils.black.withOpacity(0.85),
            fontWeight: FontWeight.w700,
          ),

          /// Value + Icon
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (valueIcon != null)
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset(
                      valueIcon!,
                      height: 14,
                      color: ColorUtils.secondary,
                    ),
                  ),

                if (valueIcon != null)
                  const HorizontalSpace(width: 5),

                Expanded(
                  child: GestureDetector(
                    onTap: onTap,
                    child: TextWidget(
                      text: value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w500,
                      textDecoration:
                      isUnderline ? TextDecoration.underline : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}



