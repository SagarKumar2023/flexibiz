import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class WorkOrderFgStock extends StatefulWidget {
  const WorkOrderFgStock({super.key});

  @override
  State<WorkOrderFgStock> createState() => _WorkOrderFgStockState();
}

class _WorkOrderFgStockState extends State<WorkOrderFgStock> {

  late List<FGStockListModel> prccessWiseProductionList = [
    FGStockListModel(
      unit: "C&F",
      qtyKg: "180",
      pcs: "106",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "245",
      pcs: "98",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "210",
      pcs: "140",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "195",
      pcs: "120",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "260",
      pcs: "115",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "225",
      pcs: "160",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "190",
      pcs: "132",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "275",
      pcs: "125",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "240",
      pcs: "175",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "205",
      pcs: "145",
    ),

    FGStockListModel(
      unit: "C&F",
      qtyKg: "290",
      pcs: "138",
    ),

    FGStockListModel(
      unit: "C&F",
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
          text: "fg stock lays potato chips 100 gram".toUpperCase(),
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
                                LabelValueWidget(
                                  label: "UNIT",
                                  value: item.unit,
                                ),
                                LabelValueWidget(
                                  label: "Qty kg",
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

class FGStockListModel {
  final String unit;
  final String qtyKg;
  final String pcs;

  FGStockListModel({
    required this.unit,
    required this.qtyKg,
    required this.pcs,
  });
}