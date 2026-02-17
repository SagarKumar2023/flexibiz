import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/widgets/Text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
class PendingTasksToday extends StatefulWidget {
  const PendingTasksToday({super.key});

  @override
  State<PendingTasksToday> createState() => _PendingTasksTodayState();
}

class _PendingTasksTodayState extends State<PendingTasksToday> {
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: screenHeight(context),
      width: screenWidth(context),
      decoration: CommonBoxDecorations.screenBackgroundDecoration,
      child: Center(
        child: TextWidget(
          text: "Today's Pending Tasks",
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );;
  }
}
