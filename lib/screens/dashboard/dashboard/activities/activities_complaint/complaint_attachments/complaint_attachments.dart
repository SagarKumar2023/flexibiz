import 'dart:ui';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_complaint/complaint_attachments/complaint_attachments_edit.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_complaint/complaint_upload_files/complaint_upload_files.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ComplaintAttachments extends StatefulWidget {
  const ComplaintAttachments({super.key});

  @override
  State<ComplaintAttachments> createState() => _ComplaintAttachmentsState();
}

class _ComplaintAttachmentsState extends State<ComplaintAttachments> {

  final List<Map<String,dynamic>> projectData = [
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"07-Mar-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"43 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"08-Mar-2020",
      "By":"SUPER",
      "File":"ProjectId3_verify_1537237.jpg",
      "Size":"40 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"23-Feb-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"41 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"23-feb-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"23 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"07-Mar-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"43 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"07-Mar-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"43 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"07-Mar-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"43 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"07-Mar-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"43 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
    {
      "Image":"assets/images/background_card.jpg",
      "Upload":"07-Mar-2020",
      "By":"SUPER",
      "File":"ProjectId2_verify_1537237.jpg",
      "Size":"43 Kb",
      "Project":"ijfjernu",
      "Job":"Project 2-Job 1"
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBar(
        titleSpacing: -8,
        title: TextWidget(
          text: "Flexibiz erp".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ComplaintUploadFiles(),
                  ),
                );
              },
              child: TextWidget(
                text: "UPLOAD",
                textColor: ColorUtils.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
          itemCount: projectData.length,
          itemBuilder: (context, index) {
            final item = projectData[index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              width: screenWidth(context),
              padding: const EdgeInsets.all(5),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ColorUtils.black,
                            image: DecorationImage(image: AssetImage(item["Image"]),fit: BoxFit.fill)
                          ),
                        ),
                      ),
                      HorizontalSpace(width: 5),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(left: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: ColorUtils.red
                          ),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Uploaded : ",
                                    textColor: ColorUtils.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Expanded(
                                    child: TextWidget(
                                      text: item["Upload"],
                                      textColor: ColorUtils.indicatorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "By : ",
                                    textColor: ColorUtils.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Expanded(
                                    child: TextWidget(
                                      text: item["By"],
                                      textColor: ColorUtils.indicatorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "File : ",
                                    textColor: ColorUtils.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Expanded(
                                    child: TextWidget(
                                      text: item["File"],
                                      textColor: ColorUtils.indicatorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "Size : ",
                                    textColor: ColorUtils.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Expanded(
                                    child: TextWidget(
                                      text: item["Size"],
                                      textColor: ColorUtils.indicatorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: "MSG : ",
                                    textColor: ColorUtils.primary,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Expanded(
                                    child: TextWidget(
                                      text: "xyz...",
                                      textColor: ColorUtils.indicatorGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
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
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 8,
                                          sigmaY: 8,
                                        ),
                                        child: Container(
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
                                                      text: "Actions",
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
                                                                  iconImage: ImagesUtils.editIcon,
                                                                  title: "Edit",
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                    ScreenNavigationUtils.push(
                                                                      context,
                                                                      child: const ComplaintAttachmentsEdit(),
                                                                      type: PageTransitionType.fade,
                                                                    );
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  iconImage: ImagesUtils.downloadIcon,
                                                                  title: "Download",
                                                                  onTap: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                ),
                                                                const SizedBox(width: 10),
                                                                BottomSheetActionTile(
                                                                  iconImage: ImagesUtils.shareIcon,
                                                                  title: "Share",
                                                                  onTap: () {
                                                                    Navigator.pop(context);

                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 10),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () async {
                                                                    Navigator.pop(context);
                                                                  },

                                                                  child: Container(
                                                                    height: 100,
                                                                    width: 105,
                                                                    padding: EdgeInsets.all(2),
                                                                    decoration:  BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(13),
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
                                                                      mainAxisSize: MainAxisSize.min,
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        Image.asset(
                                                                          ImagesUtils.deleteIcon,
                                                                          height: 24,
                                                                          width: 24,
                                                                          color: const Color(0xFF22A2F5),
                                                                        ),
                                                                        const SizedBox(height: 8),
                                                                        const Text("Delete"),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
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
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: Image(image: AssetImage(ImagesUtils.more),color: ColorUtils.black,height: 18,)),
                      )
                    ],
                  )
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