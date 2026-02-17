import 'dart:ui';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/local_database/hive_database_utils/hive_database.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/new_tour_expenses/new_tour_expenses.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/tour_expenses_modify_remarks/tour_expenses_modify_remarks_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/view_tour_expenses/view_tour_expenses_screen/view_tour_expense_upload.dart';
import 'package:flexibiz/screens/dashboard/dashboard/tour_expenses/view_tour_expenses/view_tour_expenses_screen/view_tour_expenses_edit.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';


class ViewTourExpensesScreen extends StatefulWidget {
  final DateTime fromDate;
  final DateTime toDate;
  const ViewTourExpensesScreen({super.key, required this.fromDate, required this.toDate});

  @override
  State<ViewTourExpensesScreen> createState() => _ViewTourExpensesScreenState();
}

class _ViewTourExpensesScreenState extends State<ViewTourExpensesScreen> {

  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalAmount();
  }

  void _calculateTotalAmount() {
    totalAmount = tourList.fold(
      0.0, (sum, item) => sum + double.tryParse(item.amount)!.toDouble(),
    );
  }

  bool isGrandTotalVisible = false;

  final List<TourListModel> tourList = [
    TourListModel(
      tour: 'Delhi',
      date: '05-Jan-2025',
      remark: 'Client meeting completed',
      amount: '1200',
    ),
    TourListModel(
      tour: 'Noida',
      date: '12-Jan-2025',
      remark: 'Site visit & demo',
      amount: '850',
    ),
    TourListModel(
      tour: 'Gurgaon',
      date: '18-Jan-2025',
      remark: 'Follow-up discussion',
      amount: '950',
    ),
    TourListModel(
      tour: 'Jaipur',
      date: '25-Jan-2025',
      remark: 'New lead onboarding',
      amount: '2200',
    ),
    TourListModel(
      tour: 'Agra',
      date: '02-Feb-2025',
      remark: 'Product presentation',
      amount: '1500',
    ),
    TourListModel(
      tour: 'Chandigarh',
      date: '08-Feb-2025',
      remark: 'Distributor meeting',
      amount: '1800',
    ),
    TourListModel(
      tour: 'Lucknow',
      date: '15-Feb-2025',
      remark: 'Service review visit',
      amount: '1100',
    ),
    TourListModel(
      tour: 'Kanpur',
      date: '20-Feb-2025',
      remark: 'Market survey',
      amount: '700',
    ),
    TourListModel(
      tour: 'Dehradun',
      date: '27-Feb-2025',
      remark: 'Training session',
      amount: '1600',
    ),
    TourListModel(
      tour: 'Haridwar',
      date: '05-Mar-2025',
      remark: 'Customer support visit',
      amount: '900',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "view tour expenses".toUpperCase(),
              fontSize: 15,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: "From 12-dec-2025 TO 12-Jan02026".toUpperCase(),
              fontSize: 15,
              textColor: ColorUtils.white.withOpacity(0.75),
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: InkWell(
              onTap: () {
                  setState(() {
                    isGrandTotalVisible = !isGrandTotalVisible;
                  });

              },
              child: Image(
                image: AssetImage(
                   ImagesUtils.amountIcon,
                ),
                color: ColorUtils.white,
                height: 20,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Stack(
          children: [
            Column(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: isGrandTotalVisible
                      ? Container(
                    key: const ValueKey('grandTotal'),
                    height: 80,
                    padding: const EdgeInsets.only(left: 80),
                    width: screenWidth(context),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/card_for_grand_total.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "Grand Total : ₹ ${totalAmount.toStringAsFixed(2)}",
                          fontSize: 18,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  )
                      : const SizedBox.shrink(),
                ),


                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ValueListenableBuilder(
                      valueListenable: HiveDatabase.newTourExpenseDB().listenable(),
                      builder: (context, Box box, _) {

                        if (box.values.isEmpty) {
                          return const Center(child: Text("No tour expenses added"));
                        }

                        final allList = box.values.toList();

                        /// DATE RANGE FILTER
                        final filteredList = allList.where((item) {
                          final itemDate = DateTime.parse(item.tourDate);

                          final startDate = DateTime(
                            widget.fromDate.year,
                            widget.fromDate.month,
                            widget.fromDate.day,
                          );

                          final endDate = DateTime(
                            widget.toDate.year,
                            widget.toDate.month,
                            widget.toDate.day,
                            23,
                            59,
                            59,
                          );

                          return itemDate.isAfter(startDate.subtract(const Duration(days: 1))) &&
                              itemDate.isBefore(endDate.add(const Duration(seconds: 1)));
                        }).toList().reversed.toList();

                        if (filteredList.isEmpty) {
                          return const Center(
                            child: Text("No data found for selected date range"),
                          );
                        }

                        /// GRAND TOTAL
                        totalAmount = filteredList.fold(
                          0.0, (sum, item) => sum + double.parse(item.tourAmount),
                        );

                        return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: filteredList.length,
                          itemBuilder: (context, index) {
                            final item = filteredList[index];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: ColorUtils.white,
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(color: const Color(0xFFEAECF0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF43474D).withOpacity(0.06),
                                    blurRadius: 60,
                                    offset: const Offset(0, 12),
                                  ),
                                ],
                              ),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [

                                    /// LEFT
                                    Expanded(
                                      flex: 5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          LabelValueWidget(label: "tour", value: item.tourName),
                                          LabelValueWidget(
                                            label: "date",
                                            value: DateFormat('dd MMM yyyy')
                                                .format(DateTime.parse(item.tourDate)),
                                          ),
                                          LabelValueWidget(label: "remark", value: item.tourRemark),
                                          LabelValueWidget(label: "amount", value: item.tourAmount),
                                        ],
                                      ),
                                    ),

                                    /// RIGHT
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                ScreenNavigationUtils.push(
                                                  context,
                                                  child: ViewTourExpensesEdit(item: item),
                                                  type: PageTransitionType.fade,
                                                );
                                              },
                                              child: Image.asset(
                                                ImagesUtils.editIcon,
                                                height: 16,
                                                color: ColorUtils.secondary,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                ScreenNavigationUtils.push(
                                                  context,
                                                  child:  ViewTourExpenseUpload(item:item),
                                                  type: PageTransitionType.fade,
                                                );
                                              },
                                              child: Image.asset(
                                                ImagesUtils.uploadingIcon,
                                                height: 17,
                                                color: ColorUtils.darkText.withOpacity(0.86),
                                              ),
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
                        );
                      },
                    ),
                  ),
                ),


                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 50),
                //     child: ListView.builder(
                //       padding: EdgeInsets.all(10),
                //       itemCount: tourList.length,
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) {
                //         final item = tourList[index];
                //         return Container(
                //           margin: const EdgeInsets.only(bottom: 10),
                //           padding: const EdgeInsets.all(8),
                //           decoration: BoxDecoration(
                //             color: ColorUtils.white,
                //             borderRadius: BorderRadius.circular(11),
                //             border: Border.all(color: const Color(0xFFEAECF0)),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: const Color(
                //                   0xFF43474D,
                //                 ).withOpacity(0.06),
                //                 blurRadius: 60,
                //                 offset: const Offset(0, 12),
                //               ),
                //             ],
                //           ),
                //           child: IntrinsicHeight(
                //             child: Row(
                //               crossAxisAlignment: CrossAxisAlignment.stretch,
                //               children: [
                //                 /// LEFT INFO
                //                 Expanded(
                //                   flex: 5,
                //                   child:  Column(
                //                     crossAxisAlignment:
                //                     CrossAxisAlignment.start,
                //                     children: [
                //                       LabelValueWidget(
                //                         label: "tour",
                //                         value: item.tour,
                //                       ),
                //                       LabelValueWidget(
                //                         label: "date",
                //                         value: item.date,
                //                       ),
                //                       LabelValueWidget(
                //                         label: "remark",
                //                         value: item.remark,
                //                       ),
                //                       LabelValueWidget(
                //                         label: "amount",
                //                         value: item.amount,
                //                       ),
                //                     ],
                //                   )
                //                 ),
                //                 /// RIGHT ICONS
                //                 Expanded(
                //                   flex: 1,
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Column(
                //                       crossAxisAlignment:
                //                       CrossAxisAlignment.end,
                //                       mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                       children: [
                //                         GestureDetector(
                //                           onTap: () {
                //                             ScreenNavigationUtils.push(
                //                               context,
                //                               child: EditTourExpenses(),
                //                               type: PageTransitionType.fade,
                //                             );
                //                           },
                //                           child: Image.asset(
                //                             ImagesUtils.editIcon,
                //                             height: 16,
                //                             color: ColorUtils.secondary,
                //                           ),
                //                         ),
                //                         GestureDetector(
                //                           onTap: () {
                //                             ScreenNavigationUtils.push(
                //                               context,
                //                               child: UploadTourExpenses(),
                //                               type: PageTransitionType.fade,
                //                             );
                //                           },
                //                           child: Image.asset(
                //                             ImagesUtils.uploadingIcon,
                //                             height: 17,
                //                             color: ColorUtils.darkText.withOpacity(0.86),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonWidget(
                        navigateTo: () {
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
                        buttonName: 'Modify Tour',
                        borderRadius: 30,
                        width: screenWidth(context),
                        height: 50,
                        buttonTextColor: ColorUtils.white,
                        buttonColor: ColorUtils.primary,
                      ),
                    ),
                    HorizontalSpace(width: 8),
                    Expanded(
                      child: ButtonWidget(
                        navigateTo: () {
                          ScreenNavigationUtils.push(
                            context,
                            child: NewTourExpenses(),
                            type: PageTransitionType.fade,
                          );
                        },
                        buttonName: 'New Tour',
                        borderRadius: 30,
                        width: screenWidth(context),
                        height: 50,
                        buttonTextColor: ColorUtils.white,
                        buttonColor: ColorUtils.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TourListModel {
  final String tour;
  final String date;
  final String remark;
  final String amount;


  TourListModel({
    required this.tour,
    required this.date,
    required this.remark,
    required this.amount,
  });
}
