import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks_notes/pending_tasks_notes.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks_other/pending_task_other.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks_today/pending_tasks_today.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PendingTask extends StatefulWidget {
  const PendingTask({super.key});

  @override
  State<PendingTask> createState() => _PendingTaskState();
}

class _PendingTaskState extends State<PendingTask> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "pending tasks".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),

        /// TAB BAR AT BOTTOM
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Container(
            color: ColorUtils.primary,
            padding: EdgeInsets.only(bottom: 2),
            child: TabBar(
              dividerHeight: 0,
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              labelStyle: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
              tabs:  [
                tabWithBadge('TODAY', 0),
                tabWithBadge('OTHER',22),
                tabWithBadge('NOTES', 11),
              ],
            ),
          ),
        ),
      ),

      /// TAB BAR VIEW
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: TabBarView(
          controller: _tabController,
          children: [

            /// TODAY TAB
            PendingTasksToday(),

            /// OTHER TAB
            PendingTaskOther(),

            /// NOTES TAB
            PendingTaskNotes(),
          ],
        ),
      ),
    );
  }

  Widget tabWithBadge(String title, int count) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          if (count > 0) ...[
            const SizedBox(width: 6),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                count.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}