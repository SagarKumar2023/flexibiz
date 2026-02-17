import 'dart:developer';
import 'dart:ui';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_lead_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/lead_activities.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/location_route/LR_Contacts/location_route_contact.dart';
import 'package:flexibiz/screens/dashboard/dashboard/location_route/LR_Customer/location_route_customer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/location_route/LR_Lead/location_route_lead.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/dashboard_drawer_tile.dart';
import 'package:flexibiz/screens/dashboard/rough_dashboard.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LocationRouteModelBottomSheet {
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
          padding: const EdgeInsets.only(top: 12, bottom: 0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFFFFFF), Color(0xFFF8F8FF)],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_) => ActivityLeadDialog(
                      dialogTitle: "Lead Selection Criteria",
                      nameCtr: leadNameCtr,
                      mobileNoCtr: leadMobileCtr,
                      emailCtr: leadEmailCtr,
                      showMapView: true,
                      onMapTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => LocationRouteLead(),));
                      },
                      onDismiss: () {
                        Navigator.pop(context);
                      },
                      onOk: (bool isSelectAll) {
                        log('RECEIVED isSelectAll: $isSelectAll');

                        final name = leadNameCtr.text.trim();
                        final mobile = leadMobileCtr.text.trim();
                        final email = leadEmailCtr.text.trim();

                        /// ✅ Validation ONLY when SelectAll = false
                        if (!isSelectAll) {
                          if (name.isEmpty) {
                            SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
                            return;
                          }

                          if (name.length < 2) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Name must be at least 2 characters long.',
                            );
                            return;
                          }

                          if (email.isEmpty) {
                            SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
                            return;
                          }

                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Please enter a valid email address.',
                            );
                            return;
                          }

                          if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Please enter a valid 10-digit mobile number.',
                            );
                            return;
                          }
                        }

                        final filter = LeadFilter(
                          selectAll: isSelectAll,
                          name: name.isEmpty ? null : name,
                          mobile: mobile.isEmpty ? null : mobile,
                          email: email.isEmpty ? null : email,
                        );

                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LeadActivities(
                              filter: filter,
                              initialTab: LeadTab.leadListTabScreen,
                            ),
                          ),
                        );
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
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_) => ActivityLeadDialog(
                      dialogTitle: "Contacts Selection Criteria",
                      nameCtr: contactNameCtr,
                      mobileNoCtr: contactMobileCtr,
                      emailCtr: contactEmailCtr,
                      showMapView: true,
                      onMapTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => LocationRouteContact(),));
                      },
                      onDismiss: () {
                        Navigator.pop(context);
                      },
                      onOk: (bool isSelectAll) {
                        log('RECEIVED isSelectAll: $isSelectAll');

                        final name = leadNameCtr.text.trim();
                        final mobile = leadMobileCtr.text.trim();
                        final email = leadEmailCtr.text.trim();

                        /// ✅ Validation ONLY when SelectAll = false
                        if (!isSelectAll) {
                          if (name.isEmpty) {
                            SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
                            return;
                          }

                          if (name.length < 2) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Name must be at least 2 characters long.',
                            );
                            return;
                          }

                          if (email.isEmpty) {
                            SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
                            return;
                          }

                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Please enter a valid email address.',
                            );
                            return;
                          }

                          if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Please enter a valid 10-digit mobile number.',
                            );
                            return;
                          }
                        }

                        final filter = LeadFilter(
                          selectAll: isSelectAll,
                          name: name.isEmpty ? null : name,
                          mobile: mobile.isEmpty ? null : mobile,
                          email: email.isEmpty ? null : email,
                        );

                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LeadActivities(
                              filter: filter,
                              initialTab: LeadTab.leadListTabScreen,
                            ),
                          ),
                        );
                      },

                    ),
                  );
                },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),
              DashboardDrawerTile(
                title: "Customers",
                leadingIcon: ImagesUtils.customerIcon,
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_) => ActivityLeadDialog(
                      dialogTitle: "Customer Selection Criteria",
                      nameCtr: customerNameCtr,
                      mobileNoCtr: customerMobileCtr,
                      emailCtr: customerEmailCtr,
                      showMapView: true,
                      onMapTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:  (context) => LocationRouteCustomer(),));
                      },
                      onDismiss: () {
                        Navigator.pop(context);
                      },
                      // onOk: () {
                      //   Navigator.pop(context);
                      // },
                      onOk: (bool isSelectAll) {
                        log('RECEIVED isSelectAll: $isSelectAll');

                        final name = leadNameCtr.text.trim();
                        final mobile = leadMobileCtr.text.trim();
                        final email = leadEmailCtr.text.trim();

                        /// ✅ Validation ONLY when SelectAll = false
                        if (!isSelectAll) {
                          if (name.isEmpty) {
                            SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
                            return;
                          }

                          if (name.length < 2) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Name must be at least 2 characters long.',
                            );
                            return;
                          }

                          if (email.isEmpty) {
                            SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
                            return;
                          }

                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Please enter a valid email address.',
                            );
                            return;
                          }

                          if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
                            SnackBarUtils.showWarning(
                              'Warning',
                              'Please enter a valid 10-digit mobile number.',
                            );
                            return;
                          }
                        }

                        final filter = LeadFilter(
                          selectAll: isSelectAll,
                          name: name.isEmpty ? null : name,
                          mobile: mobile.isEmpty ? null : mobile,
                          email: email.isEmpty ? null : email,
                        );

                        Navigator.pop(context);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LeadActivities(
                              filter: filter,
                              initialTab: LeadTab.leadListTabScreen,
                            ),
                          ),
                        );
                      },

                    ),
                  );
                },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),
            ],
          ),
        );
      },
    );
  }
}

class LocationRouteModelBottomSheetTwo {
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
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(color:ColorUtils.white,width: 1.1),
                          image: DecorationImage(
                            image: AssetImage(ImagesUtils.chooseActivitiesIcon),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF43474D).withOpacity(0.06),
                              blurRadius: 60,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(width: 10),
                      TextWidget(
                        text: "Choose Location route",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textColor: const Color(0xFF1D2939),
                      ),
                      SizedBox(
                        height: 35,
                        width: 35,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      BottomSheetActionTile(
                        iconImage: ImagesUtils.leadIcon,
                        title: "Lead",
                        onTap: () {
                          Navigator.pop(bottomSheetContext);
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "Dismiss",
                            barrierColor: Colors.black.withOpacity(0.4),
                            transitionDuration: const Duration(milliseconds: 700),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 8,
                                  sigmaY: 8,
                                ),
                                child:  ActivityLeadDialog(
                                  dialogTitle: "Lead Selection Criteria",
                                  nameCtr: leadNameCtr,
                                  mobileNoCtr: leadMobileCtr,
                                  emailCtr: leadEmailCtr,
                                  showMapView: true,
                                  onMapTap: () {
                                    Navigator.pop(context);
                                    ScreenNavigationUtils.push(
                                      context,
                                      child: LocationRouteLead(),
                                      type: PageTransitionType.fade,
                                    );
                                  },
                                  onDismiss: () {
                                    Navigator.pop(context);
                                  },
                                  onOk: (bool isSelectAll) {
                                    log('RECEIVED isSelectAll: $isSelectAll');

                                    final name = leadNameCtr.text.trim();
                                    final mobile = leadMobileCtr.text.trim();
                                    final email = leadEmailCtr.text.trim();

                                    /// Validation ONLY when SelectAll = false
                                    if (!isSelectAll) {
                                      if (name.isEmpty) {
                                        SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
                                        return;
                                      }

                                      if (name.length < 2) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Name must be at least 2 characters long.',
                                        );
                                        return;
                                      }

                                      if (email.isEmpty) {
                                        SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
                                        return;
                                      }

                                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Please enter a valid email address.',
                                        );
                                        return;
                                      }

                                      if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Please enter a valid 10-digit mobile number.',
                                        );
                                        return;
                                      }
                                    }

                                    final filter = LeadFilter(
                                      selectAll: isSelectAll,
                                      name: name.isEmpty ? null : name,
                                      mobile: mobile.isEmpty ? null : mobile,
                                      email: email.isEmpty ? null : email,
                                    );

                                    Navigator.pop(context);
                                    ScreenNavigationUtils.push(
                                      context,
                                      child: LeadActivities(
                                        filter: filter,
                                        initialTab: LeadTab.leadListTabScreen,
                                      ),
                                      type: PageTransitionType.fade,
                                    );
                                  },

                                ),
                              );
                            },
                            transitionBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeIn,
                                ),
                                child: ScaleTransition(
                                  scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                  child: child,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      BottomSheetActionTile(
                        iconImage:ImagesUtils.contactIcon,
                        title: "Contacts",
                        onTap: () {
                          Navigator.pop(bottomSheetContext);
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "Dismiss",
                            barrierColor: Colors.black.withOpacity(0.4),
                            transitionDuration: const Duration(milliseconds: 700),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 8,
                                  sigmaY: 8,
                                ),
                                child:  ActivityLeadDialog(
                                  dialogTitle: "Contacts Selection Criteria",
                                  nameCtr: contactNameCtr,
                                  mobileNoCtr: contactMobileCtr,
                                  emailCtr: contactEmailCtr,
                                  showMapView: true,
                                  onMapTap: () {
                                    Navigator.pop(context);
                                    ScreenNavigationUtils.push(
                                      context,
                                      child: LocationRouteContact(),
                                      type: PageTransitionType.fade,
                                    );
                                  },
                                  onDismiss: () {
                                    Navigator.pop(context);
                                  },
                                  onOk: (bool isSelectAll) {
                                    log('RECEIVED isSelectAll: $isSelectAll');

                                    final name = leadNameCtr.text.trim();
                                    final mobile = leadMobileCtr.text.trim();
                                    final email = leadEmailCtr.text.trim();

                                    /// Validation ONLY when SelectAll = false
                                    if (!isSelectAll) {
                                      if (name.isEmpty) {
                                        SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
                                        return;
                                      }

                                      if (name.length < 2) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Name must be at least 2 characters long.',
                                        );
                                        return;
                                      }

                                      if (email.isEmpty) {
                                        SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
                                        return;
                                      }

                                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Please enter a valid email address.',
                                        );
                                        return;
                                      }

                                      if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Please enter a valid 10-digit mobile number.',
                                        );
                                        return;
                                      }
                                    }

                                    final filter = LeadFilter(
                                      selectAll: isSelectAll,
                                      name: name.isEmpty ? null : name,
                                      mobile: mobile.isEmpty ? null : mobile,
                                      email: email.isEmpty ? null : email,
                                    );

                                    Navigator.pop(context);
                                    ScreenNavigationUtils.push(
                                      context,
                                      child: LeadActivities(
                                        filter: filter,
                                        initialTab: LeadTab.leadListTabScreen,
                                      ),
                                      type: PageTransitionType.fade,
                                    );
                                  },

                                ),
                              );
                            },
                            transitionBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeIn,
                                ),
                                child: ScaleTransition(
                                  scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                  child: child,
                                ),
                              );
                            },
                          );

                        },
                      ),
                      const SizedBox(width: 10),
                      BottomSheetActionTile(
                        iconImage: ImagesUtils.customerIcon,
                        title: "Customers",
                        onTap: () {
                          Navigator.pop(bottomSheetContext);
                          showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "Dismiss",
                            barrierColor: Colors.black.withOpacity(0.4),
                            transitionDuration: const Duration(milliseconds: 700),
                            pageBuilder: (context, animation, secondaryAnimation) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 8,
                                  sigmaY: 8,
                                ),
                                child: ActivityLeadDialog(
                                  dialogTitle: "Customer Selection Criteria",
                                  nameCtr: customerNameCtr,
                                  mobileNoCtr: customerMobileCtr,
                                  emailCtr: customerEmailCtr,
                                  showMapView: true,
                                  onMapTap: () {
                                    Navigator.pop(context);
                                    ScreenNavigationUtils.push(
                                      context,
                                      child: LocationRouteCustomer(),
                                      type: PageTransitionType.fade,
                                    );
                                  },
                                  onDismiss: () {
                                    Navigator.pop(context);
                                  },
                                  // onOk: () {
                                  //   Navigator.pop(context);
                                  // },
                                  onOk: (bool isSelectAll) {
                                    log('RECEIVED isSelectAll: $isSelectAll');

                                    final name = leadNameCtr.text.trim();
                                    final mobile = leadMobileCtr.text.trim();
                                    final email = leadEmailCtr.text.trim();

                                    /// Validation ONLY when SelectAll = false
                                    if (!isSelectAll) {
                                      if (name.isEmpty) {
                                        SnackBarUtils.showWarning('Warning', 'Name cannot be empty.');
                                        return;
                                      }

                                      if (name.length < 2) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Name must be at least 2 characters long.',
                                        );
                                        return;
                                      }

                                      if (email.isEmpty) {
                                        SnackBarUtils.showWarning('Warning', 'Email cannot be empty.');
                                        return;
                                      }

                                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email)) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Please enter a valid email address.',
                                        );
                                        return;
                                      }

                                      if (!RegExp(r'^[0-9]{10}$').hasMatch(mobile)) {
                                        SnackBarUtils.showWarning(
                                          'Warning',
                                          'Please enter a valid 10-digit mobile number.',
                                        );
                                        return;
                                      }
                                    }

                                    final filter = LeadFilter(
                                      selectAll: isSelectAll,
                                      name: name.isEmpty ? null : name,
                                      mobile: mobile.isEmpty ? null : mobile,
                                      email: email.isEmpty ? null : email,
                                    );

                                    Navigator.pop(context);
                                    ScreenNavigationUtils.push(
                                      context,
                                      child:LeadActivities(
                                        filter: filter,
                                        initialTab: LeadTab.leadListTabScreen,
                                      ),
                                      type: PageTransitionType.fade,
                                    );

                                  },

                                ),
                              );
                            },
                            transitionBuilder: (context, animation, secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeIn,
                                ),
                                child: ScaleTransition(
                                  scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                  child: child,
                                ),
                              );
                            },
                          );

                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}