import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_contact/contact_attachments/contact_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_contact/contact_note/contact_note.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/lead_activities_with_details/lead_activities_with_details.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ContactActivitiesWithDetails extends StatefulWidget {
  const ContactActivitiesWithDetails({super.key});

  @override
  State<ContactActivitiesWithDetails> createState() =>
      _ContactActivitiesWithDetailsState();
}

class _ContactActivitiesWithDetailsState extends State<ContactActivitiesWithDetails> {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        title: TextWidget(
          text: "Flexibiz erp".toUpperCase(),
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

          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image(
              image: AssetImage(ImagesUtils.locationShareIcon),
              color: Colors.white,
              height: 20,
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
              /// =================== Lead Information Tile =======================
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
                      text: 'Lead Information',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "Executive", value: "Super"),
                      LeadInformationInnerWidget(label: "Create Date", value: "07-Mar-2020"),
                      LeadInformationInnerWidget(label: "Customer", value: "FLEXIBIZ ERP"),
                      LeadInformationInnerWidget(label: "Address", value: "Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk)"),
                      LeadInformationInnerWidget(label: "Industry", value: "HAIR COLOR"),
                      LeadInformationInnerWidget(label: "zone", value: "EAST ZONE"),
                      LeadInformationInnerWidget(label: "Group", value: "..."),
                      LeadInformationInnerWidget(label: "Category", value: "CRM Category 2 "),
                      LeadInformationInnerWidget(label: "Sub Category", value: "..."),
                      LeadInformationInnerWidget(label: "Job", value: "TEST JOB LAMINATE"),
                      LeadInformationInnerWidget(label: "Website", value: "www.flexibiz-erp.com"),
                      LeadInformationInnerWidget(label: "MailId", value: "vbansal134@gmail.com"),
                      LeadInformationInnerWidget(label: "PhNo", value: "7295992601"),
                      LeadInformationInnerWidget(label: "Lead", value: "Hot"),
                      LeadInformationInnerWidget(label: "Final Status", value: "Open dt."),
                      LeadInformationInnerWidget(label: "Contact", value: "VAIBHAV BANSAL NEW TEST Design Director"),
                      LeadInformationInnerWidgetWithValueIcon(label: "Mobile", value: "9958859899", valueIcon: ImagesUtils.mobileNoIcon,isUnderline: true,),
                      LeadInformationInnerWidgetWithValueIcon(label: "MailId", value: "vbansal134@gmail.com", valueIcon: ImagesUtils.emailIcon),
                      LeadInformationInnerWidgetWithValueIcon(label: "Files", value: "13 Files", valueIcon: ImagesUtils.uploadFileIcon,isUnderline: true,
                        onTap: (){
                          ScreenNavigationUtils.push(
                            context,
                            child: const ContactAttachments(),
                            type: PageTransitionType.fade,
                          );
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ContactAttachments(),));
                        },
                      ),
                      LeadInformationInnerWidgetWithValueIcon(label: "Notes", value: "2 Notes", valueIcon: ImagesUtils.noteIcon,isUnderline: true,
                        onTap: (){
                          ScreenNavigationUtils.push(
                            context,
                            child: const ContactNote(),
                            type: PageTransitionType.fade,
                          );
                        },
                      ),
          
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Followups Tile =======================
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
                      text: 'Followups',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "SUPER", value: "07-Mar-2020   test followup 1"),
                      LeadInformationInnerWidget(label: "SUPER", value: "09-Mar-2020   test followup 2"),
                      LeadInformationInnerWidget(label: "SUPER", value: "10-Mar-2020   test followup 3"),
                      LeadInformationInnerWidget(label: "SUPER", value: "11-Mar-2020   test followup new"),
                      LeadInformationInnerWidget(label: "SUPER", value: "12-Mar-2020   test followup 4"),
                      LeadInformationInnerWidget(label: "SUPER", value: "13-Mar-2020   Meeting Done xyz.........")
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Pending Tasks Tile =======================
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
                      text: 'Pending Tasks',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "SUPER", value: "07-Mar-2020   Time: 02:02 Task : Test new Task One"),
                      LeadInformationInnerWidget(label: "SUPER", value: "09-Mar-2020   Time: 03:08 Task : Test new Task Two"),
                      LeadInformationInnerWidget(label: "SUPER", value: "13-Mar-2020   Time: 04:10 Task : Test new Task Three")
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Closed Tasks Tile =======================
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
                      text: 'Closed Tasks',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "SUPER", value: "Date : 07-Mar-2020\nTime : 02:02 \nTask : Task for myself  \nRemarks : Task Closed"),
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
  const LeadInformationInnerWidget({super.key, required this.label, required this.value, this.valueColor});

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
            child: TextWidget(
              text: ' $value',
              fontSize: 14,
              textAlign: TextAlign.start,
              textColor:valueColor??ColorUtils.black.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}


