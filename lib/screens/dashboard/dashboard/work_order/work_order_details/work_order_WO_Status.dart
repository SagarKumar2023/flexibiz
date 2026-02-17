import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_complaint/complaint_activities_with_details/complaint_activities_with_details.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class WorkOrderWoStatus extends StatefulWidget {
  const WorkOrderWoStatus({super.key});

  @override
  State<WorkOrderWoStatus> createState() => _WorkOrderWoStatusState();
}

class _WorkOrderWoStatusState extends State<WorkOrderWoStatus> {
  int _expandedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "work order status".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// =================== wo common Information Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('lead_info'),
                    initiallyExpanded: _expandedIndex == 0,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 0 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'WO Common Information',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "WO No",
                        value: "WO-2025-01184",
                      ),

                      LeadInformationInnerWidget(
                        label: "User",
                        value: "Rahul Sharma",
                      ),

                      LeadInformationInnerWidget(
                        label: "Party",
                        value: "FlexiBiz ERP Solutions Pvt. Ltd.",
                      ),

                      LeadInformationInnerWidget(
                        label: "Main FG",
                        value: "10205 - LAYS POTATO CHIPS 100 GM",
                      ),

                      LeadInformationInnerWidget(
                        label: "Order No",
                        value: "ORD-78945612",
                      ),

                      LeadInformationInnerWidget(
                        label: "WO Qty",
                        value: "2500 Units",
                      ),
                      LeadInformationInnerWidget(
                        label: "Status",
                        value: "Still Open",
                      ),

                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Film BOM Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('followups'),
                    initiallyExpanded: _expandedIndex == 1,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 1 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'Film BOM',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "PET FILM 12*716\nBOM Qty 567.12426\nTotal Qty 1242565",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "BOPP FILM 20*800\nBOM Qty 320.56780\nTotal Qty 985430",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "CPP FILM 18*650\nBOM Qty 742.89650\nTotal Qty 1567890",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "MET PET FILM 15*720\nBOM Qty 410.25000\nTotal Qty 742360",
                      ),
                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "PET FILM 23*900\nBOM Qty 289.98740\nTotal Qty 563420",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "NYLON FILM 25*1000\nBOM Qty 654.43000\nTotal Qty 1325640",
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),

              /// =================== MISC BOM Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('followups'),
                    initiallyExpanded: _expandedIndex == 1,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 1 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'Misc BOM',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "PET FILM 12*716\nBOM Qty 567.12426\nTotal Qty 1242565",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "BOPP FILM 20*800\nBOM Qty 320.56780\nTotal Qty 985430",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "CPP FILM 18*650\nBOM Qty 742.89650\nTotal Qty 1567890",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "MET PET FILM 15*720\nBOM Qty 410.25000\nTotal Qty 742360",
                      ),
                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "PET FILM 23*900\nBOM Qty 289.98740\nTotal Qty 563420",
                      ),

                      LeadInformationInnerWidget(
                        label: "RM Item",
                        value: "NYLON FILM 25*1000\nBOM Qty 654.43000\nTotal Qty 1325640",
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),

              /// =================== WO ROUTE BOM Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('followups'),
                    initiallyExpanded: _expandedIndex == 1,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 1 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'WO Route',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "Process",
                        value: "ROTO printing Curing\nTime : 10 QC\n Req : y",
                      ),
                      LeadInformationInnerWidget(
                        label: "Process",
                        value: "ROTO printing Curing\nTime : 10 QC\n Req : y",
                      ),
                      LeadInformationInnerWidget(
                        label: "Process",
                        value: "ROTO printing Curing\nTime : 10 QC\n Req : y",
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),

              /// =================== WO Instructions BOM Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('followups'),
                    initiallyExpanded: _expandedIndex == 1,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 1 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'WO Instructions',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "Roto PRINTING",
                        value: "Ink density verified and approved",
                      ),
                      LeadInformationInnerWidget(
                        label: "Roto PRINTING",
                        value: "Ink density verified and approved",
                      ),
                      LeadInformationInnerWidget(
                        label: "Roto PRINTING",
                        value: "Ink density verified and approved",
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),

              /// =================== production status Tile =======================
              Container(
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: const Color(0xFFEAECF0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF43474D).withOpacity(0.06),
                      blurRadius: 60,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Theme(
                  data: Theme.of(
                    context,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: const PageStorageKey('followups'),
                    initiallyExpanded: _expandedIndex == 1,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedIndex = expanded ? 1 : -1;
                      });
                    },
                    leading: Image(
                      image: AssetImage(ImagesUtils.leadInformationIcon),
                      height: 28,
                    ),
                    title: TextWidget(
                      text: 'Production Status',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "Roto PRINTING",
                        value: "Ink density verified and approved",
                      ),
                      LeadInformationInnerWidget(
                        label: "1ST LAM",
                        value: "Ink density verified and approved",
                      ),
                      LeadInformationInnerWidget(
                        label: "SITTING",
                        value: "Ink density verified and approved",
                      ),
                      LeadInformationInnerWidget(
                        label: "PACKING",
                        value: "Ink density verified and approved",
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}