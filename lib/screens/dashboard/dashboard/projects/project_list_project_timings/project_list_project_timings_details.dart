import 'dart:ui';

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_new_task.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_attachments/project_working_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_auto_loged_mail/project_working_auto_loged_mail.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_customerDetailsView.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_log_followups.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_note/project_working_note.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_verification.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_with_details/project_working_with_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/selection_criteria_dialog.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class ProjectListProjectTimingsDetails extends StatefulWidget {
  final DateTime fromDate;
  final DateTime toDate;
  const ProjectListProjectTimingsDetails({super.key, required this.fromDate, required this.toDate});

  @override
  State<ProjectListProjectTimingsDetails> createState() => _ProjectListProjectTimingsDetailsState();
}

class _ProjectListProjectTimingsDetailsState extends State<ProjectListProjectTimingsDetails> {

  final List<ListProjectTimingModel> listProjectTimingList = [
    ListProjectTimingModel(
      project: "CRM Revamp",
      address: "Sector 62, Noida",
      customer: "Sagar Kumar",
      vrDate: "18-Mar-2023",
      timeIn: "09:45",
      timeOut: "12:30",
      hour: "2",
      minute: "45",
    ),

    ListProjectTimingModel(
      project: "Mobile App UI",
      address: "DLF Phase 3, Gurugram",
      customer: "Amit Sharma",
      vrDate: "07-Jul-2023",
      timeIn: "10:15",
      timeOut: "14:10",
      hour: "3",
      minute: "55",
    ),

    ListProjectTimingModel(
      project: "Inventory System",
      address: "Indira Nagar, Lucknow",
      customer: "Neha Verma",
      vrDate: "22-Jan-2024",
      timeIn: "11:00",
      timeOut: "16:40",
      hour: "5",
      minute: "40",
    ),

    ListProjectTimingModel(
      project: "Attendance System",
      address: "Kankarbagh, Patna",
      customer: "Rahul Singh",
      vrDate: "09-May-2024",
      timeIn: "09:30",
      timeOut: "13:00",
      hour: "3",
      minute: "30",
    ),

    ListProjectTimingModel(
      project: "Billing Module",
      address: "Rajendra Nagar, Delhi",
      customer: "Pooja Mishra",
      vrDate: "14-Oct-2024",
      timeIn: "10:00",
      timeOut: "15:20",
      hour: "5",
      minute: "20",
    ),

    ListProjectTimingModel(
      project: "Sales Dashboard",
      address: "Whitefield, Bangalore",
      customer: "Arjun Patel",
      vrDate: "03-Feb-2025",
      timeIn: "09:10",
      timeOut: "12:55",
      hour: "3",
      minute: "45",
    ),

    ListProjectTimingModel(
      project: "HR Portal",
      address: "Viman Nagar, Pune",
      customer: "Kunal Mehta",
      vrDate: "27-Jun-2025",
      timeIn: "11:20",
      timeOut: "17:00",
      hour: "5",
      minute: "40",
    ),

    ListProjectTimingModel(
      project: "Project Tracker",
      address: "Salt Lake, Kolkata",
      customer: "Sneha Roy",
      vrDate: "11-Nov-2025",
      timeIn: "10:30",
      timeOut: "14:00",
      hour: "3",
      minute: "30",
    ),

    ListProjectTimingModel(
      project: "Client Visit",
      address: "Banjara Hills, Hyderabad",
      customer: "Vikram Reddy",
      vrDate: "08-Jan-2026",
      timeIn: "09:50",
      timeOut: "13:40",
      hour: "3",
      minute: "50",
    ),

    ListProjectTimingModel(
      project: "Final Deployment",
      address: "Civil Lines, Jaipur",
      customer: "Ankit Jain",
      vrDate: "19-Aug-2026",
      timeIn: "12:00",
      timeOut: "18:10",
      hour: "6",
      minute: "10",
    ),
  ];

  DateTime parseVrDate(String date) {
    return DateFormat("dd-MMM-yyyy").parse(date);
  }

  late List<ListProjectTimingModel> filteredList;

  @override
  void initState() {
    super.initState();

    filteredList = listProjectTimingList.where((item) {
      final vrDate = parseVrDate(item.vrDate);
      return (vrDate.isAfter(widget.fromDate.subtract(const Duration(days: 1))) &&
          vrDate.isBefore(widget.toDate.add(const Duration(days: 1))));
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "list project timing".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child:filteredList.isEmpty
              ? Center(
            child: TextWidget(
              text: "No records found for selected date range",
              fontSize: 14,
              textColor: ColorUtils.grey,
              fontWeight: FontWeight.w500,
            ),
          )
              : ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: filteredList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final item = filteredList[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0)),
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /// LEFT INFO
                      Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            ScreenNavigationUtils.push(
                              context,
                              child: const ProjectWorkingWithDetails(),
                              type: PageTransitionType.fade,
                            );
                          },
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              LabelValueWidget(
                                label: "project",
                                value: item.project,
                              ),
                              LabelValueWidget(
                                label: "address",
                                value: item.address,
                              ),
                              LabelValueWidget(
                                label: "customer",
                                value: item.customer,
                              ),
                              LabelValueWidget(
                                label: "vr date",
                                value: item.vrDate,
                              ),
                              LabelValueWidget(
                                label: "time in",
                                value: item.timeIn,
                              ),

                              LabelValueWidget(
                                label: "time out",
                                value: item.timeOut,
                              ),
                              LabelValueWidget(
                                label: "HRS",
                                value: item.hour,
                              ),

                              LabelValueWidget(
                                label: "minutes",
                                value: item.minute,
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// RIGHT ICONS
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.end,
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap:(){},
                                child: Image.asset(
                                  ImagesUtils.attachmentsIcon,
                                  height: 15,
                                  color: ColorUtils.secondary,
                                ),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //
                              //   },
                              //   child: Image.asset(
                              //     ImagesUtils.msgSendIcon,
                              //     height: 20,
                              //     color: ColorUtils.secondary,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ListProjectTimingModel {
  final String project;
  final String address;
  final String customer;
  final String vrDate;
  final String timeIn;
  final String timeOut;
  final String hour;
  final String minute;


  ListProjectTimingModel({
    required this.project,
    required this.address,
    required this.customer,
    required this.vrDate,
    required this.timeIn,
    required this.timeOut,
    required this.hour,
    required this.minute,

  });
}