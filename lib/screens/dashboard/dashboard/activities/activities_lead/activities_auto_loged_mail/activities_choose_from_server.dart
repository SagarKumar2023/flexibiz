// import 'package:flexibiz/constant/color_Utils.dart';
// import 'package:flexibiz/constant/images.dart';
// import 'package:flexibiz/constant/screen_Size.dart';
// import 'package:flexibiz/constant/spacer.dart';
// import 'package:flexibiz/widgets/Text_widget.dart';
// import 'package:flexibiz/widgets/reusable_widget.dart';
// import 'package:flutter/material.dart';
//
// class ActivitiesChooseFromServer extends StatefulWidget {
//   const ActivitiesChooseFromServer({super.key});
//
//   @override
//   State<ActivitiesChooseFromServer> createState() => _ActivitiesChooseFromServerState();
// }
//
// class _ActivitiesChooseFromServerState extends State<ActivitiesChooseFromServer> {
//
//   final List<Map<String,dynamic>> fileSubCategory = [
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"07-Mar-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"43 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"08-Mar-2020",
//       "By":"SUPER",
//       "File":"ProjectId3_verify_1537237.jpg",
//       "Size":"40 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"23-Feb-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"41 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"23-feb-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"23 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"07-Mar-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"43 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"07-Mar-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"43 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"07-Mar-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"43 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"07-Mar-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"43 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//     {
//       "Image":"assets/images/background_card.jpg",
//       "Upload":"07-Mar-2020",
//       "By":"SUPER",
//       "File":"ProjectId2_verify_1537237.jpg",
//       "Size":"43 Kb",
//       "Project":"ijfjernu",
//       "Job":"Project 2-Job 1"
//     },
//   ];
//
//   bool isFileSubCategorySelected = false;
//
//   final Map<String, List<Map<String, dynamic>>> fileCategory = {
//     "Related Attachments": List.generate(5, (index) => {
//       "Image": "assets/images/background_card.jpg",
//       "Upload": "0${index + 1}-Mar-2020",
//       "By": index % 2 == 0 ? "SUPER" : "ADMIN",
//       "File": "related_attachment_${index + 1}.jpg",
//       "Size": "${40 + index * 3} Kb",
//       "Project": "Project A",
//       "Job": "Job ${index + 1}",
//       "isSelected": false,
//     }),
//
//     "PRODUCT IMAGE": List.generate(5, (index) => {
//       "Image": "assets/images/product_${index + 1}.png",
//       "Upload": "1${index}-Apr-2021",
//       "By": "DESIGNER",
//       "File": "product_image_${index + 1}.png",
//       "Size": "${120 + index * 10} Kb",
//       "Project": "Product Launch",
//       "Job": "Design ${index + 1}",
//       "isSelected": false,
//     }),
//
//     "PRICE LIST": List.generate(5, (index) => {
//       "Image": "assets/images/price_list.png",
//       "Upload": "2${index}-Jan-2022",
//       "By": "SALES",
//       "File": "price_list_v${index + 1}.pdf",
//       "Size": "${80 + index * 5} Kb",
//       "Project": "Sales 202${index}",
//       "Job": "Pricing Sheet",
//       "isSelected": false,
//     }),
//
//     "All Central Files": List.generate(5, (index) => {
//       "Image": "assets/images/folder.png",
//       "Upload": "0${index + 5}-Jun-2023",
//       "By": "SYSTEM",
//       "File": "central_file_${index + 1}.zip",
//       "Size": "${300 + index * 25} Kb",
//       "Project": "Central Repo",
//       "Job": "Archive ${index + 1}",
//       "isSelected": false,
//     }),
//
//     "LITERATURE": List.generate(5, (index) => {
//       "Image": "assets/images/pdf.png",
//       "Upload": "1${index}-Aug-2019",
//       "By": "CONTENT",
//       "File": "literature_${index + 1}.pdf",
//       "Size": "${60 + index * 6} Kb",
//       "Project": "Knowledge Base",
//       "Job": "Doc ${index + 1}",
//       "isSelected": false,
//     }),
//
//     "COMPETITOR": List.generate(5, (index) => {
//       "Image": "assets/images/competitor.png",
//       "Upload": "2${index}-Feb-2024",
//       "By": "RESEARCH",
//       "File": "competitor_analysis_${index + 1}.xlsx",
//       "Size": "${150 + index * 15} Kb",
//       "Project": "Market Study",
//       "Job": "Analysis ${index + 1}",
//       "isSelected": false,
//     }),
//
//     "TRADESHOW": List.generate(5, (index) => {
//       "Image": "assets/images/tradeshow.png",
//       "Upload": "0${index + 3}-Sep-2022",
//       "By": "MARKETING",
//       "File": "tradeshow_event_${index + 1}.jpg",
//       "Size": "${200 + index * 20} Kb",
//       "Project": "Expo 202${index}",
//       "Job": "Event Media",
//       "isSelected": false,
//     }),
//
//     "MISC": List.generate(5, (index) => {
//       "Image": "assets/images/misc.png",
//       "Upload": "1${index}-Dec-2018",
//       "By": "USER",
//       "File": "misc_file_${index + 1}.dat",
//       "Size": "${30 + index * 4} Kb",
//       "Project": "Miscellaneous",
//       "Job": "Task ${index + 1}",
//       "isSelected": false,
//     }),
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorUtils.backgroundColor,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: ColorUtils.primary,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (_) => Dialog(
//             backgroundColor: Colors.transparent,
//             insetPadding: const EdgeInsets.symmetric(horizontal: 20),
//             child: SizedBox(
//               height: 285,
//               width: screenWidth(context),
//               child: Stack(
//                 children: [
//                   Container(
//                     width: screenWidth(context),
//                     margin: EdgeInsets.only(top: 17),
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       // color: ColorUtils.lightScreenBackground,
//                       borderRadius: BorderRadius.circular(12),
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Color(0xFFFFFFFF),
//                           Color(0xFFF8F8FF),
//                         ],
//                         stops: [0.0, 1.0],
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const VerticalSpace(height: 10),
//                         _filterValueWidget(label: "Related Attachments"),
//                         _filterValueWidget(label: "All Central Files"),
//                         _filterValueWidget(label: "PRODUCT IMAGE"),
//                         _filterValueWidget(label: "PRICE LIST"),
//                         _filterValueWidget(label: "LITERATURE"),
//                         _filterValueWidget(label: "COMPETITOR"),
//                         _filterValueWidget(label: "TRADESHOW"),
//                         _filterValueWidget(label: "MISC"),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topCenter,
//                     child: Container(
//                       padding: EdgeInsets.only(left: 14,right: 14,top: 5,bottom: 7),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Color(0xFFFFFFFF)
//                       ),
//                       child: TextWidget(
//                         text:"File Category",
//                         fontSize: 15.5,
//                         textColor: ColorUtils.secondary,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ));
//         },
//         child: Image(image: AssetImage(ImagesUtils.filterIcon),height: 20,color: ColorUtils.secondary,)
//       ),
//       appBar: AppBar(
//         titleSpacing: -8,
//         leading: InkWell(
//           onTap: () => Navigator.of(context).pop(),
//           child: Icon(Icons.arrow_back_ios, color: ColorUtils.white),
//         ),
//         iconTheme: const IconThemeData(color: ColorUtils.colorWhite),
//         title: TextWidget(
//           text: "flexibiz erp".toUpperCase(),
//           textColor: ColorUtils.white,
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: GestureDetector(
//               onTap: (){
//
//               },
//               child: Image(image: AssetImage(ImagesUtils.checkIcon),color: ColorUtils.white,height:25,)
//             ),
//           ),
//         ],
//         backgroundColor: ColorUtils.primary,
//       ),
//       body: Container(
//         padding: EdgeInsets.all(12),
//         height: screenHeight(context),
//         width: screenWidth(context),
//         decoration: AppDecorations.screenbackgroundDecoration,
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: fileSubCategory.length,
//           itemBuilder: (context, index) {
//             final item = fileSubCategory[index];
//             return Container(
//               margin: EdgeInsets.only(bottom: 10),
//               width: screenWidth(context),
//               padding: const EdgeInsets.all(5),
//               decoration:  BoxDecoration(
//                 borderRadius: BorderRadius.circular(11),
//                 color: ColorUtils.white,
//                 border: Border.all(
//                   color: const Color(0xFFEAECF0),
//                   width: 1,
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: const Color(0xFF43474D).withOpacity(0.06),
//                     blurRadius: 60,
//                     offset: const Offset(0, 12),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           height: 90,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: ColorUtils.black,
//                               image: DecorationImage(image: AssetImage(item["Image"]),fit: BoxFit.fill)
//                           ),
//                         ),
//                       ),
//                       HorizontalSpace(width: 5),
//                       Expanded(
//                         flex: 3,
//                         child: Container(
//                           padding: EdgeInsets.only(left: 4),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             // color: ColorUtils.red
//                           ),
//                           child: Column(
//                             children: [
//                               _labelValueWidget(label:"Uploaded : ", value: item["Upload"],),
//                               _labelValueWidget(label:"File Name: ", value: item["File"],),
//                               _labelValueWidget(label:"Size : ", value: item["Size"],),
//                               _labelValueWidget(label:"Remark : ", value: "xyz...",),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 5),
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               isFileSubCategorySelected = !isFileSubCategorySelected;
//                             });
//                           },
//                           borderRadius: BorderRadius.circular(4),
//                           child: Container(
//                             width: 20,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               color:isFileSubCategorySelected ? Color(0xff007BFF) : Colors.white,
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(
//                                 color: isFileSubCategorySelected ? Color(0xff007BFF) : Color(0xFFEAECF0),
//                                 width: 2,
//                               ),
//                             ),
//                             child: isFileSubCategorySelected ?
//                             Image(height: 18,width:18,color: ColorUtils.white,image: AssetImage(ImagesUtils.checkIcon))
//                                 : null,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//   Widget _labelValueWidget({
//     required String label,
//     required String value,
//   }) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextWidget(
//           text: label,
//           textColor: ColorUtils.primary,
//           fontSize: 13,
//           fontWeight: FontWeight.w600,
//         ),
//         Expanded(
//           child: TextWidget(
//             text: value,
//             textColor: ColorUtils.indicatorGrey,
//             fontSize: 13,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _filterValueWidget({
//     required String label,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 5),
//       child:  TextWidget(
//         text: label,
//         fontSize: 16,
//         textAlign: TextAlign.center,
//         textColor: Color(0xff1F1F1F),
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_auto_loged_mail/activities_auto_loged_mail.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class ActivitiesChooseFromServer extends StatefulWidget {
  const ActivitiesChooseFromServer({super.key});

  @override
  State<ActivitiesChooseFromServer> createState() =>
      _ActivitiesChooseFromServerState();
}

class _ActivitiesChooseFromServerState extends State<ActivitiesChooseFromServer> {

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
        titleSpacing: -8,
        backgroundColor: ColorUtils.primary,
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
                  onTap: () {
                    if (selectedFiles.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select at least one file")),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivitiesAutoLoggedMail(
                          selectedCategory: selectedCategory,
                          selectedFiles: selectedFiles,
                        ),
                      ),
                    );
                  },
                child: Image(image: AssetImage(ImagesUtils.checkIcon),color: ColorUtils.white,height:25,)
            )
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
                children: [
                  Expanded(
                    flex: 1,
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

                  /// CHECKBOX
                  InkWell(
                    onTap: () {
                      setState(() {
                        item["isSelected"] = !item["isSelected"];
                      });
                    },
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: item["isSelected"]
                            ? const Color(0xff007BFF)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: item["isSelected"]
                              ? const Color(0xff007BFF)
                              : const Color(0xFFEAECF0),
                          width: 2,
                        ),
                      ),
                      child: item["isSelected"]
                          ? const Icon(Icons.check,
                          size: 16, color: Colors.white)
                          : null,
                    ),
                  ),
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

}

