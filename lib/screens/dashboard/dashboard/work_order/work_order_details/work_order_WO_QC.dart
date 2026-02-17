import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class WorkOrderWoQc extends StatefulWidget {
  const WorkOrderWoQc({super.key});

  @override
  State<WorkOrderWoQc> createState() => _WorkOrderWoQcState();
}

class _WorkOrderWoQcState extends State<WorkOrderWoQc> {

  late List<WCDetailsListModel> workOrderList = [
    WCDetailsListModel(
      qcDate: "12-08-15",
      qcSlip: "QC15/105",
      productSlip: "DPR1558",
      qcResult: "OK",
      qcDoneBy: "Sagar Kr",
      qcCheckedBy: "Ravi Kr",
      qcRemark: "Ink density verified and approved",
      qcStdSpecs: "Ink : 1.1 | 1.4 | 1.2",
    ),

    WCDetailsListModel(
      qcDate: "13-08-15",
      qcSlip: "QC15/106",
      productSlip: "DPR1560",
      qcResult: "OK",
      qcDoneBy: "Amit Kumar",
      qcCheckedBy: "Rohit Sharma",
      qcRemark: "Print quality within acceptable limits",
      qcStdSpecs: "Ink density within limit",
    ),

    WCDetailsListModel(
      qcDate: "14-08-15",
      qcSlip: "QC15/107",
      productSlip: "DPR1563",
      qcResult: "REWORK",
      qcDoneBy: "Neeraj Singh",
      qcCheckedBy: "QA Head",
      qcRemark: "Shade variation observed, rework required",
      qcStdSpecs: "Color correction needed",
    ),

    WCDetailsListModel(
      qcDate: "15-08-15",
      qcSlip: "QC15/108",
      productSlip: "DPR1565",
      qcResult: "OK",
      qcDoneBy: "Pankaj Verma",
      qcCheckedBy: "Supervisor",
      qcRemark: "Alignment and cutting accuracy confirmed",
      qcStdSpecs: "Printing alignment perfect",
    ),

    WCDetailsListModel(
      qcDate: "16-08-15",
      qcSlip: "QC15/109",
      productSlip: "DPR1568",
      qcResult: "FAIL",
      qcDoneBy: "Rahul Mehta",
      qcCheckedBy: "QA Manager",
      qcRemark: "Ink spreading beyond tolerance level",
      qcStdSpecs: "Ink flow exceeded limit",
    ),

    WCDetailsListModel(
      qcDate: "17-08-15",
      qcSlip: "QC15/110",
      productSlip: "DPR1570",
      qcResult: "OK",
      qcDoneBy: "Sagar Kr",
      qcCheckedBy: "Ravi Kr",
      qcRemark: "Final QC passed without issues",
      qcStdSpecs: "Approved as per standard",
    ),

    WCDetailsListModel(
      qcDate: "18-08-15",
      qcSlip: "QC15/111",
      productSlip: "DPR1573",
      qcResult: "OK",
      qcDoneBy: "Aman Gupta",
      qcCheckedBy: "Production Head",
      qcRemark: "Surface finish smooth and clean",
      qcStdSpecs: "Specs verified",
    ),

    WCDetailsListModel(
      qcDate: "19-08-15",
      qcSlip: "QC15/112",
      productSlip: "DPR1575",
      qcResult: "REWORK",
      qcDoneBy: "Vikas Yadav",
      qcCheckedBy: "Supervisor",
      qcRemark: "Edge trimming not as per standard",
      qcStdSpecs: "Trim correction needed",
    ),

    WCDetailsListModel(
      qcDate: "20-08-15",
      qcSlip: "QC15/113",
      productSlip: "DPR1578",
      qcResult: "OK",
      qcDoneBy: "Rohit Kumar",
      qcCheckedBy: "QA Head",
      qcRemark: "Batch approved after recheck",
      qcStdSpecs: "Quality approved",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "qc details for wo : 0115/204".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),

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
                                TextWidget(
                                  text: "Roto PRINTING",
                                  fontSize: 13,
                                  textColor: ColorUtils.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                LabelValueWidget(
                                  label: "QC Date",
                                  value: item.qcDate,
                                ),
                                LabelValueWidget(
                                  label: "QC Slip",
                                  value: item.qcSlip,
                                ),
                                LabelValueWidget(
                                  label: "Product Slip",
                                  value: item.productSlip,
                                ),
                                LabelValueWidget(
                                  label: "QC Result",
                                  value: item.qcResult,
                                ),
                                LabelValueWidget(
                                  label: "QC Done by",
                                  value: item.qcDoneBy,
                                ),
                                LabelValueWidget(
                                  label: "QC Checked by",
                                  value: item.qcCheckedBy,
                                ),
                                LabelValueWidget(
                                  label: "QC Remark",
                                  value: item.qcRemark,
                                ),
                                LabelValueWidget(
                                  label: "Std. Specs",
                                  value: item.qcStdSpecs,
                                ),
                              ],
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

class WCDetailsListModel {
  final String qcDate;
  final String qcSlip;
  final String productSlip;
  final String qcResult;
  final String qcDoneBy;
  final String qcCheckedBy;
  final String qcRemark;
  final String qcStdSpecs;

  WCDetailsListModel({
    required this.qcDate,
    required this.qcSlip,
    required this.productSlip,
    required this.qcResult,
    required this.qcDoneBy,
    required this.qcCheckedBy,
    required this.qcRemark,
    required this.qcStdSpecs,

  });
}


