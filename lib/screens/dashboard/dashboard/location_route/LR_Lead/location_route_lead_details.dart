import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/text_widget.dart';

class LocationRouteLeadDetails extends StatefulWidget {
  const LocationRouteLeadDetails({super.key});

  @override
  State<LocationRouteLeadDetails> createState() => _LocationRouteLeadDetailsState();
}

class _LocationRouteLeadDetailsState extends State<LocationRouteLeadDetails> {

  final List<String> locationList = [
    "214 Maple Street, Downtown, Springfield, USA",
    "Flat 302 Shanti Apartments, MG Road, Indore, India",
    "89 Baker Lane, Croydon, London, UK",
    "House No 17 Sector 45, Sector 45, Chandigarh, India",
    "560 Palm Avenue, Santa Monica Beach, Santa Monica, USA",
    "Plot 9B Green Valley Colony, Green Valley, Bhopal, India",
    "44 Kingfisher Drive, Westcroft, Milton Keynes, UK",
    "Apartment 12C Skyline Towers, Bandra West, Mumbai, India",
    "781 Lakeview Road, Lake Edge, Madison, USA",
    "Door No 5/112 Anna Nagar West, Anna Nagar, Chennai, India",
    "63 Rosewood Crescent, Meadowvale, Mississauga, Canada",
    "Villa 21 Silver Oak Enclave, Whitefield, Bengaluru, India",
    "902 Ocean Boulevard, South Beach, Miami Beach, USA",
    "H No 48 Rajendra Nagar, Rajendra Nagar, Patna, India",
    "27 Willow Court, Parramatta West, Sydney, Australia",
  ];
  String? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      body: CustomScrollView(
        slivers: [
          // random current location
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 150.0,
            toolbarHeight: 120,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                width: screenWidth(context),
                decoration: BoxDecoration(
                 color: ColorUtils.primary,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    )
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15,top: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(24),
                              onTap: ()=>Navigator.of(context).pop(),
                              child: Center(
                                child: Image.asset(
                                  ImagesUtils.arrowBackNewIcon,
                                  width: 24,
                                  height: 24,
                                  color:ColorUtils.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => Dialog(
                                    backgroundColor:
                                    Colors.transparent,
                                    insetPadding:
                                    const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: SizedBox(
                                      height: 250,
                                      child: Stack(
                                        children: [
                                          Container(
                                            margin:
                                            EdgeInsets.only(
                                              top: 17,
                                            ),
                                            padding:
                                            const EdgeInsets.all(
                                              16,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                12,
                                              ),
                                              gradient: LinearGradient(
                                                begin: Alignment
                                                    .topCenter,
                                                end: Alignment
                                                    .bottomCenter,
                                                colors: [
                                                  Color(
                                                    0xFFFFFFFF,
                                                  ),
                                                  Color(
                                                    0xFFF8F8FF,
                                                  ),
                                                ],
                                                stops: [
                                                  0.0,
                                                  1.0,
                                                ],
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize
                                                  .min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const VerticalSpace(
                                                  height:
                                                  10,
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    showDialog(
                                                      context: context,
                                                      builder: (_,) => Dialog(
                                                        backgroundColor: Colors.transparent,
                                                        insetPadding: const EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        child: SizedBox(
                                                          height: 560,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                  top: 17,
                                                                ),
                                                                padding: const EdgeInsets.all(
                                                                  16,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                                  gradient: LinearGradient(
                                                                    begin: Alignment.topCenter,
                                                                    end: Alignment.bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                        0xFFFFFFFF,
                                                                      ),
                                                                      Color(
                                                                        0xFFF8F8FF,
                                                                      ),
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0,
                                                                    ],
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    const VerticalSpace(
                                                                      height: 10,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 450,
                                                                      child: ListView.separated(
                                                                        itemCount: locationList.length,
                                                                        shrinkWrap: true,
                                                                        separatorBuilder:
                                                                            (
                                                                            _,
                                                                            __,
                                                                            ) => const SizedBox(),
                                                                        itemBuilder:
                                                                            (
                                                                            context,
                                                                            index,
                                                                            ) {
                                                                          return GestureDetector(
                                                                            onTap: () {
                                                                              setState(
                                                                                    () {
                                                                                  selectedLocation = locationList[index];
                                                                                },
                                                                              );
                                                                              Navigator.pop(
                                                                                context,
                                                                              );
                                                                            },

                                                                            child: Padding(
                                                                              padding: const EdgeInsets.symmetric(
                                                                                vertical: 5,
                                                                              ),
                                                                              child: TextWidget(
                                                                                text: locationList[index],
                                                                                fontSize: 15,
                                                                                textAlign: TextAlign.start,
                                                                                textColor: const Color(
                                                                                  0xff1F1F1F,
                                                                                ),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    const VerticalSpace(
                                                                      height: 14,
                                                                    ),
                                                                    ButtonWidget(
                                                                      navigateTo: () {
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                      },
                                                                      buttonName: 'Dismiss',
                                                                      borderRadius: 10,
                                                                      height: 35,
                                                                      width: screenWidth(
                                                                        context,
                                                                      ),
                                                                      buttonTextColor: ColorUtils.white,
                                                                      buttonColor: ColorUtils.primary,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment.topCenter,
                                                                child: Container(
                                                                  padding: EdgeInsets.only(
                                                                    left: 14,
                                                                    right: 14,
                                                                    top: 5,
                                                                    bottom: 7,
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(
                                                                      20,
                                                                    ),
                                                                    color: Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                  ),
                                                                  child: TextWidget(
                                                                    text: "Are you in",
                                                                    fontSize: 15.5,
                                                                    textColor: ColorUtils.secondary,
                                                                    fontWeight: FontWeight.w700,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextWidget(
                                                          text: "Source Location",
                                                          fontSize: 16,
                                                          textAlign: TextAlign.start,
                                                          textColor:ColorUtils.secondary,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                        TextWidget(
                                                          text: "Tap to know famous near by location around your source location",
                                                          fontSize: 14,
                                                          textAlign: TextAlign.start,
                                                          textColor:ColorUtils.black.withOpacity(0.8),
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                VerticalSpace(height: 10),
                                                InkWell(
                                                  onTap: (){
                                                    showDialog(
                                                      context: context,
                                                      builder: (_,) => Dialog(
                                                        backgroundColor: Colors.transparent,
                                                        insetPadding: const EdgeInsets.symmetric(
                                                          horizontal: 20,
                                                        ),
                                                        child: SizedBox(
                                                          height: 560,
                                                          child: Stack(
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.only(
                                                                  top: 17,
                                                                ),
                                                                padding: const EdgeInsets.all(
                                                                  16,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                                  gradient: LinearGradient(
                                                                    begin: Alignment.topCenter,
                                                                    end: Alignment.bottomCenter,
                                                                    colors: [
                                                                      Color(
                                                                        0xFFFFFFFF,
                                                                      ),
                                                                      Color(
                                                                        0xFFF8F8FF,
                                                                      ),
                                                                    ],
                                                                    stops: [
                                                                      0.0,
                                                                      1.0,
                                                                    ],
                                                                  ),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    const VerticalSpace(
                                                                      height: 10,
                                                                    ),
                                                                    SizedBox(
                                                                      height: 450,
                                                                      child: ListView.separated(
                                                                        itemCount: locationList.length,
                                                                        shrinkWrap: true,
                                                                        separatorBuilder:
                                                                            (
                                                                            _,
                                                                            __,
                                                                            ) => const SizedBox(),
                                                                        itemBuilder:
                                                                            (
                                                                            context,
                                                                            index,
                                                                            ) {
                                                                          return GestureDetector(
                                                                            onTap: () {
                                                                              setState(
                                                                                    () {
                                                                                  selectedLocation = locationList[index];
                                                                                },
                                                                              );
                                                                              Navigator.pop(
                                                                                context,
                                                                              );
                                                                            },

                                                                            child: Padding(
                                                                              padding: const EdgeInsets.symmetric(
                                                                                vertical: 5,
                                                                              ),
                                                                              child: TextWidget(
                                                                                text: locationList[index],
                                                                                fontSize: 15,
                                                                                textAlign: TextAlign.start,
                                                                                textColor: const Color(
                                                                                  0xff1F1F1F,
                                                                                ),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    const VerticalSpace(
                                                                      height: 14,
                                                                    ),
                                                                    ButtonWidget(
                                                                      navigateTo: () {
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                      },
                                                                      buttonName: 'Dismiss',
                                                                      borderRadius: 10,
                                                                      height: 35,
                                                                      width: screenWidth(
                                                                        context,
                                                                      ),
                                                                      buttonTextColor: ColorUtils.white,
                                                                      buttonColor: ColorUtils.primary,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment: Alignment.topCenter,
                                                                child: Container(
                                                                  padding: EdgeInsets.only(
                                                                    left: 14,
                                                                    right: 14,
                                                                    top: 5,
                                                                    bottom: 7,
                                                                  ),
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(
                                                                      20,
                                                                    ),
                                                                    color: Color(
                                                                      0xFFFFFFFF,
                                                                    ),
                                                                  ),
                                                                  child: TextWidget(
                                                                    text: "Are you in",
                                                                    fontSize: 15.5,
                                                                    textColor: ColorUtils.secondary,
                                                                    fontWeight: FontWeight.w700,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(10),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        TextWidget(
                                                          text: "Destination Location",
                                                          fontSize: 16,
                                                          textAlign: TextAlign.start,
                                                          textColor:ColorUtils.secondary,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                        TextWidget(
                                                          text: "Tap to know famous near by location around your destination location",
                                                          fontSize: 14,
                                                          textAlign: TextAlign.start,
                                                          textColor:ColorUtils.black.withOpacity(0.8),
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                            Alignment
                                                .topCenter,
                                            child: Container(
                                              padding:
                                              EdgeInsets.only(
                                                left:
                                                14,
                                                right:
                                                14,
                                                top: 5,
                                                bottom:
                                                7,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(
                                                  20,
                                                ),
                                                color: Color(
                                                  0xFFFFFFFF,
                                                ),
                                              ),
                                              child: TextWidget(
                                                text:
                                                "Near By",
                                                fontSize:
                                                15.5,
                                                textColor:
                                                ColorUtils
                                                    .secondary,
                                                fontWeight:
                                                FontWeight
                                                    .w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Image(
                                image: AssetImage(ImagesUtils.locationMarkIcon),
                                height: 28,
                                color: Colors.red,
                              ),
                            ),

                            //9217035543
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF43474D).withOpacity(0.06), // #43474D0F ≈ 6% opacity
                              blurRadius: 60,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              height: 22,
                              width:22,
                              color:  ColorUtils.grey.withOpacity(0.65),
                              image: AssetImage(ImagesUtils.locationTargetIcon),
                              fit: BoxFit.fill,
                            ),
                            HorizontalSpace(width: 8),
                            Expanded(
                              child: TextWidget(
                                text: "28.646677 , 77.318154 , Rohini Sector 10, Delhi",
                                fontSize: 14.5,
                                textColor: ColorUtils.black,
                                fontWeight: FontWeight.w600,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10,right: 10),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF43474D).withOpacity(0.06), // #43474D0F ≈ 6% opacity
                              blurRadius: 60,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              height: 22,
                              width:22,
                              color:  ColorUtils.grey.withOpacity(0.65),
                              image: AssetImage(ImagesUtils.locationMarkIcon),
                              fit: BoxFit.fill,
                            ),
                            HorizontalSpace(width: 8),
                            Expanded(
                              child: TextWidget(
                                text: "28.646677 ,77.318154 , Mayur Vihar Phase 1, Delhi",
                                fontSize: 14.5,
                                textColor: ColorUtils.black,
                                fontWeight: FontWeight.w600,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),


                          ],
                        ),
                      ),

                      VerticalSpace(height: 10),
                    ],
                  ),
                ),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: TextWidget(
                    text: "MAP SECTION",
                    fontSize: 14.5,
                    textColor: ColorUtils.black,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ]
            )
          )

        ],
      ),
    );
  }
}
