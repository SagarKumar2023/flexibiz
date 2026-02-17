import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_complaint/complaint_activities_with_details/complaint_activities_with_details.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class WorkOrderLabInfo extends StatefulWidget {
  const WorkOrderLabInfo({super.key});

  @override
  State<WorkOrderLabInfo> createState() => _WorkOrderLabInfoState();
}

class _WorkOrderLabInfoState extends State<WorkOrderLabInfo> {
  int _expandedIndex = 0; // 1st tile open by default

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
          text: "lab info".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        // color: ColorUtils.lightScreenBackground,
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

                    ],
                  ),
                ),
              ),
              VerticalSpace(height: 15),
              /// =================== Process Specifications Tile =======================
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
                      text: 'Process Specifications',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      LeadInformationInnerWidget(
                        label: "Roto Printin",
                        value: "Rubber Roller Specs :- Diameter 120mm, Rem 0",
                      ),
                      LeadInformationInnerWidget(
                        label: "Roto Printin",
                        value: "Rubber Roller Condition :- Smooth finish, No cracks",
                      ),
                      LeadInformationInnerWidget(
                        label: "Roto Printin",
                        value: "Roto Alignment Status :- Verified & Approved",
                      ),

                      LeadInformationInnerWidget(
                        label: "1ST LAM",
                        value: "Adhesive on Printed Specs :- Rem 0, Uniform Layer",
                      ),
                      LeadInformationInnerWidget(
                        label: "1ST LAM",
                        value: "Lamination Temperature :- 85°C Stable",
                      ),
                      LeadInformationInnerWidget(
                        label: "1ST LAM",
                        value: "Bond Strength :- Within Standard Limit",
                      ),
                      LeadInformationInnerWidget(
                        label: "1ST LAM",
                        value: "Surface Finish :- No bubbles detected",
                      ),

                      LeadInformationInnerWidget(
                        label: "SITTING",
                        value: "Joint Position Specs :- Perfect Alignment, Rem 0",
                      ),
                      LeadInformationInnerWidget(
                        label: "SITTING",
                        value: "Seating Check :- Machine calibrated",
                      ),
                      LeadInformationInnerWidget(
                        label: "SITTING",
                        value: "Operator Verification :- Completed",
                      ),

                      LeadInformationInnerWidget(
                        label: "SEMI",
                        value: "Strength Specs :- Above 5 Rem, Approved",
                      ),
                      LeadInformationInnerWidget(
                        label: "SEMI",
                        value: "Semi Finished QC :- Passed Visual Inspection",
                      ),
                      LeadInformationInnerWidget(
                        label: "SEMI",
                        value: "Material Consistency :- Uniform Thickness",
                      ),

                      LeadInformationInnerWidget(
                        label: "super",
                        value: "09-Nov-2021  Payment discussion pending with accounts",
                      ),

                      LeadInformationInnerWidget(
                        label: "FINISHED",
                        value: "COLOR Specs :- Accurate, No Misprint Found",
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