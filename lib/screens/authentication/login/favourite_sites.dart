import 'dart:ui';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FavouriteSites extends StatefulWidget {
  const FavouriteSites({super.key});

  @override
  State<FavouriteSites> createState() => _FavouriteSitesState();
}

class _FavouriteSitesState extends State<FavouriteSites> {
  final TextEditingController registerLinkCtr = TextEditingController();

  String selectedLink = "";
  bool showGoToSiteButton = true;
  List<String> savedLinks = [
    "http://www.google.co.in",
    "http://www.irctc.co.in",
    "https://www.flexibizerp.com",
    "http://35.154.116.247",
  ];

  @override
  void initState() {
    super.initState();
    // initial value (1st item)
    registerLinkCtr.text = savedLinks.first;
  }

  bool isPinging = false;
  List<String> pingLogs = [];
  final ScrollController _scrollController = ScrollController();

  void startPing() {
    isPinging = true;
    pingLogs.clear();

    setState(() {});

    Future.doWhile(() async {
      if (!isPinging) return false;

      await Future.delayed(const Duration(seconds: 1));

      pingLogs.add(
          "[64 bytes from server ip: icmp_seq=${pingLogs.length + 1} ttl=250 time=1.${pingLogs.length} ms]"
      );

      setState(() {});

      // auto scroll to bottom
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

      return isPinging;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          surfaceTintColor: ColorUtils.primary,
          backgroundColor: ColorUtils.primary,
          titleSpacing: -4,
          title: TextWidget(
            text: "Favourite site".toUpperCase(),
            fontSize: 15,
            textColor: ColorUtils.white,
            fontWeight: FontWeight.w700,
          ),
          leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
          actions: [
            if (showGoToSiteButton)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: GestureDetector(
                  onTap: () async {
                    String link = registerLinkCtr.text.trim();

                    if (link.isEmpty) {
                      SnackBarUtils.showWarning('Warning', 'Please enter or select a register link');
                      return;
                    }

                    final uri = Uri.tryParse(link);

                    if (uri == null || !(uri.scheme == 'http' || uri.scheme == 'https')) {
                      SnackBarUtils.showWarning('Warning', 'Please enter a valid URL');
                      return;
                    }

                    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
                      SnackBarUtils.showWarning('Error', 'Could not open the link');
                    }
                  },
                  child: TextWidget(
                    text: "Go To site".toUpperCase(),
                    fontSize: 14,
                    textColor: ColorUtils.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 45,
              margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [

                  Expanded(
                    flex: 5,
                    child: TextFieldWidget(
                      cursorColor: ColorUtils.grey,
                      focusBorderColor: ColorUtils.white.withOpacity(0.9),
                      disableBorderColor: ColorUtils.white.withOpacity(0.3),
                      enableBorderColor: ColorUtils.white.withOpacity(0.9),
                      hintTextColor:ColorUtils.grey,
                      labelTextColor:ColorUtils.grey,
                      controller: registerLinkCtr,
                      borderRadius: 100,
                      hintText: "Enter Register Link",
                      keyboardType: TextInputType.url,
                      enabled: true, // always enabled
                      suffixIcon: Container(
                        height: 48,
                        width: 80,
                        padding: EdgeInsets.only(right:5 ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30,
                              width: 2,
                              color: Color(0xFFEAECF0),
                            ),
                            HorizontalSpace(width: 5),
                            InkWell(
                              onTap: (){
                                registerLinkCtr.clear();
                              },
                              child: Container(
                                  height: 25,
                                  width: 25,
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFEAECF0),
                                      width: 1,
                                    ),
                                  ),
                                  child: Image(image: AssetImage(ImagesUtils.closeIcons),height: 20,color: ColorUtils.secondary,width: 10,)),
                            ),

                            HorizontalSpace(width: 5),

                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.black.withOpacity(0.2),
                                  isScrollControlled: true,
                                  builder: (bottomSheetContext) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 8,
                                        sigmaY: 8,
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.all(12),
                                        padding: const EdgeInsets.all(10),
                                        decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xFFFFFFFF),
                                              Color(0xFFF8F8FF),
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: TextWidget(
                                                text: "Saved Link",
                                                fontSize: 14,
                                                textColor: ColorUtils.secondary,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            /// Dynamic list
                                            ...savedLinks.map((link) {
                                              final bool isSelected = registerLinkCtr.text == link;
                                                return  InkWell(
                                                  onTap: () {
                                                    registerLinkCtr.text = link;
                                                    selectedLink = link;

                                                    //  Check if Go To Site button should be hidden
                                                    if (link == "http://35.154.116.247") {
                                                      showGoToSiteButton = false;
                                                    } else {
                                                      showGoToSiteButton = true;
                                                    }

                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    width: screenWidth(context),
                                                    margin: EdgeInsets.only(top: 5),
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      color: isSelected
                                                          ? const Color(0xff9694FF).withOpacity(0.2)
                                                          : Colors.transparent,
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextWidget(
                                                          text: link,
                                                          fontSize: 14,
                                                          textColor: ColorUtils.black.withOpacity(0.8),
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );

                              },
                              child: Container(
                                  height: 25,
                                  width: 25,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFFEAECF0),
                                      width: 1,
                                    ),
                                    // color: ColorUtils.black.withOpacity(0.6)
                                  ),
                                  child: Center(child: Image(image: AssetImage(ImagesUtils.icArrowDropDown),height: 25,color: ColorUtils.secondary,width: 10,))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        if (!isPinging) {
                          startPing();
                        } else {
                          isPinging = false; // STOP
                          setState(() {});
                        }
                      },
                      child: Container(
                        height: 25,
                        margin: EdgeInsets.only(right:5 ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: TextWidget(
                            text: isPinging ? "STOP" : "PING",
                            fontSize: 14,
                            textColor: ColorUtils.black,
                            softSwap: true,
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        // color:ColorUtils.lightScreenBackground,
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView.builder(
            controller: _scrollController,
            itemCount: pingLogs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                child: TextWidget(
                  text: pingLogs[index],
                  fontSize: 13,
                  textColor: ColorUtils.black,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}