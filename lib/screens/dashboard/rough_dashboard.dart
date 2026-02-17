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
import 'package:flexibiz/screens/dashboard/dasbard_one.dart';
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
import 'package:flexibiz/screens/dashboard/dashboard_drawer/dashboard_drawer.dart';
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

class RoughDashboard extends StatefulWidget {
  const RoughDashboard({super.key});

  @override
  State<RoughDashboard> createState() => _RoughDashboardState();
}

class _RoughDashboardState extends State<RoughDashboard> {

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
      drawer: const DashboardDrawer(),
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight(context) * 0.146),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(left:2, right: 2, top: 5),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(11),
                bottomRight: Radius.circular(11),
              ),
              color: ColorUtils.primary
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color(0xFF5BC8FF),
              //     Color(0xFF2FA1F9),
              //   ],
              // ),
            ),
            child: SafeArea(
             // bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Row (Menu + Title + Logo)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        return BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 8,
                                            sigmaY: 8,
                                          ),
                                          child: Container(
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
                                                            image: AssetImage("assets/images/man_profile_.jpg"),
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
                                                                    const Text("Logout"),
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },

                              child: Container(
                                height: 40,
                                width: 40,
                                padding: const EdgeInsets.all(5),
                                // decoration: BoxDecoration(
                                //   color: ColorUtils.white,
                                //   borderRadius: BorderRadius.circular(12),
                                // ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF9FBFE),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: const Color(0xFFE1EBF5),
                                    width: 0.1,
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
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Flexibiz ',
                                style: GoogleFonts.vidaloka(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: 'CRM',
                                style: GoogleFonts.vidaloka(
                                  fontSize: 25,
                                  color: ColorUtils.secondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Logo
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                              border: Border.all(color:ColorUtils.white,width: 1.1),
                              image: DecorationImage(
                              image: AssetImage("assets/images/man_profile_.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  ///Company Info Card

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    margin:const EdgeInsets.only(left: 8,right: 8,bottom: 8),
                    // decoration: BoxDecoration(
                    //   color: ColorUtils.white.withOpacity(0.92),
                    //   borderRadius: BorderRadius.circular(12),
                    //   boxShadow: [
                    //     BoxShadow(
                    //       color: Colors.black.withOpacity(0.08),
                    //       blurRadius: 12,
                    //       offset: Offset(0, 6),
                    //     ),
                    //   ],
                    // ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9FBFE),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE1EBF5),
                        width: 0.1,
                      ),
                    ),


                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   padding: const EdgeInsets.all(2),
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     border: Border.all(color: Color(0xFF22A2F5),width: 1.4)
                        //   ),
                        //   child: ClipOval(
                        //     child: Transform.scale(
                        //       scale: 1.14,
                        //       child: Image.asset(
                        //         ImagesUtils.appLogo,
                        //         height: 35.6,
                        //         width: 35.6,
                        //         fit: BoxFit.cover,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            // border: Border.all(color:ColorUtils.white,width: 1.1),
                            image: DecorationImage(
                              image: AssetImage(ImagesUtils.appLogo),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        HorizontalSpace(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            TextWidget(
                              text: "Kiran consultants Pvt. Ltd.",
                              fontSize: 16.5,
                              textColor: ColorUtils.black,
                              fontWeight: FontWeight.w600,
                            ),
                            // SizedBox(height: 3),
                            TextWidget(
                              text: "Welcome,1145@super",
                              fontSize: 13.5,
                              textColor: ColorUtils.darkText.withOpacity(0.9),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body:Container(
          height: screenHeight(context),
          width: screenWidth(context),
          decoration: CommonBoxDecorations.screenBackgroundDecoration,
          child: SingleChildScrollView(
            child: Container(
              decoration: CommonBoxDecorations.screenBackgroundDecoration,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.activitiesIcon,
                        title: "Activities",
                        onTap: (){
                          ActivitiesModelBottomSheetTwo.show(context);
                        },
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.projectIcon,
                        title: "Projects",
                        onTap: (){
                          ProjectModelBottomSheetTwo.show(context);
                        }
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.tourExpensesIcon,
                        title: "Tour Expenses",
                        onTap: (){
                          TourExpenseModelBottomSheetTwo.show(context);
                        }
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.pendingTaskIcon,
                        title: "Pending Tasks",
                        onTap: (){
                          ScreenNavigationUtils.push(
                            context,
                            child: const PendingTask(),
                            type: PageTransitionType.rightToLeft,
                          );
                        }
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.calendarIcon,
                        title: "Sync Task to Calendar",
                        onTap: (){}
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.locationRouteIcon,
                        title: "Location Route",
                        onTap: (){
                          LocationRouteModelBottomSheetTwo.show(context);
                        }
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.attendanceIcon,
                        title: "Attendance",
                        onTap:  (){
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
                        }
                    ),

                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.commonFileIcon,
                        title: "Common Files",
                        onTap: (){
                          ScreenNavigationUtils.push(
                            context,
                            child: DashboardOne(),
                            // child: const CommonFiles(),
                            type: PageTransitionType.rightToLeft,
                          );
                        }
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.workOrderIcon,
                        title: "Work Order",
                        onTap: () {
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
                                  type: PageTransitionType.rightToLeft,
                                );
                              },
                            ),
                          );
                        },
                    ),
                    DashboardListTileWidget(
                        leadingIcon: ImagesUtils.webMenuIcon,
                        title: "Go to Web Menu",
                        onTap: () async {
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
    );
  }
}
