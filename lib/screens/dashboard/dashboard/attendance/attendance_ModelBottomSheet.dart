import 'dart:ui';

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/dashboard_drawer_tile.dart';
import 'package:flexibiz/screens/dashboard/rough_dashboard.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
class AttendanceModelBottomSheet {
  static void show(
      BuildContext context, {
        required VoidCallback onMarkIn,
        required VoidCallback onMarkOut,
        required VoidCallback onDelete,
      }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.only(top: 12, bottom: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
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
              /// Title
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

              /// Mark IN
              DashboardDrawerTile(
                title: "Mark Attendance In",
                leadingIcon: ImagesUtils.checkAttendanceIcon,
                onTap: () {
                  Navigator.pop(context);
                  onMarkIn();
                },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),

              /// Mark OUT
              DashboardDrawerTile(
                title: "Mark Attendance Out",
                leadingIcon: ImagesUtils.checkAttendanceIcon,
                onTap: () {
                  Navigator.pop(context);
                  onMarkOut();
                },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),

              /// Delete
              DashboardDrawerTile(
                title: "Delete Attendance",
                leadingIcon: ImagesUtils.deleteIcon,
                onTap: () {
                  Navigator.pop(context);
                  onDelete();
                },
                leadingIconColor: ColorUtils.red,
                titleColor: ColorUtils.red,
              ),
            ],
          ),
        );
      },
    );
  }
}


class AttendanceModelBottomSheetTwo {
  static void show(
      BuildContext context, {
        required VoidCallback onMarkIn,
        required VoidCallback onMarkOut,
        required VoidCallback onDelete,
      }) {
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
            //padding: const EdgeInsets.all(10),
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
                /// Title
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
                        text: "Choose Attendance",
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
                // Center(
                //   child: TextWidget(
                //     text: "Choose Attendance",
                //     fontSize: 14,
                //     textAlign: TextAlign.center,
                //     textColor: ColorUtils.secondary,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                //VerticalSpace(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      BottomSheetActionTile(
                        iconImage: ImagesUtils.checkAttendanceIcon,
                        title: "Mark Attendance In",
                        onTap: () {
                          Navigator.pop(bottomSheetContext);
                          onMarkIn();
                        },
                      ),
                      const SizedBox(width: 10),
                      BottomSheetActionTile(
                        iconImage:ImagesUtils.checkAttendanceIcon,
                        title: "Mark Attendance Out",
                        onTap: () {
                          Navigator.pop(bottomSheetContext);
                          onMarkOut();
                        },
                      ),
                      const SizedBox(width: 10),
                      BottomSheetActionTile(
                        iconImage: ImagesUtils.deleteIcon,
                        title: "Delete Attendance",
                        onTap: () {
                          Navigator.pop(bottomSheetContext);
                          onDelete();
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


