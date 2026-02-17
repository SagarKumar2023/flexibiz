import 'dart:ui';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/image_share_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_attachments/activities_attachments_edit.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_view_project_timing/project_view_project_timings_details/project_view_project_timings_details_select_project_job.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

class ProjectViewProjectTimingsDetailsAttachments extends StatefulWidget {
  const ProjectViewProjectTimingsDetailsAttachments({super.key});

  @override
  State<ProjectViewProjectTimingsDetailsAttachments> createState() => _ProjectViewProjectTimingsDetailsAttachmentsState();
}

class _ProjectViewProjectTimingsDetailsAttachmentsState extends State<ProjectViewProjectTimingsDetailsAttachments> {

  final List<AttachmentFileModel> attachmentFileList = [
    AttachmentFileModel(
      image: "https://picsum.photos/id/1011/300/300",
      uploadDate: "07-Mar-2020",
      by: "SUPER",
      file: "project_plan.pdf",
      size: "45 kb",
      job: "job-one",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1015/300/300",
      uploadDate: "15-Apr-2021",
      by: "ADMIN",
      file: "ui_design.png",
      size: "120 kb",
      job: "job-two",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1020/300/300",
      uploadDate: "03-Jan-2022",
      by: "SAGAR",
      file: "invoice_2022.pdf",
      size: "89 kb",
      job: "job-three",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1024/300/300",
      uploadDate: "28-Aug-2022",
      by: "SUPER",
      file: "client_image.jpg",
      size: "230 kb",
      job: "job-four",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1035/300/300",
      uploadDate: "12-Feb-2023",
      by: "RAHUL",
      file: "attendance_sheet.xlsx",
      size: "310 kb",
      job: "job-five",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1038/300/300",
      uploadDate: "09-Jul-2023",
      by: "POOJA",
      file: "sales_chart.png",
      size: "95 kb",
      job: "job-six",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1043/300/300",
      uploadDate: "21-Nov-2023",
      by: "ADMIN",
      file: "dashboard_mockup.jpg",
      size: "180 kb",
      job: "job-seven",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1050/300/300",
      uploadDate: "04-Jan-2024",
      by: "SUPER",
      file: "product_catalog.pdf",
      size: "520 kb",
      job: "job-eight",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1062/300/300",
      uploadDate: "17-Mar-2024",
      by: "AMIT",
      file: "pricing_list.pdf",
      size: "210 kb",
      job: "job-nine",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1070/300/300",
      uploadDate: "30-Jun-2024",
      by: "NEHA",
      file: "marketing_banner.png",
      size: "340 kb",
      job: "job-ten",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1084/300/300",
      uploadDate: "10-Oct-2024",
      by: "SUPER",
      file: "deployment_notes.txt",
      size: "25 kb",
      job: "job-eleven",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/1080/300/300",
      uploadDate: "05-Feb-2025",
      by: "KUNAL",
      file: "hr_policy.pdf",
      size: "410 kb",
      job: "job-twelve",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/109/300/300",
      uploadDate: "18-May-2025",
      by: "ARJUN",
      file: "meeting_photo.jpg",
      size: "275 kb",
      job: "job-thirteen",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/110/300/300",
      uploadDate: "02-Aug-2025",
      by: "SUPER",
      file: "final_build.apk",
      size: "15 mb",
      job: "job-fourteen",
    ),

    AttachmentFileModel(
      image: "https://picsum.photos/id/111/300/300",
      uploadDate: "19-Jan-2026",
      by: "ADMIN",
      file: "release_notes.docx",
      size: "65 kb",
      job: "job-fifteen",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      appBar: AppBar(
        titleSpacing: -3,
        backgroundColor: ColorUtils.primary,
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "PRODUCT IMAGES".toUpperCase(),
              textColor: ColorUtils.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: "Touch to open the attachments",
              textColor: ColorUtils.white.withOpacity(0.8),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: (){
                ScreenNavigationUtils.push(
                  context,
                  child: const ProjectViewProjectTimingsDetailsSelectProjectJob(),
                  type: PageTransitionType.fade,
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
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: ListView.builder(
          itemCount: attachmentFileList.length,
          itemBuilder: (context, index) {
            final item = attachmentFileList[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(11),
                border: Border.all(color: const Color(0xFFEAECF0)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF43474D).withOpacity(0.06),
                    blurRadius: 60,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        await AttachmentActionUtils.openImage(item.image);
                      },
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(item.image),
                            fit: BoxFit.cover,
                          ),

                        ),
                      ),
                    ),
                  ),

                  const HorizontalSpace(width: 6),

                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _labelValue("Uploaded :", item.uploadDate),
                        _labelValue("By :", item.by),
                        _labelValue("File :", item.file),
                        _labelValue("Size :", item.size),
                        _labelValue("Job :", item.job),
                      ],
                    ),
                  ),

                  /// Three dot icon
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
                                                    borderRadius: BorderRadius.circular(7),
                                                    image: DecorationImage(
                                                      image:  NetworkImage(item.image),
                                                      fit: BoxFit.cover,
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
                                                onPageChanged: (index) {
                                                  // setModalState(() {
                                                  //   _currentPage = index;
                                                  // });
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
                                                                  child: const ActivitiesAttachmentsEdit(),
                                                                  type: PageTransitionType.fade,
                                                                );
                                                              },
                                                            ),
                                                            const SizedBox(width: 10),
                                                            BottomSheetActionTile(
                                                              iconImage: ImagesUtils.downloadIcon,
                                                              title: "Download",
                                                              onTap: () async {
                                                                await AttachmentActionUtils.downloadNetworkImage(
                                                                  context,
                                                                  item.image,
                                                                );
                                                                Navigator.pop(context);
                                                              },
                                                            ),
                                                            const SizedBox(width: 10),
                                                            BottomSheetActionTile(
                                                              iconImage: ImagesUtils.shareIcon,
                                                              title: "Share",
                                                              onTap: () {
                                                                Navigator.pop(context);
                                                                AttachmentActionUtils.shareNetworkImage(
                                                                  item.image,
                                                                );
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
                                                                setState(() {
                                                                  attachmentFileList.removeAt(index);
                                                                });
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
              ),
            );
          },
        ),
      ),
    );
  }
  Widget _labelValue(String label, String value) {
    return Row(
      children: [
        TextWidget(
          text: label,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          textColor: ColorUtils.secondary,
        ),
        Expanded(
          child: TextWidget(
            text: value,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            textColor: ColorUtils.indicatorGrey,
          ),
        ),
      ],
    );
  }
}


class AttachmentFileModel {
  final String image;
  final String uploadDate;
  final String by;
  final String file;
  final String size;
  final String job;

  AttachmentFileModel({
    required this.image,
    required this.uploadDate,
    required this.by,
    required this.file,
    required this.size,
    required this.job,
  });
}