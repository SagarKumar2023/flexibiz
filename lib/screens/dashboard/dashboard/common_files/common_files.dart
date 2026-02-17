import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_attachments/activities_attachments_edit.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/common_files/upload_common_files.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class CommonFiles extends StatefulWidget {
  const CommonFiles({super.key});

  @override
  State<CommonFiles> createState() => _CommonFilesState();
}

class _CommonFilesState extends State<CommonFiles> {

  List<Map<String, dynamic>> get selectedFiles {
    return displayedList
        .where((item) => item["isSelected"] == true)
        .toList();
  }


  String? selectedCategory;

  late final Map<String, List<Map<String, dynamic>>> fileCategory = {
    "Related Attachments": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "related_$i.jpg"),
    ),
    "PRODUCT IMAGE": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "product_$i.png"),
    ),
    "PRICE LIST": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "price_$i.pdf"),
    ),
    "All Central Files": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "central_$i.zip"),
    ),
    "LITERATURE": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "literature_$i.pdf"),
    ),
    "COMPETITOR": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "competitor_$i.xlsx"),
    ),
    "TRADESHOW": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "tradeshow_$i.jpg"),
    ),
    "MISC": List.generate(
      5,
          (i) => _mockItem(index: i, fileName: "misc_$i.dat"),
    ),
  };

  /// ALL FILTERED LIST
  List<Map<String, dynamic>> get displayedList {
    if (selectedCategory == null) {
      return fileCategory.values.expand((e) => e).toList();
    }
    return fileCategory[selectedCategory] ?? [];
  }

  /// ---------------- HELPERS ----------------

  Map<String, dynamic> _mockItem({
    required int index,
    required String fileName,
  }) {
    return {
      "Image": productImages[index % productImages.length],
      "Upload": "07-Mar-2020",
      "By": "SUPER",
      "File": fileName,
      "Size": "45 Kb",
      "Project": "Demo",
      "Job": "Job",
      "isSelected": false,
    };
  }


  final List<String> productImages = [
    "assets/products/product1.jpg",
    "assets/products/product2.jpg",
    "assets/products/product3.jpg",
    "assets/products/product4.jpg",
    "assets/products/product5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.backgroundColor,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(100)),
        backgroundColor: ColorUtils.primary,
        onPressed:(){
          showDialog(
              context: context,
              builder: (_) => Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 340,
                  width: screenWidth(context),
                  child: Stack(
                    children: [
                      Container(
                        width: screenWidth(context),
                        margin: EdgeInsets.only(top: 17),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          // color: ColorUtils.lightScreenBackground,
                          borderRadius: BorderRadius.circular(12),
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
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const VerticalSpace(height: 10),
                            _filterItem("All Files", null),
                            ...fileCategory.keys.map(
                                  (e) => _filterItem(e, e),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFFFFFFF)
                          ),
                          child: TextWidget(
                            text:"File Category",
                            fontSize: 15.5,
                            textColor: ColorUtils.secondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
        child: Image(
          image: AssetImage(ImagesUtils.filterIcon),
          height: 20,
          color: ColorUtils.secondary,
        ),
      ),
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
                  child: const UploadCommonFiles(),
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
          itemCount: displayedList.length,
          itemBuilder: (context, index) {
            final item = displayedList[index];

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
                        await openAssetImage(item["Image"]);
                      },
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(item["Image"]),
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
                        _labelValue("Uploaded :", item["Upload"]),
                        _labelValue("File :", item["File"]),
                        _labelValue("Size :", item["Size"]),
                        _labelValue("Remark :", "xyz..."),
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
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
                                                  border: Border.all(color:ColorUtils.white,width: 1.1),
                                                  image: DecorationImage(
                                                    image: AssetImage(ImagesUtils.chooseActivitiesIcon),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(0xFF43474D).withOpacity(0.06),
                                                      blurRadius: 60,
                                                      offset: const Offset(0, 12),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // const SizedBox(width: 10),
                                              TextWidget(
                                                text: "Actions",
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                textColor: const Color(0xFF1D2939),
                                              ),
                                              SizedBox(
                                                height: 35,
                                                width: 35,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,right: 10),
                                          child: Column(
                                            children: [
                                              VerticalSpace(height: 10),
                                              Row(
                                                children: [
                                                  BottomSheetActionTile(
                                                    iconImage: ImagesUtils.editIcon,
                                                    title: "Edit",
                                                    onTap: (){
                                                      ScreenNavigationUtils.push(
                                                        context,
                                                        child: const ActivitiesAttachmentsEdit(),
                                                        type: PageTransitionType.rightToLeft,
                                                      );
                                                    },
                                                  ),
                                                  const SizedBox(width: 10),
                                                  BottomSheetActionTile(
                                                    iconImage:ImagesUtils.downloadIcon,
                                                    title: "Download",
                                                    onTap: (){},
                                                  ),
                                                  const SizedBox(width: 10),
                                                  BottomSheetActionTile(
                                                    iconImage: ImagesUtils.shareIcon,
                                                    title: "Share",
                                                    onTap: () {},
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  BottomSheetActionTile(
                                                    iconImage: ImagesUtils.deleteIcon,
                                                    title: "Delete",
                                                    onTap: () {
                                                      setState(() {
                                                        displayedList.removeAt(index);
                                                      });
                                                    },
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(child: Container(height: 100,)),
                                                  const SizedBox(width: 10),
                                                  Expanded(child: Container(height: 100,))
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
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
                        //                   TextWidget(
                        //                     text: 'Actions',
                        //                     fontSize: 16,
                        //                     textColor: ColorUtils.black,
                        //                     fontWeight: FontWeight.w600,
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
                        //             VerticalSpace(height: 5),
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
                        //                         child: const ActivitiesAttachmentsEdit(),
                        //                         type: PageTransitionType.rightToLeft,
                        //                       );
                        //                     },
                        //                   ),
                        //                   _threeDotInsideItem(
                        //                     icon: ImagesUtils.downloadIcon,
                        //                     title: "Download",
                        //                     onTap: () {
                        //                     },
                        //                   ),
                        //                   _threeDotInsideItem(
                        //                     icon: ImagesUtils.shareIcon,
                        //                     title: "Share",
                        //                     onTap: () {
                        //
                        //                     },
                        //                   ),
                        //                   _threeDotInsideItem(
                        //                     icon: ImagesUtils.deleteIcon,
                        //                     title: "Delete",
                        //                     onTap: () {
                        //                       setState(() {
                        //                         displayedList.removeAt(index);
                        //                       });
                        //
                        //                     },
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
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

  Widget _filterItem(String label, String? category) {
    return InkWell(
      onTap: () {
        setState(() => selectedCategory = category);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextWidget(
          text: label,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          textColor: selectedCategory == category
              ? ColorUtils.primary
              : Colors.black,
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

  Future<void> openAssetImage(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final Uint8List bytes = byteData.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/${assetPath.split('/').last}');
    await file.writeAsBytes(bytes);

    await OpenFile.open(file.path);
  }
}