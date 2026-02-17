import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PendingTeamTask extends StatefulWidget {
  const PendingTeamTask({super.key});

  @override
  State<PendingTeamTask> createState() => _PendingTeamTaskState();
}

class _PendingTeamTaskState extends State<PendingTeamTask> {

  /// SELECTED EXECUTIVES
  List<String> selectedExecutive = [];

  /// EXECUTIVE LIST
  final List<String> executiveList = [
    'ACCOUNTS',
    'CLERK',
    'ERP DEMO',
    'SALES EXECUTIVE',
    'MARKETING MANAGER',
    'HR EXECUTIVE',
    'OPERATIONS HEAD',
    'PRODUCTION SUPERVISOR',
    'QUALITY CONTROL',
    'DISPATCH EXECUTIVE',
    'PURCHASE MANAGER',
    'INVENTORY CONTROLLER',
    'FINANCE OFFICER',
    'CUSTOMER SUPPORT',
    'ADMIN EXECUTIVE',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        centerTitle: true,
        title: TextWidget(
          text: "SELECT EXECUTIVE",
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                  onTap: () {
                    ScreenNavigationUtils.push(
                      context,
                      child: const PendingTask(),
                      type: PageTransitionType.fade,
                    );
                  },
                  child: Image(image: AssetImage(ImagesUtils.checkIcon),color: ColorUtils.white,height:25,)
              )
          ),
        ],
      ),

      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: executiveList.length,
          itemBuilder: (context, index) {
            final item = executiveList[index];
            final bool isSelected = selectedExecutive.contains(item);
            return InkWell(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedExecutive.remove(item);
                  } else {
                    selectedExecutive.add(item);
                  }
                });
              },
              child: Container(
                height: 45,
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [

                    /// CHECKBOX
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? ColorUtils.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: isSelected
                              ? ColorUtils.primary
                              : const Color(0xFFEAECF0),
                          width: 2,
                        ),
                      ),
                      child: isSelected
                          ? Image(
                        height: 14,
                        width: 14,
                        color: ColorUtils.white,
                        image: AssetImage(ImagesUtils.checkIcon),
                      )
                          : null,
                    ),

                    const SizedBox(width: 12),

                    /// EXECUTIVE NAME
                    Expanded(
                      child: TextWidget(
                        text: item,
                        fontSize: 14,
                        textColor: ColorUtils.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
