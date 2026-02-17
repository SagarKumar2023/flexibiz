import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class WorkOrderProcessWiseProduction extends StatefulWidget {
  const WorkOrderProcessWiseProduction({super.key});

  @override
  State<WorkOrderProcessWiseProduction> createState() => _WorkOrderProcessWiseProductionState();
}

class _WorkOrderProcessWiseProductionState extends State<WorkOrderProcessWiseProduction> {

  late List<ProcessWiseProductionListModel> prccessWiseProductionList = [
    ProcessWiseProductionListModel(
      title: "Roto Printing",
      vrDate: "11-Aug-15",
      slipNo: "DRP1558",
      qtyKg: "180",
      pcs: "106",
    ),

    ProcessWiseProductionListModel(
      title: "Lamination",
      vrDate: "12-Aug-15",
      slipNo: "LAM2011",
      qtyKg: "245",
      pcs: "98",
    ),

    ProcessWiseProductionListModel(
      title: "Slitting",
      vrDate: "13-Aug-15",
      slipNo: "SLT3320",
      qtyKg: "210",
      pcs: "140",
    ),

    ProcessWiseProductionListModel(
      title: "Roto Printing",
      vrDate: "14-Aug-15",
      slipNo: "DRP1562",
      qtyKg: "195",
      pcs: "120",
    ),

    ProcessWiseProductionListModel(
      title: "Lamination",
      vrDate: "15-Aug-15",
      slipNo: "LAM2025",
      qtyKg: "260",
      pcs: "115",
    ),

    ProcessWiseProductionListModel(
      title: "Slitting",
      vrDate: "16-Aug-15",
      slipNo: "SLT3345",
      qtyKg: "225",
      pcs: "160",
    ),

    ProcessWiseProductionListModel(
      title: "Roto Printing",
      vrDate: "17-Aug-15",
      slipNo: "DRP1570",
      qtyKg: "190",
      pcs: "132",
    ),

    ProcessWiseProductionListModel(
      title: "Lamination",
      vrDate: "18-Aug-15",
      slipNo: "LAM2040",
      qtyKg: "275",
      pcs: "125",
    ),

    ProcessWiseProductionListModel(
      title: "Slitting",
      vrDate: "19-Aug-15",
      slipNo: "SLT3388",
      qtyKg: "240",
      pcs: "175",
    ),

    ProcessWiseProductionListModel(
      title: "Roto Printing",
      vrDate: "20-Aug-15",
      slipNo: "DRP1583",
      qtyKg: "205",
      pcs: "145",
    ),

    ProcessWiseProductionListModel(
      title: "Lamination",
      vrDate: "21-Aug-15",
      slipNo: "LAM2066",
      qtyKg: "290",
      pcs: "138",
    ),

    ProcessWiseProductionListModel(
      title: "Slitting",
      vrDate: "22-Aug-15",
      slipNo: "SLT3421",
      qtyKg: "255",
      pcs: "182",
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
          text: "process wise production for 0115/204".toUpperCase(),
          fontSize: 15,
          maxLine: 2,
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
                itemCount: prccessWiseProductionList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = prccessWiseProductionList[index];
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
                                  text: item.title,
                                  fontSize: 13,
                                  textColor: ColorUtils.black,
                                  fontWeight: FontWeight.w600,
                                ),
                                VerticalSpace(height: 5),
                                LabelValueWidget(
                                  label: "vr Date",
                                  value: item.vrDate,
                                ),
                                LabelValueWidget(
                                  label: "Slipno",
                                  value: item.slipNo,
                                ),
                                LabelValueWidget(
                                  label: "qty kg",
                                  value: item.qtyKg,
                                ),
                                LabelValueWidget(
                                  label: "Pcs",
                                  value: item.pcs,
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

class ProcessWiseProductionListModel {
  final String title;
  final String vrDate;
  final String slipNo;
  final String qtyKg;
  final String pcs;

  ProcessWiseProductionListModel({
    required this.title,
    required this.vrDate,
    required this.slipNo,
    required this.qtyKg,
    required this.pcs,
  });
}