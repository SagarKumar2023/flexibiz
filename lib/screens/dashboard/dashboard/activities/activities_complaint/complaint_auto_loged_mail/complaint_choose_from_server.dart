import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_auto_loged_mail/activities_auto_loged_mail.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';

class ComplaintChooseFromServer extends StatefulWidget {
  const ComplaintChooseFromServer({super.key});

  @override
  State<ComplaintChooseFromServer> createState() =>
      _ComplaintChooseFromServerState();
}

class _ComplaintChooseFromServerState extends State<ComplaintChooseFromServer> {

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
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: TextWidget(
          text: "FLEXIBIZ ERP",
          textColor: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
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

