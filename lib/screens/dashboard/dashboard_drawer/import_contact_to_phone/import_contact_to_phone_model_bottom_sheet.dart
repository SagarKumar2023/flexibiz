import 'dart:ui';

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/dashboard_drawer_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_consider_all/import_contact_to_phone_consider_all_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_consider_all/import_contact_to_phone_consider_all_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_contact/import_contact_to_phone_contact_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_contact/import_contact_to_phone_contact_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_lead/import_contact_to_phone_lead_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/import_contact_to_phone/import_contact_to_phone_lead/import_contact_to_phone_lead_dialog.dart';
import 'package:flexibiz/screens/dashboard/rough_dashboard.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ImportContactToPhoneBottomSheet {

  static void _validateNameEmailMobileAndNavigate({
    required BuildContext context,
    required TextEditingController nameCtr,
    required TextEditingController mobileCtr,
    required TextEditingController emailCtr,
    required Widget destination,
  }) {
    String name = nameCtr.text.trim();
    String mobileNumber = mobileCtr.text.trim();
    String email = emailCtr.text.trim();

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
      MaterialPageRoute(builder: (_) => destination),
    );
  }

  static void show(BuildContext context) {
    final leadNameCtr = TextEditingController();
    final leadMobileCtr = TextEditingController();
    final leadEmailCtr = TextEditingController();
    final contactNameCtr = TextEditingController();
    final contactMobileCtr = TextEditingController();
    final contactEmailCtr = TextEditingController();
    final customerNameCtr = TextEditingController();
    final customerMobileCtr = TextEditingController();
    final customerEmailCtr = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFF8F8FF),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Center(
                  child: TextWidget(
                    text: "Choose",
                    fontSize: 14,
                    textAlign: TextAlign.center,
                    textColor: ColorUtils.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Divider(color: ColorUtils.black.withOpacity(0.2)),

              DashboardDrawerTile(
                title: "Lead",
                leadingIcon: ImagesUtils.leadIcon,
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (_) => ImportContactToPhoneLeadDialog(
                      dialogTitle: "Lead Selection Criteria",
                      nameCtr: leadNameCtr,
                      mobileNoCtr: leadMobileCtr,
                      emailCtr: leadEmailCtr,
                      onDismiss: () {
                        Navigator.pop(context);
                      },
                      onOk: () {
                        _validateNameEmailMobileAndNavigate(
                          context: context,
                          nameCtr: leadNameCtr,
                          mobileCtr: leadMobileCtr,
                          emailCtr: leadEmailCtr,
                          destination: const ImportContactToPhoneLeadDetails(),
                        );
                        // Navigator.push(context, MaterialPageRoute(builder:(context) => ImportContactToPhoneLeadDetails(),));
                      },
                    ),
                  );
                },

                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),

              DashboardDrawerTile(
                title: "Contacts",
                leadingIcon: ImagesUtils.contactIcon,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => ImportContactToPhoneContactDialog(
                      dialogTitle: "Contacts Selection Criteria",
                      nameCtr: contactNameCtr,
                      mobileNoCtr: contactMobileCtr,
                      emailCtr: contactEmailCtr,
                      onDismiss: () {
                        Navigator.pop(context);
                      },
                      onOk: () {
                        _validateNameEmailMobileAndNavigate(
                          context: context,
                          nameCtr: leadNameCtr,
                          mobileCtr: leadMobileCtr,
                          emailCtr: leadEmailCtr,
                          destination: const ImportContactToPhoneContactDetails(),
                        );
                        // Navigator.push(context, MaterialPageRoute(builder:(context) => ImportContactToPhoneContactDetails(),));
                      },
                    ),
                  );
                },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),

              DashboardDrawerTile(
                title: "Consider All",
                leadingIcon: ImagesUtils.arrowBackConsiderIcon,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => ImportContactToPhoneConsiderAllDialog(
                      dialogTitle: "All Selection Criteria",
                      nameCtr: customerNameCtr,
                      mobileNoCtr: customerMobileCtr,
                      emailCtr: customerEmailCtr,
                      onDismiss: () {
                        Navigator.pop(context);
                      },
                      onOk: () {
                        _validateNameEmailMobileAndNavigate(
                          context: context,
                          nameCtr: leadNameCtr,
                          mobileCtr: leadMobileCtr,
                          emailCtr: leadEmailCtr,
                          destination: const ImportContactToPhoneConsiderAllDetails(),
                        );
                        // Navigator.push(context, MaterialPageRoute(builder:(context) => ImportContactToPhoneConsiderAllDetails(),));
                      },
                    ),
                  );
                  },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}


class ImportContactToPhoneBottomSheetTwo {

  static void _validateNameEmailMobileAndNavigate({
    required BuildContext context,
    required TextEditingController nameCtr,
    required TextEditingController mobileCtr,
    required TextEditingController emailCtr,
    required Widget destination,
  }) {
    String name = nameCtr.text.trim();
    String mobileNumber = mobileCtr.text.trim();
    String email = emailCtr.text.trim();

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
      MaterialPageRoute(builder: (_) => destination),
    );
  }


  static void show(BuildContext context) {
    final leadNameCtr = TextEditingController();
    final leadMobileCtr = TextEditingController();
    final leadEmailCtr = TextEditingController();
    final contactNameCtr = TextEditingController();
    final contactMobileCtr = TextEditingController();
    final contactEmailCtr = TextEditingController();
    final customerNameCtr = TextEditingController();
    final customerMobileCtr = TextEditingController();
    final customerEmailCtr = TextEditingController();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.2),
      isScrollControlled: true,
      builder: (bottomSheetContext) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 8,
            sigmaY: 8,
          ),
          child: Container(
            margin: EdgeInsets.all(12),
            padding: const EdgeInsets.all(10),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFF8F8FF),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TextWidget(
                    text: "Import Contact to phone".toUpperCase(),
                    fontSize: 14,
                    textAlign: TextAlign.center,
                    textColor: ColorUtils.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                VerticalSpace(height: 10),
                Row(
                  children: [
                    BottomSheetActionTile(
                      iconImage: ImagesUtils.leadIcon,
                      title: "Lead",
                      onTap: () {
                        // Navigator.pop(bottomSheetContext);
                        showDialog(
                          context: context,
                          builder: (_) => ImportContactToPhoneLeadDialog(
                            dialogTitle: "Lead Selection Criteria",
                            nameCtr: leadNameCtr,
                            mobileNoCtr: leadMobileCtr,
                            emailCtr: leadEmailCtr,
                            onDismiss: () {
                              Navigator.pop(context);
                            },
                            onOk: () {
                              _validateNameEmailMobileAndNavigate(
                                context: context,
                                nameCtr: leadNameCtr,
                                mobileCtr: leadMobileCtr,
                                emailCtr: leadEmailCtr,
                                destination: const ImportContactToPhoneLeadDetails(),
                              );
                              // Navigator.push(context, MaterialPageRoute(builder:(context) => ImportContactToPhoneLeadDetails(),));
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    BottomSheetActionTile(
                      iconImage:ImagesUtils.contactIcon,
                      title: "Contacts",
                      onTap: () {
                        // Navigator.pop(bottomSheetContext);
                        showDialog(
                          context: context,
                          builder: (_) => ImportContactToPhoneContactDialog(
                            dialogTitle: "Contacts Selection Criteria",
                            nameCtr: contactNameCtr,
                            mobileNoCtr: contactMobileCtr,
                            emailCtr: contactEmailCtr,
                            onDismiss: () {
                              Navigator.pop(context);
                            },
                            onOk: () {
                              _validateNameEmailMobileAndNavigate(
                                context: context,
                                nameCtr: leadNameCtr,
                                mobileCtr: leadMobileCtr,
                                emailCtr: leadEmailCtr,
                                destination: const ImportContactToPhoneContactDetails(),
                              );
                              // Navigator.push(context, MaterialPageRoute(builder:(context) => ImportContactToPhoneContactDetails(),));
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    BottomSheetActionTile(
                      iconImage: ImagesUtils.arrowBackConsiderIcon,
                      title: "Consider All",
                      onTap: () {
                       // Navigator.pop(bottomSheetContext);
                        showDialog(
                          context: context,
                          builder: (_) => ImportContactToPhoneConsiderAllDialog(
                            dialogTitle: "All Selection Criteria",
                            nameCtr: customerNameCtr,
                            mobileNoCtr: customerMobileCtr,
                            emailCtr: customerEmailCtr,
                            onDismiss: () {
                              Navigator.pop(context);
                            },
                            onOk: () {
                              _validateNameEmailMobileAndNavigate(
                                context: context,
                                nameCtr: leadNameCtr,
                                mobileCtr: leadMobileCtr,
                                emailCtr: leadEmailCtr,
                                destination: const ImportContactToPhoneConsiderAllDetails(),
                              );
                              // Navigator.push(context, MaterialPageRoute(builder:(context) => ImportContactToPhoneConsiderAllDetails(),));
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
