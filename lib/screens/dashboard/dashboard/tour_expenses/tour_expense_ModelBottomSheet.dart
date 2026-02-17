import 'dart:ui';

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/new_tour_expenses/new_tour_expenses.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/tour_expenses_modify_remarks/tour_expenses_modify_remarks_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/view_tour_expenses/view_tour_expenses_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard_drawer/dashboard_drawer_tile.dart';
import 'package:flexibiz/screens/dashboard/rough_dashboard.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class TourExpenseModelBottomSheet {
  static void show(BuildContext context) {
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
                title: "New tour expense",
                leadingIcon: ImagesUtils.newTourExpenseIcon,
                onTap: (){
                  ScreenNavigationUtils.push(
                    context,
                    child: const NewTourExpenses(),
                    type: PageTransitionType.fade,
                  );
                },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),
              DashboardDrawerTile(
                title: "Modify remarks",
                leadingIcon: ImagesUtils.editIcon,
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_) =>TourExpensesModifyRemarksDialog(),
                  );
                },
                leadingIconColor: ColorUtils.secondary,
                titleColor: ColorUtils.secondary,
              ),
              DashboardDrawerTile(
                title: "View tour expense",
                leadingIcon: ImagesUtils.viewProjectTimingIcon,
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (_) =>ViewTourExpensesDialog(),
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

class TourExpenseModelBottomSheetTwo {
  static void show(BuildContext context) {
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
                        text: "Choose Tour expenses",
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
                        iconImage: ImagesUtils.newTourExpenseIcon,
                        title: "New tour expense",
                        onTap: (){
                          Navigator.pop(bottomSheetContext);
                          ScreenNavigationUtils.push(
                            context,
                            child: const NewTourExpenses(),
                            type: PageTransitionType.fade,
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      BottomSheetActionTile(
                        iconImage:ImagesUtils.editIcon,
                        title: "Modify remarks",
                        onTap: (){
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
                                child: TourExpensesModifyRemarksDialog(),
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
                        iconImage: ImagesUtils.viewProjectTimingIcon,
                        title: "View tour expense",
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
                                child: ViewTourExpensesDialog(),
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

