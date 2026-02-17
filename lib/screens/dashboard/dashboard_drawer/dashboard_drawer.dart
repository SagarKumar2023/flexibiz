import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/authentication/login/favourite_sites.dart';
import 'package:flexibiz/screens/authentication/login/url_Login.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/about_us.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/check_attendance/check_attendance_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/check_attendance/check_attendance_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/dashboard_drawer_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/edit_profile.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/export_contact_to_phone/export_contact_to_phone_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/export_contact_to_phone/export_contact_to_phone_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/feedback.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_model_bottom_sheet.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/mail_signature.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/pending_team_task.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/set_password.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:page_transition/page_transition.dart';

class DashboardDrawer extends StatefulWidget {
  const DashboardDrawer({super.key});

  @override
  State<DashboardDrawer> createState() => _DashboardDrawerState();
}

class _DashboardDrawerState extends State<DashboardDrawer> {

  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final exportContactToPhoneNameCtr = TextEditingController();
  final exportContactToPhoneEmailCtr = TextEditingController();
  final exportContactToPhoneMobileCtr = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      width: 290,
      child: SafeArea(
        key: _scaffoldKey,
        child: Container(
          decoration: CommonBoxDecorations.screenBackgroundDecoration,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 10,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: const [Color(0xFF0A4A88), Color(0xFF22A2F5)],
                  ),
                ),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(ImagesUtils.homeIcon),
                      height: 30,
                      width: 30,
                      color: ColorUtils.white,
                    ),
                    HorizontalSpace(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Super".toUpperCase(),
                          fontSize: 17.5,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w600,
                        ),
                        TextWidget(
                          text: "super@gmail.com",
                          fontSize: 14.5,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Spacer(),
                    Image(image: AssetImage(ImagesUtils.appLogo),height: 40,width: 40),
                  ],
                ),
              ),
              DashboardDrawerTile(
                title: "ToDo List",
                leadingIcon: ImagesUtils.todoListIcon,
                titleColor: selectedIndex == 0 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 0 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 0);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PendingTask()),
                  );
                },
              ),
              DashboardDrawerTile(
                title: "Pending Team Task",
                leadingIcon: ImagesUtils.pendingTeamTaskIcon,
                titleColor: selectedIndex == 1? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 1? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 1);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => PendingTeamTask()),
                  );
                },
              ),
              DashboardDrawerTile(
                title: "Favourite Sites",
                leadingIcon: ImagesUtils.websiteIcon,
                titleColor: selectedIndex == 2? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 2 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 2);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FavouriteSites()),
                  );
                },
              ),
              DashboardDrawerTile(
                title: "Edit Profile",
                leadingIcon: ImagesUtils.editIcon,
                titleColor: selectedIndex == 3 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 3 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 3);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => EditProfile()),
                  );
                },              ),
              DashboardDrawerTile(
                title: "Set Password",
                leadingIcon: ImagesUtils.lockIcon,
                titleColor: selectedIndex == 4 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 4 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 4);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SetPassword()),
                  );
                },              ),
              DashboardDrawerTile(
                title: "Mail Signature",
                leadingIcon: ImagesUtils.mailSignatureIcon,
                titleColor: selectedIndex == 5 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 5 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 5);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => MailSignature()),
                  );
                },
              ),

              DashboardDrawerTile(
                title: "Import Contact to Phone",
                leadingIcon: ImagesUtils.homeIcon,
                titleColor: selectedIndex == 6 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 6 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 6);
                  Navigator.pop(context);
                  ImportContactToPhoneBottomSheet.show(context);
                },
              ),

              DashboardDrawerTile(
                title: "Export Contact to Phone",
                leadingIcon: ImagesUtils.homeIcon,
                titleColor: selectedIndex == 7 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 7 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 7);
                  showDialog(
                      context: context,
                      builder: (_) => ExportContactToPhoneDialog(
                    dialogTitle: "Selection Criteria",
                    nameCtr: exportContactToPhoneNameCtr,
                    mobileNoCtr: exportContactToPhoneMobileCtr,
                    emailCtr: exportContactToPhoneEmailCtr,
                    onDismiss: () {
                      Navigator.pop(context);
                    },
                    onOk: () {
                      _validateExportContactToPhoner();
                    }
                  ));
                },
              ),
              DashboardDrawerTile(
                title: "Check Attendance",
                leadingIcon: ImagesUtils.checkAttendanceIcon,
                titleColor: selectedIndex == 8 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 8 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 8);
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (_) => CheckAttendanceDialog(
                        onDismiss: () {
                          Navigator.pop(context);
                        },
                        onOk: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => CheckAttendanceDetails(),));
                        },
                      ));
                },
              ),
              DashboardDrawerTile(
                title: "Feedback",
                leadingIcon: ImagesUtils.feedbackIcon,
                titleColor: selectedIndex == 9 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 9 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 9);
                  Navigator.pop(context);
                  ScreenNavigationUtils.push(
                    context,
                    child: const FeedbackInDrawer(),
                    type: PageTransitionType.fade,
                  );
                },
              ),
              DashboardDrawerTile(
                title: "About us",
                leadingIcon: ImagesUtils.aboutUsIcon,
                titleColor: selectedIndex == 10 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 10 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 10);
                  Navigator.pop(context);
                  ScreenNavigationUtils.push(
                    context,
                    child: const AboutUs(),
                    type: PageTransitionType.fade,
                  );
                },
              ),
              DashboardDrawerTile(
                title: "Help",
                leadingIcon: ImagesUtils.helpIcon,
                titleColor: selectedIndex == 11 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex ==11 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex =11);
                  Navigator.pop(context);
                },
              ),
              DashboardDrawerTile(
                title: "Logout",
                leadingIcon: ImagesUtils.logoutIcon,
                titleColor: selectedIndex == 12 ? ColorUtils.primary : null,
                leadingIconColor: selectedIndex == 12 ? ColorUtils.primary : null,
                onTap: () {
                  setState(() => selectedIndex = 12);
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (_) => UrlLogin()), (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}