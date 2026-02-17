import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_attachments/activities_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_note/activities_note.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ProjectWorkingWithDetails extends StatefulWidget {
  const ProjectWorkingWithDetails({super.key});

  @override
  State<ProjectWorkingWithDetails> createState() => _ProjectWorkingWithDetailsState();
}

class _ProjectWorkingWithDetailsState extends State<ProjectWorkingWithDetails> {
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
          text: "2nd project name full name".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),

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
                      text: 'Project Information',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "Create Date", value: "07-Mar-2020"),
                      LeadInformationInnerWidget(label: "Project", value: "FLEXIBIZ ERP"),
                      LeadInformationInnerWidget(label: "Address", value: "Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk)"),
                      LeadInformationInnerWidget(label: "Customer", value: "HAIR COLOR"),
                      LeadInformationInnerWidget(label: "Start Date", value: "EAST ZONE"),
                      LeadInformationInnerWidget(label: "Due Date", value: "..."),
                      LeadInformationInnerWidget(label: "Actual Date", value: "CRM Category 2 "),
                      LeadInformationInnerWidget(label: "Value", value: "..."),
                      LeadInformationInnerWidget(label: "project Disc", value: "TEST JOB LAMINATE"),
                      LeadInformationInnerWidget(label: "PmtTerms", value: "www.flexibiz-erp.com"),
                      LeadInformationInnerWidget(label: "Adl Info", value: "vbansal134@gmail.com"),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Files", value: "13 Files", valueIcon: ImagesUtils.uploadFileIcon,isUnderline: true,
                        onTap: (){
                          ScreenNavigationUtils.push(
                            context,
                            child: const ActivitiesAttachments(),
                            type: PageTransitionType.fade,
                          );
                        },
                      ),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Notes", value: "2 Notes", valueIcon: ImagesUtils.noteIcon,isUnderline: true,
                        onTap: (){
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
                      text: 'Project-Parts',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "Job", value: "Project2-Job 1 Project Wtg : 30% Start : 28-Nov-20218 Procress : 0%",valueColor: ColorUtils.secondary,),
                      LeadInformationInnerWidget(label: "Job", value: "Project2-Job 1 Project Wtg : 30% Start : 28-Nov-20218 Procress : 0%",valueColor: ColorUtils.secondary,),
                      LeadInformationInnerWidget(label: "Job", value: "Project2-Job 1 Project Wtg : 30% Start : 28-Nov-20218 Procress : 0%",valueColor: ColorUtils.secondary,),

                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Additional Contact Tile =======================
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
                      text: 'Additional Contacts',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(label: "Others", value: "07-Mar-2020   Time: 02:02 Task : Test new Task One"),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "Mobile", value: "9810234567", valueIcon: ImagesUtils.uploadFileIcon,isUnderline: true,
                        onTap: (){
                          ContactActionUtils.makePhoneCall("9810234567",);
                          },
                      ),
                      LeadInformationInnerWidgetWithValueIcon(
                        label: "MailId", value: "newtestmail@gmail.com", valueIcon: ImagesUtils.noteIcon,isUnderline: true,
                        onTap: (){
                          ContactActionUtils.sendEmail("newtestmail@gmail.com",);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Followup Tile =======================
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
                      text: 'Followups',
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

// class LeadInformationInnerWidgetWithValueIcon extends StatelessWidget {
//   final String label;
//   final String value;
//   final String valueIcon;
//   final bool isUnderline;
//
//
//   const LeadInformationInnerWidgetWithValueIcon({super.key, required this.label, required this.value, required this.valueIcon, this.isUnderline = false});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             flex: 1,
//             child: TextWidget(
//               text: label,
//               fontSize: 13,
//               textAlign: TextAlign.start,
//               textColor: ColorUtils.primary,
//               // textColor: Color(0xff1F1F1F),
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           TextWidget(
//             text: ': ',
//             fontSize: 12,
//             textAlign: TextAlign.start,
//             textColor: ColorUtils.black.withOpacity(0.85),
//             fontWeight: FontWeight.w700,
//           ),
//           Expanded(
//             flex: 3,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                     height: 15,
//                     width: 15,
//                     child: Image(image: AssetImage(valueIcon),height: 14,color: ColorUtils.secondary,)),
//                 HorizontalSpace(width: 5),
//                 Expanded(
//                   child: GestureDetector(
//                     onTap: (){}, /// onTap use kar bhi sakte hai nhi bhi
//                     child: TextWidget(
//                       text: ' $value',
//                       fontSize: 14,
//                       textAlign: TextAlign.start,
//                       textColor:ColorUtils.secondary,
//                       fontWeight: FontWeight.w500,
//                       textDecoration:isUnderline ? TextDecoration.underline : TextDecoration.none,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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



