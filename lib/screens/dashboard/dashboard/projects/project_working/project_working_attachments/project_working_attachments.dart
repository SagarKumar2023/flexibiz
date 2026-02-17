import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activites_upload_files/activites_upload_files.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_attachments/activities_attachments_edit.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class ProjectWorkingAttachments extends StatefulWidget {
  const ProjectWorkingAttachments({super.key});

  @override
  State<ProjectWorkingAttachments> createState() => _ProjectWorkingAttachmentsState();
}

class _ProjectWorkingAttachmentsState extends State<ProjectWorkingAttachments> {

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
                    builder: (_) => ActivitiesUploadFiles(),
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
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    decoration: const BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xFFFFFFFF),
                                          Color(0xFFF8F8FF),
                                        ],
                                        stops: [0.0, 1.0],
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                                          decoration: BoxDecoration(
                                            // color: ColorUtils.primary,
                                            borderRadius: const BorderRadius.vertical(
                                              top: Radius.circular(12),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 34,
                                                width: 34,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: ColorUtils.black,
                                                  border: Border.all(
                                                    color: ColorUtils.red.withOpacity(0.3),
                                                    width: 1,
                                                  ),
                                                ),
                                                child:  Icon(
                                                  Icons.person,
                                                  size: 20,
                                                  color: ColorUtils.white,
                                                ),
                                              ),
                                              HorizontalSpace(width: 10),
                                              TextWidget(
                                                text: 'Actions',
                                                fontSize: 16,
                                                textColor: ColorUtils.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () => Navigator.pop(context),
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: ColorUtils.red,
                                                    border: Border.all(
                                                      color: ColorUtils.red.withOpacity(0.3),
                                                      width: 1,
                                                    ),
                                                  ),
                                                  child:  Icon(
                                                    Icons.close,
                                                    size: 20,
                                                    color: ColorUtils.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        VerticalSpace(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15,right: 15),
                                          child: Column(
                                            children: [
                                              _threeDotInsideItem(
                                                icon: ImagesUtils.editIcon,
                                                title: "Edit",
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ActivitiesAttachmentsEdit(),));
                                                },
                                              ),
                                              _threeDotInsideItem(
                                                icon: ImagesUtils.downloadIcon,
                                                title: "Download",
                                                onTap: () {
                                                },
                                              ),
                                              _threeDotInsideItem(
                                                icon: ImagesUtils.shareIcon,
                                                title: "Share",
                                                onTap: () {

                                                },
                                              ),
                                              _threeDotInsideItem(
                                                icon: ImagesUtils.deleteIcon,
                                                title: "Delete",
                                                onTap: () {

                                                },
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
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