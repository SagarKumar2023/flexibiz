import 'dart:ui';
import 'package:flexibiz/constant/PrefUtils/PrefUtils.dart';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/authentication/login/favourite_sites.dart';
import 'package:flexibiz/screens/authentication/login/url_Login.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_modelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/attendance_ModelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/mark_attendance_delete/mark_attendance_delete_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/mark_attendance_in/mark_attendance_in_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/attendance/mark_attendance_out/mark_attendance_out_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/common_files/common_files.dart';
import 'package:flexibiz/screens/dashboard/dashboard/dashboard_list_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/location_route/location_route_ModelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_modelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/tour_expense_ModelBottomSheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/about_us.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/check_attendance/check_attendance_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/check_attendance/check_attendance_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/export_contact_to_phone/export_contact_to_phone_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/export_contact_to_phone/export_contact_to_phone_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/feedback.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_model_bottom_sheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/mail_signature.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/pending_team_task.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/set_password.dart';
import 'package:flexibiz/widgets/animatedShowGeneralDialog.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dashboard_drawer/edit_profile.dart';
class DashboardOne extends StatefulWidget {
  const DashboardOne({super.key});

  @override
  State<DashboardOne> createState() => _DashboardOneState();
}

class _DashboardOneState extends State<DashboardOne>{
  final exportContactToPhoneNameCtr = TextEditingController();
  final exportContactToPhoneEmailCtr = TextEditingController();
  final exportContactToPhoneMobileCtr = TextEditingController();
  TextEditingController workOrderNameCtr = TextEditingController();
  TextEditingController workOrderJobNameCtr = TextEditingController();
  void _validateExportContactToPhoner() {
    String name = exportContactToPhoneNameCtr.text.trim();
    String mobileNumber = exportContactToPhoneEmailCtr.text.trim();
    String email = exportContactToPhoneEmailCtr.text.trim();

    // ===== Name Validation =====
    if (name.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
      return;
    }

    if (name.length < 2) {
      SnackBarUtils.showWarning(
          'Warning', 'Name must be at least 2 characters long.');
      return;
    }

    // ===== Email Validation =====
    if (email.isEmpty) {
      SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
      SnackBarUtils.showWarning(
          'Warning', 'Please enter a valid email address.');
      return;
    }

    // ===== Mobile Validation =====
    if (!RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber)) {
      SnackBarUtils.showWarning(
          'Warning', 'Please enter a valid 10-digit mobile number.');
      return;
    }

    /// Success → Navigate
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ExportContactToPhoneDetails()),
    );
  }
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              const VerticalSpace(height: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Row (Menu + Title + Logo)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Scaffold.of(context).openDrawer();
                        /// Menu Button
                        Builder(
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.black.withOpacity(0.2),
                                  isScrollControlled: true,
                                  builder: (bottomSheetContext) {
                                    return StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Container(
                                          margin: const EdgeInsets.all(13),
                                          decoration: BoxDecoration(
                                            // color: Colors.white,
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xFFFFFFFF),
                                                Color(0xFFF8F8FF),
                                              ],
                                            ),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [

                                              /// HEADER
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFF9FAFB),
                                                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 50,
                                                      width: 50,
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        border: Border.all(color:ColorUtils.white,width: 1.1),
                                                        image: DecorationImage(
                                                          image: AssetImage(ImagesUtils.appLogo),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextWidget(
                                                          text: "SUPER",
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w600,
                                                          textColor: const Color(0xFF1D2939),
                                                        ),

                                                        TextWidget(
                                                          text: "super@gmail.com",
                                                          fontSize: 13,
                                                          fontWeight: FontWeight.w500,
                                                          textColor: const Color(0xFF475467),
                                                        ),

                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              const SizedBox(height: 12),

                                              /// PAGE VIEW
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10,right: 10),
                                                child: SizedBox(
                                                  height: MediaQuery.of(context).size.height * 0.27,
                                                  child: PageView(
                                                    controller: _pageController,
                                                    onPageChanged: (index) {
                                                      setModalState(() {
                                                        _currentPage = index;
                                                      });
                                                    },
                                                    children: [

                                                      /// PAGE 1
                                                      SingleChildScrollView(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                BottomSheetActionTile(
                                                                  iconImage: ImagesUtils.todoListIcon,
                                                                  title: "ToDo List",
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const PendingTask(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  iconImage: ImagesUtils.pendingTeamTaskIcon,
                                                                  title: "Pending Team Task",
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const PendingTeamTask(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  iconImage: ImagesUtils.websiteIcon,
                                                                  title: "Favourite Sites",
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const FavouriteSites(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 10),
                                                            Row(
                                                              children: [
                                                                BottomSheetActionTile(
                                                                  title: "Edit Profile",
                                                                  iconImage: ImagesUtils.editIcon,
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const EditProfile(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  title: "Set Password",
                                                                  iconImage: ImagesUtils.lockIcon,
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const SetPassword(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  title: "Mail Signature",
                                                                  iconImage: ImagesUtils.mailSignatureIcon,
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const MailSignature(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      /// PAGE 2
                                                      SingleChildScrollView(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                BottomSheetActionTile(
                                                                  title: "Import Contact to Phone",
                                                                  iconImage: ImagesUtils.homeIcon,
                                                                  onTap: () {
                                                                    // Navigator.pop(bottomSheetContext);
                                                                    ImportContactToPhoneBottomSheetTwo.show(context);
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  title: "Export Contact to Phone",
                                                                  iconImage: ImagesUtils.homeIcon,
                                                                  onTap: () {
                                                                    Navigator.pop(context); // previous dialog close

                                                                    showGeneralDialog(
                                                                      context: context,
                                                                      barrierLabel: "ExportContactDialog",
                                                                      barrierDismissible: true,
                                                                      barrierColor: Colors.black.withOpacity(0.35),
                                                                      transitionDuration: const Duration(milliseconds: 800),
                                                                      pageBuilder: (context, animation, secondaryAnimation) {
                                                                        return ExportContactToPhoneDialog(
                                                                          dialogTitle: "Selection Criteria",
                                                                          nameCtr: exportContactToPhoneNameCtr,
                                                                          mobileNoCtr: exportContactToPhoneMobileCtr,
                                                                          emailCtr: exportContactToPhoneEmailCtr,
                                                                          onDismiss: () {
                                                                            Navigator.pop(context); // fade-out
                                                                          },
                                                                          onOk: () {
                                                                            _validateExportContactToPhoner();
                                                                          },
                                                                        );
                                                                      },
                                                                      transitionBuilder: (context, animation, secondaryAnimation, child) {
                                                                        return FadeTransition(
                                                                          opacity: CurvedAnimation(
                                                                            parent: animation,
                                                                            curve: Curves.easeInOut,
                                                                          ),
                                                                          child: child,
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  title: "Check Attendance",
                                                                  iconImage: ImagesUtils.checkAttendanceIcon,
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    showGeneralDialog(
                                                                      context: context,
                                                                      barrierLabel: "CheckAttendanceDialog",
                                                                      barrierDismissible: true,
                                                                      barrierColor: Colors.black.withOpacity(0.35),
                                                                      transitionDuration: const Duration(milliseconds: 700),
                                                                      pageBuilder: (context, animation, secondaryAnimation) {
                                                                        return CheckAttendanceDialog(
                                                                          onDismiss: () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          onOk: () {
                                                                            Navigator.pop(context);
                                                                            ScreenNavigationUtils.push(
                                                                              context,
                                                                              child: const CheckAttendanceDetails(),
                                                                              type: PageTransitionType.fade,
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      transitionBuilder: (context, animation, secondaryAnimation, child) {
                                                                        return FadeTransition(
                                                                          opacity: CurvedAnimation(
                                                                            parent: animation,
                                                                            curve: Curves.easeInOut,
                                                                          ),
                                                                          child: child,
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 10),
                                                            Row(
                                                              children: [
                                                                BottomSheetActionTile(
                                                                  title: "Feedback",
                                                                  iconImage: ImagesUtils.feedbackIcon,
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const FeedbackInDrawer(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  title: "About Us",
                                                                  iconImage: ImagesUtils.aboutUsIcon,
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const AboutUs(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  title: "Help",
                                                                  iconImage: ImagesUtils.helpIcon,
                                                                  onTap: () {},
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      /// PAGE 3
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () async {
                                                              Navigator.pop(context);

                                                              await PrefUtils.setUserLoggedIn(false);
                                                              await PrefUtils.logout();

                                                              Navigator.pushAndRemoveUntil(
                                                                context,
                                                                MaterialPageRoute(builder: (_) => const UrlLogin()),
                                                                    (route) => false,
                                                              );
                                                            },

                                                            child: Container(
                                                              height: 100,
                                                              width: 100,
                                                              padding: EdgeInsets.all(2),
                                                              decoration:  BoxDecoration(
                                                                borderRadius: BorderRadius.circular(13),
                                                                color: ColorUtils.white,
                                                                border: Border.all(
                                                                  color: const Color(0xFFEAECF0),
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
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Image.asset(
                                                                    ImagesUtils.logoutIcon,
                                                                    height: 24,
                                                                    width: 24,
                                                                    color: const Color(0xFF22A2F5),
                                                                  ),
                                                                  const SizedBox(height: 8),
                                                                  TextWidget(
                                                                    text: "Logout",
                                                                    textColor: ColorUtils.secondary,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontSize: 12,
                                                                    textAlign: TextAlign.center,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              VerticalSpace(height: 5),

                                              /// INDICATOR
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: List.generate(3, (index) {
                                                  return AnimatedContainer(
                                                    duration: const Duration(milliseconds: 300),
                                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                                    height: 6,
                                                    width: _currentPage == index ? 20 : 6,
                                                    decoration: BoxDecoration(
                                                      color: _currentPage == index
                                                          ? const Color(0xFF2FA1F9)
                                                          : const Color(0xFF2FA1F9).withOpacity(0.25),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                  );
                                                }),
                                              ),

                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 45,
                                width: 45,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF000000).withOpacity(0.05),
                                      blurRadius: 20,
                                      spreadRadius: 1,
                                      offset: Offset(0, 8),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: const Color(0xFFEAECF0),
                                    width: 1,
                                  ),
                                ),
                                child: Image.asset(
                                  ImagesUtils.menuIcon,
                                  height: 25,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          },
                        ),
                        /// App Title
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Flexibiz ',
                                    style: GoogleFonts.vidaloka(
                                      fontSize: 38,
                                      color: ColorUtils.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'CRM',
                                    style: GoogleFonts.vidaloka(
                                      fontSize: 38,
                                      color: ColorUtils.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextWidget(
                              text: "Kiran consultants Pvt. Ltd.",
                              fontSize: 15.5,
                              textColor: ColorUtils.black,
                              fontWeight: FontWeight.w500,
                            ),
                            VerticalSpace(height: 3),
                            TextWidget(
                              text: "Welcome,1145@super",
                              fontSize: 13.5,
                              textColor: ColorUtils.secondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),

                        /// Logo
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: const Color(0xFFEAECF0),
                              width: 1,
                            ),
                            //border: Border.all(color:ColorUtils.white,width: 1.1),
                            image: DecorationImage(
                              image: AssetImage("assets/images/man_profile_.jpg"),
                              fit: BoxFit.fill,
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const VerticalSpace(height: 20),
              // Email Field
              Expanded(
                child: Container(
                 // padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
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
                    child: Container(
                      decoration: CommonBoxDecorations.screenBackgroundDecoration,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VerticalSpace(height: 10),
                            DashboardUi(
                                cardOneTitle: "Activities",
                                cardOneIcon: DashboardImagesUtils.activities,
                                cardOneOnTap: (){
                                  //ActivitiesModelBottomSheet.show(context);
                                  ActivitiesModelBottomSheetTwo.show(context);
                                },
                                cardTwoTitle: "Projects",
                                cardTwoIcon: DashboardImagesUtils.project,
                                cardTwoOnTap: (){
                                  //ProjectModelBottomSheet.show(context);
                                  ProjectModelBottomSheetTwo.show(context);
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Tour Expenses",
                                cardOneIcon: DashboardImagesUtils.tourExpenses,
                                cardOneOnTap: (){
                                 // TourExpenseModelBottomSheet.show(context);
                                  TourExpenseModelBottomSheetTwo.show(context);
                                },
                                cardTwoTitle: "Pending Tasks",
                                cardTwoIcon: DashboardImagesUtils.pendingTask,
                                cardTwoOnTap: (){
                                  ScreenNavigationUtils.push(
                                    context,
                                    child: const PendingTask(),
                                    type: PageTransitionType.fade,
                                  );
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Sync Task to Calendar",
                                cardOneIcon: DashboardImagesUtils.calendar,
                                cardOneOnTap: (){},
                                cardTwoTitle: "Location Route",
                                cardTwoIcon: DashboardImagesUtils.locationRoute,
                                cardTwoOnTap: (){
                                  //LocationRouteModelBottomSheet.show(context);
                                  LocationRouteModelBottomSheetTwo.show(context);
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Attendance",
                                cardOneIcon: DashboardImagesUtils.attendance,
                                cardOneOnTap: (){
                                 // AttendanceModelBottomSheet.show(context);
                                  AttendanceModelBottomSheetTwo.show(
                                    context,
                                    onMarkIn: () {
                                      animatedShowGeneralDialog(
                                        context: context,
                                        child: MarkAttendanceInDialog(),
                                      );
                                    },
                                    onMarkOut: (){
                                      animatedShowGeneralDialog(
                                        context: context,
                                        child: MarkAttendanceOutDialog(),
                                      );

                                    },
                                    onDelete: () {
                                      animatedShowGeneralDialog(
                                        context: context,
                                        child: MarkAttendanceDeleteDialog(),
                                      );

                                    },
                                  );
                                },
                                cardTwoTitle: "Common Files",
                                cardTwoIcon: DashboardImagesUtils.commonFile,
                                cardTwoOnTap: (){
                                  ScreenNavigationUtils.push(
                                    context,
                                    child: const CommonFiles(),
                                    type: PageTransitionType.fade,
                                  );
                                }
                            ),
                            DashboardUi(
                                cardOneTitle: "Work Order",
                                cardOneIcon: DashboardImagesUtils.workOrder,
                                cardOneOnTap: (){
                                  animatedShowGeneralDialog(
                                    context: context,
                                    child: WorkOrderDialog(
                                      dialogTitle: "Work Order Selection Criteria",
                                      nameCtr: workOrderNameCtr,
                                      jobNameCtr: workOrderJobNameCtr,
                                      onDismiss: () {
                                        Navigator.pop(context);
                                      },
                                      onOk: () {
                                        Navigator.pop(context);
                                        ScreenNavigationUtils.push(
                                          context,
                                          child: const WorkOrderDetails(),
                                          type: PageTransitionType.fade,
                                        );
                                      },
                                    ),
                                  );
                                },
                                cardTwoTitle: "Go to Web Menu",
                                cardTwoIcon: "assets/icons/website_icon.png",
                                cardTwoOnTap:  () async {
                                  final Uri url = Uri.parse("https://www.flexibizerp.com");
                                  await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ),
              )
              //  Sign In Button
            ],
          ),
        ),
      ),
    );
  }
}