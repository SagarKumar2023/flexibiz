import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/attendance_ModelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/mark_attendance_delete/mark_attendance_delete_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/mark_attendance_in/mark_attendance_in_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/mark_attendance_out/mark_attendance_out_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/common_files/common_files.dart';
import 'package:flexibiz/screens/dashboard/dashboard/location_route/location_route_ModelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_modelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/tour_expense_ModelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/dashboard_drawer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/dashboard_ui.dart';
import 'package:flexibiz/screens/dashboard/rough_dashboard.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final List<String> locationList = [
    "214 Maple Street, Downtown, Springfield, USA",
    "Flat 302 Shanti Apartments, MG Road, Indore, India",
    "89 Baker Lane, Croydon, London, UK",
    "House No 17 Sector 45, Sector 45, Chandigarh, India",
    "560 Palm Avenue, Santa Monica Beach, Santa Monica, USA",
    "Plot 9B Green Valley Colony, Green Valley, Bhopal, India",
    "44 Kingfisher Drive, Westcroft, Milton Keynes, UK",
    "Apartment 12C Skyline Towers, Bandra West, Mumbai, India",
    "781 Lakeview Road, Lake Edge, Madison, USA",
    "Door No 5/112 Anna Nagar West, Anna Nagar, Chennai, India",
    "63 Rosewood Crescent, Meadowvale, Mississauga, Canada",
    "Villa 21 Silver Oak Enclave, Whitefield, Bengaluru, India",
    "902 Ocean Boulevard, South Beach, Miami Beach, USA",
    "H No 48 Rajendra Nagar, Rajendra Nagar, Patna, India",
    "27 Willow Court, Parramatta West, Sydney, Australia",
  ];
  String? selectedLocation;

  TextEditingController workOrderNameCtr = TextEditingController();
  TextEditingController workOrderJobNameCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DashboardDrawer(),
      backgroundColor: ColorUtils.lightScreenBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 120.0,
            toolbarHeight: 120,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 120,
                width: screenWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      // height: 137,
                      height: 149,
                      width: screenWidth(context),
                      decoration: BoxDecoration(
                        // color: ColorUtils.black.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: const [Color(0xFF0A4A88), Color(0xFF22A2F5)],
                        ),
                        // gradient: LinearGradient(
                        //   begin: Alignment.topCenter,
                        //   end: Alignment.bottomCenter,
                        //   colors: const [
                        //     Color.fromRGBO(0, 0, 0, 1),
                        //     Color.fromRGBO(25, 0, 184, 1)
                        //   ],
                        // ),
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Builder(
                                      builder: (context) {
                                        return InkWell(
                                          onTap: () {
                                            Scaffold.of(context).openDrawer();
                                          },
                                          child: Image(
                                            image: AssetImage(ImagesUtils.menuIcon),
                                            height: 35,
                                            color: Colors.white,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Column(
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
                                                  color: ColorUtils.primary,
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
                                        textColor: ColorUtils.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      VerticalSpace(height: 3),
                                      TextWidget(
                                        text: "Welcome,1145@super",
                                        fontSize: 14.5,
                                        textColor: ColorUtils.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                  )
                                  //9217035543
                                ],
                              ),
                            ),
                            VerticalSpace(height: 10),
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Container(
                    //     padding: EdgeInsets.only(left: 14,right: 14,top: 7,bottom: 7),
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(20),
                    //       color: ColorUtils.lightScreenBackground
                    //     ),
                    //     child: TextWidget(
                    //       text: "Welcome,1145@super",
                    //       fontSize: 14.5,
                    //       textColor: ColorUtils.secondary,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  SingleChildScrollView(
                    child: Container(
                      decoration: CommonBoxDecorations.screenBackgroundDecoration,
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DashboardUi(
                                cardOneTitle: "Activities",
                                cardOneIcon: ImagesUtils.activitiesIcon,
                                cardOneOnTap: (){
                                  // ActivitiesModelBottomSheet.show(context);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RoughDashboard(),));
                                },
                                cardTwoTitle: "Projects",
                                cardTwoIcon: ImagesUtils.projectIcon,
                                cardTwoOnTap: (){
                                  ProjectModelBottomSheet.show(context);
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Tour Expenses",
                                cardOneIcon: ImagesUtils.tourExpensesIcon,
                                cardOneOnTap: (){
                                  TourExpenseModelBottomSheet.show(context);
                                },
                                cardTwoTitle: "Pending Tasks",
                                cardTwoIcon: ImagesUtils.pendingTaskIcon,
                                cardTwoOnTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => PendingTask(),));
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Sync Task to Calendar",
                                cardOneIcon: ImagesUtils.calendarIcon,
                                cardOneOnTap: (){},
                                cardTwoTitle: "Location Route",
                                cardTwoIcon: ImagesUtils.locationRouteIcon,
                                cardTwoOnTap: (){
                                  LocationRouteModelBottomSheet.show(context);
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Attendance",
                                cardOneIcon: ImagesUtils.attendanceIcon,
                                cardOneOnTap: (){
                                  AttendanceModelBottomSheet.show(
                                      context,
                                    onMarkIn: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => MarkAttendanceInDialog(),
                                      );;
                                    },
                                    onMarkOut: (){
                                      showDialog(
                                        context: context,
                                        builder: (_) => MarkAttendanceOutDialog(),
                                      );;
                                    },
                                    onDelete: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => MarkAttendanceDeleteDialog(),
                                      );
                                    },
                                  );
                                },
                                cardTwoTitle: "Common Files",
                                cardTwoIcon: ImagesUtils.commonFileIcon,
                                cardTwoOnTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => CommonFiles(),));
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Work Order",
                                cardOneIcon: ImagesUtils.workOrderIcon,
                                cardOneOnTap: (){
                                  showDialog(
                                    context: context,
                                    builder: (_) => WorkOrderDialog(
                                      dialogTitle: "Work Order Selection Criteria",
                                      nameCtr: workOrderNameCtr,
                                      jobNameCtr: workOrderJobNameCtr,
                                      onDismiss: () {
                                        Navigator.pop(context);
                                      },
                                      onOk: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => WorkOrderDetails(),));
                                      },
                                    ),
                                  );
                                },
                                cardTwoTitle: "Go to Web Menu",
                                cardTwoIcon: ImagesUtils.webMenuIcon,
                                cardTwoOnTap: (){}
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
                ]
            ),
          ),
        ],
      ),

    );
  }
}
