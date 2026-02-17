import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_inquiries/inquiries_activities_with_details/inquiries_activities_with_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class CheckAttendanceDetails extends StatefulWidget {
  const CheckAttendanceDetails({super.key});

  @override
  State<CheckAttendanceDetails> createState() => _CheckAttendanceDetailsState();
}

class _CheckAttendanceDetailsState extends State<CheckAttendanceDetails> {

  final List<AttendanceListModel> attendanceList = [
    AttendanceListModel(
      type: "IN",
      time: "22-Dec-2025 09:15 AM",
      address: "MG Road, Indiranagar, Bengaluru, Karnataka",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "22-Dec-2025 01:30 PM",
      address: "Brigade Road, Bengaluru, Karnataka",
    ),
    AttendanceListModel(
      type: "IN",
      time: "22-Dec-2025 02:15 PM",
      address: "Electronic City Phase 1, Bengaluru, Karnataka",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "22-Dec-2025 06:40 PM",
      address: "Whitefield Main Road, Bengaluru, Karnataka",
    ),
    AttendanceListModel(
      type: "IN",
      time: "23-Dec-2025 09:10 AM",
      address: "Connaught Place, New Delhi",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "23-Dec-2025 01:05 PM",
      address: "Karol Bagh, New Delhi",
    ),
    AttendanceListModel(
      type: "IN",
      time: "23-Dec-2025 02:00 PM",
      address: "Lajpat Nagar, New Delhi",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "23-Dec-2025 06:20 PM",
      address: "Saket District Centre, New Delhi",
    ),
    AttendanceListModel(
      type: "IN",
      time: "24-Dec-2025 09:25 AM",
      address: "Banjara Hills, Hyderabad, Telangana",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "24-Dec-2025 01:45 PM",
      address: "Hitech City, Hyderabad, Telangana",
    ),
    AttendanceListModel(
      type: "IN",
      time: "24-Dec-2025 02:30 PM",
      address: "Madhapur, Hyderabad, Telangana",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "24-Dec-2025 06:10 PM",
      address: "Gachibowli, Hyderabad, Telangana",
    ),
    AttendanceListModel(
      type: "IN",
      time: "25-Dec-2025 09:00 AM",
      address: "Salt Lake Sector V, Kolkata, West Bengal",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "25-Dec-2025 01:20 PM",
      address: "Park Street, Kolkata, West Bengal",
    ),
    AttendanceListModel(
      type: "OUT",
      time: "25-Dec-2025 06:00 PM",
      address: "Howrah Bridge Area, Kolkata, West Bengal",
    ),
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
          text: "CHECK ATTENDANCE",
          textColor: ColorUtils.white,
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          children: [
            /// BODY  SECTION
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: attendanceList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = attendanceList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(color: const Color(0xFFEAECF0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF43474D,
                          ).withOpacity(0.06),
                          blurRadius: 60,
                          offset: const Offset(0, 12),
                        ),
                      ],
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        InquiriesActivitiesWithDetails(),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  LabelValueWidget(
                                    label: "ATTENDANCE TYPE",
                                    value: item.type,
                                  ),
                                  LabelValueWidget(
                                    label: "ATTENDANCE DATE",
                                    value: item.time,
                                  ),
                                  LabelValueWidget(
                                    label: "ATTENDANCE ADDRESS",
                                    value: item.address,
                                  ),
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
          ],
        ),
      ),
    );
  }
}

class AttendanceListModel {
  final String type;
  final String time;
  final String address;

  AttendanceListModel({
    required this.type,
    required this.time,
    required this.address,

  });
}
