import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_complaint/complaint_activities_with_details/complaint_activities_with_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_attachments/activities_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_note/activities_note.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/lead_activities_with_details/lead_activities_with_details.dart' hide LeadInformationInnerWidget;
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PendingTasksOtherListDetails extends StatefulWidget {
  const PendingTasksOtherListDetails({super.key});

  @override
  State<PendingTasksOtherListDetails> createState() => _PendingTasksOtherListDetailsState();
}

class _PendingTasksOtherListDetailsState extends State<PendingTasksOtherListDetails> {
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
        centerTitle: true,
        title: TextWidget(
          text: "Vikash Sharma".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),

      ),
      body: Container(
        padding: EdgeInsets.all(12),
        // color: ColorUtils.lightScreenBackground,
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// =================== Contact Information Tile =======================
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
                      text: 'Contact Information',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "Executive",
                        value: "Amit Kumar",
                      ),

                      LeadInformationInnerWidget(
                        label: "Create Date",
                        value: "07-Mar-2025",
                      ),

                      LeadInformationInnerWidget(
                        label: "Name",
                        value: "FlexiBiz ERP Pvt Ltd",
                      ),

                      LeadInformationInnerWidget(
                        label: "Address",
                        value:
                        "Greater Noida West (Noida Extension), Gaur City 1, near Gaur Chowk, UP - 201318",
                      ),

                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Mobile",
                        value: "9876543210",
                        valueIcon: ImagesUtils.mobileNoIcon,
                        isUnderline: true,
                        onTap: () {
                          ContactActionUtils.makePhoneCall("9876543210");
                        },
                      ),

                      LeadInformationInnerWidgetWithValueIcon(
                        label: "MailId",
                        value: "contact@flexibiz.com",
                        valueIcon: ImagesUtils.emailIcon,
                        isUnderline: true,
                        onTap: () {
                          ContactActionUtils.sendEmail("contact@flexibiz.com");
                        },
                      ),

                      LeadInformationInnerWidget(
                        label: "Phone",
                        value: "0120-4567890",
                      ),

                      LeadInformationInnerWidget(
                        label: "Status",
                        value: "Active Lead",
                      ),

                      LeadInformationInnerWidget(
                        label: "Adl Info",
                        value: "Interested in ERP & CRM Solutions",
                      ),

                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Files",
                        value: "13 Files",
                        valueIcon: ImagesUtils.uploadFileIcon,
                        isUnderline: true,
                        onTap: () {
                          ScreenNavigationUtils.push(
                            context,
                            child: const ActivitiesAttachments(),
                            type: PageTransitionType.fade,
                          );
                        },
                      ),

                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Notes",
                        value: "2 Notes",
                        valueIcon: ImagesUtils.noteIcon,
                        isUnderline: true,
                        onTap: () {
                          ScreenNavigationUtils.push(
                            context,
                            child: const ActivitiesNote(),
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
                      LeadInformationInnerWidget(
                        label: "super",
                        value: "11-Dec-2017  Follow-up call completed with client",
                      ),

                      LeadInformationInnerWidget(
                        label: "super",
                        value: "22-Jan-2018  Meeting scheduled for project discussion",
                      ),

                      LeadInformationInnerWidget(
                        label: "super",
                        value: "05-Mar-2019  Client requested updated quotation",
                      ),

                      LeadInformationInnerWidget(
                        label: "super",
                        value: "18-Jul-2020  Demo given, awaiting feedback",
                      ),

                      LeadInformationInnerWidget(
                        label: "super",
                        value: "09-Nov-2021  Payment discussion in progress",
                      ),

                      LeadInformationInnerWidget(
                        label: "super",
                        value: "14-Feb-2023  Contract shared via email",
                      ),

                      LeadInformationInnerWidget(
                        label: "super",
                        value: "27-Aug-2024  Lead converted successfully",
                      ),


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
                      LeadInformationInnerWidget(
                        label: "Friend",
                        value:
                        "Date : 12-Jan-2023\n"
                            "Time : 11:15 AM\n"
                            "Task : Client follow-up call\n"
                            "Remarks : Interested, callback scheduled",
                      ),

                      LeadInformationInnerWidget(
                        label: "Superyes",
                        value:
                        "Date : 28-Feb-2024\n"
                            "Time : 04:40 PM\n"
                            "Task : Site visit discussion\n"
                            "Remarks : Meeting completed successfully",
                      ),

                      LeadInformationInnerWidget(
                        label: "SUPER",
                        value:
                        "Date : 05-Aug-2024\n"
                            "Time : 10:00 AM\n"
                            "Task : Proposal review with team\n"
                            "Remarks : Approved by manager",
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