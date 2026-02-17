import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_note/activities_create_note.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_note/activities_note_edit.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ActivitiesNote extends StatefulWidget {
  const ActivitiesNote({super.key});

  @override
  State<ActivitiesNote> createState() => _ActivitiesNoteState();
}

class _ActivitiesNoteState extends State<ActivitiesNote> {

  List<ActivityNoteModel> notesList = List.generate(15, (index) => ActivityNoteModel(
      title: 'Test Note ${index + 1}',
      choice: index % 2 == 0 ? 'Leads' : 'Follow Up',
      company: 'Flexibiz ERP',
      taskDate: '29-Mar-202${index % 4}',
      createdDate: '29-Apr-2023',
    ),);
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBar(
        titleSpacing: -8,
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        iconTheme: const IconThemeData(color: ColorUtils.colorWhite),
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: "Notes".toUpperCase(),
              textColor: ColorUtils.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: "Flexibiz erp",
              textColor: ColorUtils.white.withOpacity(0.7),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: (){
                ScreenNavigationUtils.push(
                  context,
                  child: const ActivitiesCreateNote(),
                  type: PageTransitionType.rightToLeft,
                );
              },child: Image(image: AssetImage(ImagesUtils.addIcon),color: ColorUtils.white,height: 20,)),
          )
        ],
        backgroundColor: ColorUtils.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            final note = notesList[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              width: screenWidth(context),
              padding: const EdgeInsets.all(6),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: ColorUtils.white,
                border: Border.all(
                  color: const Color(0xFFEAECF0),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF43474D).withOpacity(0.06),
                    blurRadius: 60,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: note.title,
                        textColor: ColorUtils.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                barrierColor: Colors.black.withOpacity(0.2),
                                isScrollControlled: true,
                                builder: (bottomSheetContext) {
                                  return StatefulBuilder(
                                    builder: (context, setModalState) {
                                      return Container(
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(8),
                                                      border: Border.all(color:ColorUtils.white,width: 1.1),
                                                      image: DecorationImage(
                                                        image: AssetImage(ImagesUtils.appLogo),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      TextWidget(
                                                        text: note.title,
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.w600,
                                                        textColor: ColorUtils.secondary,
                                                      ),
                                                      TextWidget(
                                                        text: note.createdDate,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        textColor: const Color(0xFF1D2939),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(height: 12),

                                            /// PAGE VIEW
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10,right: 10),
                                              child: SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.13,
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
                                                        children: [
                                                          Row(
                                                            children: [
                                                              BottomSheetActionTile(
                                                                iconImage: ImagesUtils.editIcon,
                                                                title: "Edit",
                                                                onTap: () {
                                                                  ScreenNavigationUtils.push(
                                                                    context,
                                                                    child: const ActivitiesNoteEdit(),
                                                                    type: PageTransitionType.rightToLeft,
                                                                  );
                                                                },
                                                              ),
                                                              const SizedBox(width: 10),
                                                              BottomSheetActionTile(
                                                                iconImage: ImagesUtils.deleteIcon,
                                                                title: "Delete",
                                                                onTap: () {
                                                                  setState(() {
                                                                    notesList.removeAt(index);
                                                                  });
                                                                  Navigator.pop(context);
                                                                },
                                                              ),
                                                              const SizedBox(width: 10),
                                                              Expanded(child: Container(height: 50,width: 50,))
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
                            //     backgroundColor: Colors.transparent,
                            //     builder: (context) {
                            //       return Container(
                            //         padding: const EdgeInsets.only(bottom: 10),
                            //         decoration: const BoxDecoration(
                            //           borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                            //           gradient: LinearGradient(
                            //             begin: Alignment.topCenter,
                            //             end: Alignment.bottomCenter,
                            //             colors: [
                            //               Color(0xFFFFFFFF),
                            //               Color(0xFFF8F8FF),
                            //             ],
                            //             stops: [0.0, 1.0],
                            //           ),
                            //         ),
                            //         child: Column(
                            //           crossAxisAlignment: CrossAxisAlignment.start,
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             Container(
                            //               padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                            //               decoration: BoxDecoration(
                            //                 // color: ColorUtils.primary,
                            //                 borderRadius: const BorderRadius.vertical(
                            //                   top: Radius.circular(12),
                            //                 ),
                            //               ),
                            //               child: Row(
                            //                 children: [
                            //                   Container(
                            //                     height: 34,
                            //                     width: 34,
                            //                     decoration: BoxDecoration(
                            //                       shape: BoxShape.circle,
                            //                       color: ColorUtils.black,
                            //                       border: Border.all(
                            //                         color: ColorUtils.red.withOpacity(0.3),
                            //                         width: 1,
                            //                       ),
                            //                     ),
                            //                     child:  Icon(
                            //                       Icons.person,
                            //                       size: 20,
                            //                       color: ColorUtils.white,
                            //                     ),
                            //                   ),
                            //                   HorizontalSpace(width: 10),
                            //                   Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       TextWidget(
                            //                         text: "Flexibiz ERP",
                            //                         textColor: ColorUtils.secondary,
                            //                         fontSize: 15,
                            //                         fontWeight: FontWeight.w700,
                            //                       ),
                            //                       TextWidget(
                            //                         text: "29-Apr-2023",
                            //                         textColor: ColorUtils.black.withOpacity(0.8),
                            //                         fontSize: 14,
                            //                         fontWeight: FontWeight.w500,
                            //                       ),
                            //                     ],
                            //                   ),
                            //                   Spacer(),
                            //                   GestureDetector(
                            //                     onTap: () => Navigator.pop(context),
                            //                     child: Container(
                            //                       height: 25,
                            //                       width: 25,
                            //                       decoration: BoxDecoration(
                            //                         shape: BoxShape.circle,
                            //                         color: ColorUtils.red,
                            //                         border: Border.all(
                            //                           color: ColorUtils.red.withOpacity(0.3),
                            //                           width: 1,
                            //                         ),
                            //                       ),
                            //                       child:  Icon(
                            //                         Icons.close,
                            //                         size: 20,
                            //                         color: ColorUtils.white,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //             Padding(
                            //               padding: const EdgeInsets.only(left: 15,right: 15),
                            //               child: Column(
                            //                 children: [
                            //                   _threeDotInsideItem(
                            //                     icon: ImagesUtils.editIcon,
                            //                     title: "Edit",
                            //                     onTap: () {
                            //                       ScreenNavigationUtils.push(
                            //                         context,
                            //                         child: const ActivitiesNoteEdit(),
                            //                         type: PageTransitionType.rightToLeft,
                            //                       );
                            //                     },
                            //                   ),
                            //                   _threeDotInsideItem(
                            //                     icon: ImagesUtils.deleteIcon,
                            //                     title: "Delete",
                            //                     onTap: () {
                            //                       setState(() {
                            //                         notesList.removeAt(index);
                            //                       });
                            //                       Navigator.pop(context);
                            //                     },
                            //                   ),
                            //                 ],
                            //               ),
                            //             ),
                            //
                            //           ],
                            //         ),
                            //       );
                            //     },
                            //   );
                            // },
                            child: Image(image: AssetImage(ImagesUtils.more),color: ColorUtils.secondary,height: 18,)),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: "CHOICE",
                              textColor: ColorUtils.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            TextWidget(
                              text: "COMPANY",
                              textColor: ColorUtils.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            TextWidget(
                              text: "TASK DATE",
                              textColor: ColorUtils.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      HorizontalSpace(width: 5),
                      // value section  jo ki list se ayega
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: note.choice,
                              textColor: ColorUtils.black.withOpacity(0.66),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            TextWidget(
                              text: note.company,
                              textColor: ColorUtils.black.withOpacity(0.66),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            TextWidget(
                              text: note.taskDate,
                              textColor: ColorUtils.black.withOpacity(0.66),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
  Widget _threeDotInsideItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorUtils.secondary
              ),
              child: Image(image: AssetImage(icon),height: 13,color: ColorUtils.white,),
            ),
            const SizedBox(width: 10),
            TextWidget(
              text: title,
              fontSize: 15,
              textColor: ColorUtils.secondary,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

}

class ActivityNoteModel {
  final String title;
  final String choice;
  final String company;
  final String taskDate;
  final String createdDate;

  ActivityNoteModel({
    required this.title,
    required this.choice,
    required this.company,
    required this.taskDate,
    required this.createdDate,
  });
}
