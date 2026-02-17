import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/sorting_criteria_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_FG_Stock.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_WO_QC.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_WO_Status.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_approve.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_lab_info.dart';
import 'package:flexibiz/screens/dashboard/dashboard/work_order/work_order_details/work_order_processWiseProduction.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WorkOrderDetails extends StatefulWidget {
  const WorkOrderDetails({super.key});

  @override
  State<WorkOrderDetails> createState() => _WorkOrderDetailsState();
}

class _WorkOrderDetailsState extends State<WorkOrderDetails> {

  late List<WorkOrderListModel> workOrderList = [
    WorkOrderListModel(
      workOrder: "0115/1204",
      fgCode: "10205 LAYS POTATO CHIPS 100 GRAMS",
      workOrderQty: "1000",
      releaseDate: "10-Aug-15 C&F",
      orderNumber: "11 Customer No. 1 B2C",
      status: "Hold - Approved by Lalit Kumar (FlexiBiz)",
    ),
    WorkOrderListModel(
      workOrder: "0116/1205",
      fgCode: "10210 KURKURE MASALA MUNCH 90 GRAMS",
      workOrderQty: "2500",
      releaseDate: "12-Aug-15 Factory",
      orderNumber: "12 Customer No. 3 Retail",
      status: "Released for Production",
    ),
    WorkOrderListModel(
      workOrder: "0117/1206",
      fgCode: "10300 LAYS CLASSIC SALTED 52 GRAMS",
      workOrderQty: "1800",
      releaseDate: "14-Aug-15 C&F",
      orderNumber: "13 Distributor North Zone",
      status: "In Progress",
    ),
    WorkOrderListModel(
      workOrder: "0118/1207",
      fgCode: "10425 DORITOS NACHO CHEESE 60 GRAMS",
      workOrderQty: "3000",
      releaseDate: "16-Aug-15 Warehouse",
      orderNumber: "14 Modern Trade Order",
      status: "Pending Quality Check",
    ),
    WorkOrderListModel(
      workOrder: "0119/1208",
      fgCode: "10550 UNCLE CHIPS SPICY TREAT 72 GRAMS",
      workOrderQty: "2200",
      releaseDate: "18-Aug-15 Factory",
      orderNumber: "15 Customer No. 7 Wholesale",
      status: "Completed",
    ),
    WorkOrderListModel(
      workOrder: "0120/1209",
      fgCode: "10675 LAYS AMERICAN STYLE CREAM & ONION",
      workOrderQty: "1600",
      releaseDate: "20-Aug-15 C&F",
      orderNumber: "16 Export Order UAE",
      status: "Dispatch Scheduled",
    ),
    WorkOrderListModel(
      workOrder: "0121/1210",
      fgCode: "10780 KURKURE CHILLI CHATKA 82 GRAMS",
      workOrderQty: "2800",
      releaseDate: "22-Aug-15 Factory",
      orderNumber: "17 Customer No. 12 Retail",
      status: "Hold - Raw Material Issue",
    ),
    WorkOrderListModel(
      workOrder: "0122/1211",
      fgCode: "10890 LAYS MAXX SOUR CREAM & ONION",
      workOrderQty: "1400",
      releaseDate: "24-Aug-15 Warehouse",
      orderNumber: "18 Online Order B2C",
      status: "Ready for Dispatch",
    ),
    WorkOrderListModel(
      workOrder: "7/1206",
      fgCode: "10300 LAYS CLASSIC SALTED 52 GRAMS",
      workOrderQty: "1800",
      releaseDate: "14-Aug-15 C&F",
      orderNumber: "13 Distributor North Zone",
      status: "In Progress",
    ),
    WorkOrderListModel(
      workOrder: "6/1205",
      fgCode: "10210 KURKURE MASALA MUNCH 90 GRAMS",
      workOrderQty: "2500",
      releaseDate: "12-Aug-15 Factory",
      orderNumber: "12 Customer No. 3 Retail",
      status: "Released for Production",
    ),

    WorkOrderListModel(
      workOrder: "0123/1212",
      fgCode: "10995 DORITOS SWEET CHILLI 65 GRAMS",
      workOrderQty: "1900",
      releaseDate: "26-Aug-15 Factory",
      orderNumber: "19 South Zone Distributor",
      status: "In Production",
    ),
    WorkOrderListModel(
      workOrder: "0124/1213",
      fgCode: "11050 LAYS CLASSIC SALTED JUMBO PACK",
      workOrderQty: "3500",
      releaseDate: "28-Aug-15 C&F",
      orderNumber: "20 Festival Bulk Order",
      status: "Approved & Released",
    ),
  ];
  String selectedSortingCriteria = 'Customer Name';
  bool isAscending = true;


  void sortWorkOrders(String criteria) {
    setState(() {
      switch (criteria) {
        case 'Customer Name':
          workOrderList.sort((a, b) =>
              a.orderNumber.compareTo(b.orderNumber));
          break;

        case 'Job Name':
          workOrderList.sort((a, b) =>
              a.fgCode.compareTo(b.fgCode));
          break;

        case 'Unit Name':
          workOrderList.sort((a, b) =>
              a.workOrder.compareTo(b.workOrder));
          break;

        case 'Release Date':
          workOrderList.sort((a, b) =>
              a.releaseDate.compareTo(b.releaseDate));
          break;

        case 'Work Order':
          workOrderList.sort((a, b) =>
              a.workOrder.compareTo(b.workOrder));
          break;
      }
    });
  }

  void applySorting(SortingResult result) {
    Comparator<WorkOrderListModel> comparator;

    switch (result.criteria) {
      case 'Customer Name':
        comparator = (a, b) =>
            a.orderNumber.compareTo(b.orderNumber);
        break;

      case 'Job Name':
        comparator = (a, b) => a.fgCode.compareTo(b.fgCode);
        break;

      case 'Unit Name':
        comparator = (a, b) => a.workOrder.compareTo(b.workOrder);
        break;

      case 'Release Date':
        comparator = (a, b) => a.releaseDate.compareTo(b.releaseDate);
        break;

      case 'Work Order':
        comparator = (a, b) => a.workOrder.compareTo(b.workOrder);
        break;

      default:
        return;
    }

    setState(() {
      workOrderList.sort(comparator);
      if (!result.isAscending) {
        workOrderList = workOrderList.reversed.toList();
      }
    });
  }

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "work order".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(

                onTap: () async {
                  final result = await showDialog<SortingResult>(
                    context: context,
                    builder: (_) => SortingCriteriaDialog(
                      dialogTitle: "Sorting Criteria",
                      selectedValue: selectedSortingCriteria,
                      isAscending: isAscending,
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      selectedSortingCriteria = result.criteria;
                      isAscending = result.isAscending;
                    });

                    applySorting(result);
                  }
                },
                child: Image(image: AssetImage(ImagesUtils.filterListIcon),color: ColorUtils.white,height: 20,)),
          )

        ],
      ),


      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          children: [
            Expanded(

              child: ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: workOrderList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = workOrderList[index];
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
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                LabelValueWidget(
                                  label: "WO",
                                  value: item.workOrder,
                                ),
                                LabelValueWidget(
                                  label: "FG Code",
                                  value: item.fgCode,
                                ),
                                LabelValueWidget(
                                  label: "WO Qty",
                                  value: item.workOrderQty,
                                ),
                                LabelValueWidget(
                                  label: "Release Dt",
                                  value: item.releaseDate,
                                ),
                                LabelValueWidget(
                                  label: "Order No",
                                  value: item.orderNumber,
                                ),
                                LabelValueWidget(
                                  label: "Status",
                                  value: item.status,
                                ),

                              ],
                            ),
                          ),

                          /// RIGHT ICONS
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Colors.black.withOpacity(0.2),
                                        isScrollControlled: true,
                                        builder: (bottomSheetContext) {
                                          return StatefulBuilder(
                                            builder: (context, setModalState) {
                                              return  Container(
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
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            height: 35,
                                                            width: 35,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              border: Border.all(color:ColorUtils.white,width: 1.1),
                                                              image: DecorationImage(
                                                                image: AssetImage(ImagesUtils.chooseActivitiesIcon),
                                                                fit: BoxFit.fill,
                                                              ),
                                                            ),
                                                          ),
                                                          TextWidget(
                                                            text: "Lay Potato Chips 100 Grams",
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600,
                                                            textColor: const Color(0xFF1D2939),
                                                          ),
                                                          const SizedBox(width: 35,height:35),

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
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      BottomSheetActionTile(
                                                                        iconImage: ImagesUtils.labInfoIcon,
                                                                        title: "Lab Info",
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                          ScreenNavigationUtils.push(
                                                                            context,
                                                                            child: const WorkOrderLabInfo(),
                                                                            type: PageTransitionType.fade,
                                                                          );
                                                                        },
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                      BottomSheetActionTile(
                                                                        iconImage: ImagesUtils.likeIcon,
                                                                        title: "Approve",
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                          ScreenNavigationUtils.push(
                                                                            context,
                                                                            child: const WorkOrderApprove(),
                                                                            type: PageTransitionType.fade,
                                                                          );
                                                                        },
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                      BottomSheetActionTile(
                                                                        iconImage: ImagesUtils.leadInformationIcon,
                                                                        title: "Wo Qc",
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                          ScreenNavigationUtils.push(
                                                                            context,
                                                                            child: const WorkOrderWoQc(),
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
                                                                        iconImage: ImagesUtils.uploadFileIcon,
                                                                        title: "Wo Status",
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                          ScreenNavigationUtils.push(
                                                                            context,
                                                                            child: const WorkOrderWoStatus(),
                                                                            type: PageTransitionType.fade,
                                                                          );
                                                                        },
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                      BottomSheetActionTile(
                                                                        iconImage: ImagesUtils.complaintIcon,
                                                                        title: "Job Complaint",
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                        },
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                      BottomSheetActionTile(
                                                                        iconImage: ImagesUtils.creativeThinkingIcon,
                                                                        title: "Progress wise production",
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                          ScreenNavigationUtils.push(
                                                                            context,
                                                                            child: const WorkOrderProcessWiseProduction(),
                                                                            type: PageTransitionType.fade,
                                                                          );                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),

                                                                ],
                                                              ),
                                                            ),
                                                            SingleChildScrollView(
                                                              padding: const EdgeInsets.only(right: 10),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      BottomSheetActionTile(
                                                                        iconImage: ImagesUtils.lineChartIcon,
                                                                        title: "Fg Stock",
                                                                        onTap: () {
                                                                          Navigator.pop(context);
                                                                          ScreenNavigationUtils.push(
                                                                            context,
                                                                            child: const WorkOrderFgStock(),
                                                                            type: PageTransitionType.fade,
                                                                          );
                                                                        },
                                                                      ),
                                                                      const SizedBox(width: 10),
                                                                      Expanded(child: Container(height:100,)),
                                                                      const SizedBox(width: 10),
                                                                      Expanded(child: Container(height:100,)),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),

                                                          ],
                                                        ),
                                                      ),
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
                                    // onTap: () {
                                    //   showModalBottomSheet(
                                    //     context: context,
                                    //     isScrollControlled: true,
                                    //     backgroundColor:
                                    //     Colors.transparent,
                                    //     builder: (context) {
                                    //       return WorkOrderListThreeDotMBottomSheet(
                                    //         title: "LAYS POTATO CHIPS 100 GRAMS",
                                    //         labInfoOnTap: () {
                                    //           ScreenNavigationUtils.push(
                                    //             context,
                                    //             child: const WorkOrderLabInfo(),
                                    //             type: PageTransitionType.rightToLeft,
                                    //           );
                                    //         },
                                    //         approveOnTap: (){
                                    //           ScreenNavigationUtils.push(
                                    //             context,
                                    //             child: const WorkOrderApprove(),
                                    //             type: PageTransitionType.rightToLeft,
                                    //           );
                                    //         },
                                    //         woQCOnTap: () {
                                    //           ScreenNavigationUtils.push(
                                    //             context,
                                    //             child: const WorkOrderWoQc(),
                                    //             type: PageTransitionType.rightToLeft,
                                    //           );
                                    //         },
                                    //         woStatusOnTap: () {
                                    //           ScreenNavigationUtils.push(
                                    //             context,
                                    //             child: const WorkOrderWoStatus(),
                                    //             type: PageTransitionType.rightToLeft,
                                    //           );
                                    //         },
                                    //         jobComplaintOnTap: () {
                                    //
                                    //         },
                                    //         processWiseProductionOnTap: () {
                                    //           ScreenNavigationUtils.push(
                                    //             context,
                                    //             child: const WorkOrderProcessWiseProduction(),
                                    //             type: PageTransitionType.rightToLeft,
                                    //           );
                                    //         },
                                    //         fgStockOnTap: () {
                                    //           ScreenNavigationUtils.push(
                                    //             context,
                                    //             child: const WorkOrderFgStock(),
                                    //             type: PageTransitionType.rightToLeft,
                                    //           );
                                    //         },
                                    //       );
                                    //     },
                                    //   );
                                    // },
                                    child: Image.asset(
                                      ImagesUtils.more,
                                      height: 20,
                                      color: ColorUtils.secondary,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class WorkOrderListModel {
  final String workOrder;
  final String fgCode;
  final String workOrderQty;
  final String releaseDate;
  final String orderNumber;
  final String status;

  WorkOrderListModel({
    required this.workOrder,
    required this.fgCode,
    required this.workOrderQty,
    required this.releaseDate,
    required this.orderNumber,
    required this.status,
  });
}


