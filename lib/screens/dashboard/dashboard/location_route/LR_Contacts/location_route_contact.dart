import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/screens/dashboard/dashboard/location_route/LR_Contacts/location_route_contact_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/location_route/LR_Lead/location_route_lead_details.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';

class LeadLocationRouteListModel {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String landmark;

  LeadLocationRouteListModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.landmark,
  });
}

enum LocationRouteContactTab { mapTabScreen, leadListTabScreen }

class LocationRouteContact extends StatefulWidget {
  const LocationRouteContact({super.key});

  @override
  State<LocationRouteContact> createState() => _LocationRouteContactState();
}

class _LocationRouteContactState extends State<LocationRouteContact> {
  bool isSearchShow = false;
  bool isLeadNearAboutContentExpanded = false;
  bool isDefaultRadiusChecked = false;
  LocationRouteContactTab selectedTab = LocationRouteContactTab.mapTabScreen;
  double sliderValue = 5;
  Set<int> favouriteIndexes = {};

  final TextEditingController searchCtr = TextEditingController();
  final List<LeadLocationRouteListModel> leadActivityList = [
    LeadLocationRouteListModel(
      name: "Amit Sharma",
      email: "amit.sharma@gmail.com",
      phone: "9876543210",
      location: "Noida Sector 62",
      landmark: "Near Electronic City Metro",
    ),
    LeadLocationRouteListModel(
      name: "Rohit Verma",
      email: "rohit.verma@yahoo.com",
      phone: "9123456789",
      location: "Greater Noida West",
      landmark: "Gaur City Mall",
    ),
    LeadLocationRouteListModel(
      name: "Neha Singh",
      email: "neha.singh@outlook.com",
      phone: "9988776655",
      location: "Indirapuram",
      landmark: "Shipra Mall",
    ),
    LeadLocationRouteListModel(
      name: "Suresh Kumar",
      email: "suresh.kumar@gmail.com",
      phone: "8899776655",
      location: "Vaishali",
      landmark: "Near Vaishali Metro Station",
    ),
    LeadLocationRouteListModel(
      name: "Priya Gupta",
      email: "priya.gupta@gmail.com",
      phone: "9012345678",
      location: "Crossing Republik",
      landmark: "Assotech Mall",
    ),
    LeadLocationRouteListModel(
      name: "Ankit Mishra",
      email: "ankit.mishra@gmail.com",
      phone: "9871203456",
      location: "Ghaziabad",
      landmark: "Raj Nagar Extension",
    ),
    LeadLocationRouteListModel(
      name: "Pooja Jain",
      email: "pooja.jain@gmail.com",
      phone: "9811122233",
      location: "Noida Sector 18",
      landmark: "Atta Market",
    ),
    LeadLocationRouteListModel(
      name: "Deepak Yadav",
      email: "deepak.yadav@gmail.com",
      phone: "9911223344",
      location: "Sector 50 Noida",
      landmark: "Near City Center",
    ),
    LeadLocationRouteListModel(
      name: "Kavita Mehra",
      email: "kavita.mehra@gmail.com",
      phone: "9898989898",
      location: "Laxmi Nagar",
      landmark: "Near V3S Mall",
    ),
    LeadLocationRouteListModel(
      name: "Rahul Chauhan",
      email: "rahul.chauhan@gmail.com",
      phone: "9090909090",
      location: "Mayur Vihar Phase 1",
      landmark: "Near Metro Gate No. 2",
    ),
    LeadLocationRouteListModel(
      name: "Sunita Rani",
      email: "sunita.rani@gmail.com",
      phone: "9567891234",
      location: "Patparganj",
      landmark: "Industrial Area",
    ),
    LeadLocationRouteListModel(
      name: "Vikas Malhotra",
      email: "vikas.malhotra@gmail.com",
      phone: "9345612789",
      location: "Anand Vihar",
      landmark: "ISBT Anand Vihar",
    ),
    LeadLocationRouteListModel(
      name: "Manish Tiwari",
      email: "manish.tiwari@gmail.com",
      phone: "9870098700",
      location: "Preet Vihar",
      landmark: "Near Community Center",
    ),
    LeadLocationRouteListModel(
      name: "Sneha Kapoor",
      email: "sneha.kapoor@gmail.com",
      phone: "9123987654",
      location: "Rajendra Nagar",
      landmark: "Near Sahibabad Flyover",
    ),
    LeadLocationRouteListModel(
      name: "Arjun Patel",
      email: "arjun.patel@gmail.com",
      phone: "9988001122",
      location: "Kaushambi",
      landmark: "Pacific Mall",
    ),
  ];


  late List<LeadLocationRouteListModel> _filteredList;

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
  void initState() {
    super.initState();
    _filteredList = List.from(leadActivityList);

    searchCtr.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    searchCtr.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = searchCtr.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredList = List.from(leadActivityList);
      } else {
        _filteredList = leadActivityList.where((item) {
          return item.name.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          children: [
            /// APPBAR SECTION
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 12,
                right: 12,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                color: ColorUtils.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isSearchShow
                      ? ListDataSearchField(
                    controller: searchCtr,
                    onPrefixTap: () {
                      setState(() {
                        isSearchShow = false;
                        searchCtr.clear();
                        _filteredList = List.from(leadActivityList);
                      });
                    },
                  )
                      : Row(
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
                      const SizedBox(width: 30),
                      TextWidget(
                        text: "LOCATION ROUTE",
                        fontSize: 15,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      const Spacer(),

                      /// SEARCH ICON ONLY TAB TWO
                      if (selectedTab == LocationRouteContactTab.leadListTabScreen)
                        InkWell(
                          onTap: () {
                            setState(() => isSearchShow = true);
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  /// TABS
                  Row(
                    children: [
                      _tabItem(
                        tab: LocationRouteContactTab.mapTabScreen,
                        icon: ImagesUtils.globalIcon,
                      ),
                      _tabItem(
                        tab: LocationRouteContactTab.leadListTabScreen,
                        icon: ImagesUtils.leadListProjectTimingIcon,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// BODY  SECTION
            Expanded(
              child: selectedTab == LocationRouteContactTab.mapTabScreen
                  ? Container(
                height: screenHeight(context) * 0.87,
                width: screenWidth(context),
                color: ColorUtils.black.withOpacity(0.1),
                child: Stack(
                  children: [
                    Center(
                      child: TextWidget(
                        text: 'Map Section',
                        fontSize: 16,
                        textAlign: TextAlign.center,
                        textColor: ColorUtils.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 15,
                        right: 12,
                        top: 10,
                        bottom: 10,
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFF43474D,
                            ).withOpacity(0.06),
                            blurRadius: 60,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(
                              ImagesUtils.locationTargetIcon,
                            ),
                            height: 15,
                            color: ColorUtils.secondary,
                          ),
                          HorizontalSpace(width: 8),
                          Expanded(
                            child: TextWidget(
                              text:
                              'Gaur City Mall, C1-B-GH-01, Sector – 4, Greater Noida West, Greater Noida – 201301 Uttar Pradesh. marketing@gaurcitymall.com.',
                              fontSize: 14,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              textAlign: TextAlign.start,
                              textColor: ColorUtils.black.withOpacity(
                                0.7,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        color: ColorUtils.white,
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                /// ================= HEADER =================
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    setState(() {
                                      isLeadNearAboutContentExpanded =
                                      !isLeadNearAboutContentExpanded;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: 'Lead Near about',
                                            fontSize: 14,
                                            textColor:
                                            ColorUtils.secondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          TextWidget(
                                            text:
                                            'Tap to change the radius',
                                            fontSize: 12,
                                            textColor: ColorUtils.black
                                                .withOpacity(0.7),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text:
                                            '${sliderValue.round()} Kms',
                                            fontSize: 14,
                                            textColor:
                                            ColorUtils.orangeAccent,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          const SizedBox(width: 6),
                                          Icon(
                                            isLeadNearAboutContentExpanded
                                                ? Icons.keyboard_arrow_up
                                                : Icons
                                                .keyboard_arrow_down,
                                            size: 22,
                                            color: ColorUtils.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                if (isLeadNearAboutContentExpanded) ...[
                                  VerticalSpace(height: 12),

                                  /// ================= SLIDER =================
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: '1',
                                        fontSize: 14,
                                        textAlign: TextAlign.center,
                                        textColor: ColorUtils.black
                                            .withOpacity(0.7),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      Expanded(
                                        child: SliderTheme(
                                          data: SliderTheme.of(context)
                                              .copyWith(
                                            activeTrackColor:
                                            ColorUtils.primary,
                                            inactiveTrackColor:
                                            ColorUtils.grey
                                                .withOpacity(0.3),
                                            thumbColor:
                                            ColorUtils.primary,
                                            trackHeight: 4,
                                            overlayShape:
                                            SliderComponentShape
                                                .noOverlay,
                                            valueIndicatorColor:
                                            ColorUtils.black,
                                            valueIndicatorTextStyle:
                                            const TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                            ),
                                          ),
                                          child: Slider(
                                            min: 1,
                                            max: 50,
                                            value: sliderValue,
                                            label: sliderValue
                                                .round()
                                                .toString(),
                                            onChanged: (value) {
                                              setState(() {
                                                sliderValue = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                      TextWidget(
                                        text: '50',
                                        fontSize: 14,
                                        textAlign: TextAlign.center,
                                        textColor: ColorUtils.black
                                            .withOpacity(0.7),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ],
                                  ),

                                  VerticalSpace(height: 14),

                                  /// ================= CHECKBOX =================
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isDefaultRadiusChecked =
                                            !isDefaultRadiusChecked;
                                          });
                                        },
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color: isDefaultRadiusChecked
                                                ? const Color(0xff007BFF)
                                                : Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(4),
                                            border: Border.all(
                                              color:
                                              isDefaultRadiusChecked
                                                  ? const Color(
                                                0xff007BFF,
                                              )
                                                  : const Color(
                                                0xFFEAECF0,
                                              ),
                                              width: 2,
                                            ),
                                          ),
                                          child: isDefaultRadiusChecked
                                              ? const Icon(
                                            Icons.check,
                                            size: 14,
                                            color: Colors.white,
                                          )
                                              : null,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                              text: 'Default Radius',
                                              fontSize: 14,
                                              textAlign: TextAlign.center,
                                              textColor: ColorUtils.black
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.w600,
                                            ),
                                            TextWidget(
                                              text:
                                              'Check box set selected radius as a default radius for next time',
                                              fontSize: 12,
                                              textAlign: TextAlign.start,
                                              textColor: ColorUtils.black
                                                  .withOpacity(0.7),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: _filteredList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = _filteredList[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorUtils.white,
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(color: const Color(0xFFEAECF0)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF43474D,
                          ).withOpacity(0.06),
                          blurRadius: 60,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          /// LEFT INFO
                          Expanded(
                            flex: 5,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        LocationRouteContactDetails(),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  LabelValueWidget(
                                    label: "Name",
                                    value: item.name,
                                  ),
                                  LabelValueWidget(
                                    label: "email",
                                    value: item.email,
                                  ),
                                  LabelValueWidget(
                                    label: "phone",
                                    value: item.phone,
                                  ),
                                  LabelValueWidget(
                                    label: "location",
                                    value: item.location,
                                  ),
                                  LabelValueWidget(
                                    label: "landmark",
                                    value: item.landmark,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// RIGHT ICONS
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor:
                                        Colors.transparent,
                                        builder: (context) {
                                          return LeadLocationRouteListThreeDotMBottomSheet(
                                            title:
                                            "Vaibhav bansal New test",
                                            mobileNo: "7295992601",
                                            email: "Vaibhav123@gmail.com",
                                            callOnTap: () {
                                              Navigator.pop(context);
                                              ContactActionUtils.makePhoneCall(
                                                item.phone,
                                              );
                                            },
                                            shareOnTap: () {},

                                            updateLandMarkLocationOnTap: () {

                                            },
                                            updateClientLocationOnTap: () {
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
                                                    height: 325,
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
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              const VerticalSpace(
                                                                height:
                                                                10,
                                                              ),
                                                              TextWidget(
                                                                text:
                                                                selectedLocation ??
                                                                    'Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking',
                                                                fontSize:
                                                                16,
                                                                textAlign:
                                                                TextAlign
                                                                    .start,
                                                                textColor:
                                                                Color(
                                                                  0xff1F1F1F,
                                                                ),
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ),
                                                              const VerticalSpace(
                                                                height:
                                                                14,
                                                              ),

                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: ButtonWidget(
                                                                      navigateTo: () {
                                                                        Navigator.pop(
                                                                          context,
                                                                        );
                                                                      },
                                                                      buttonName:
                                                                      'Cancel',
                                                                      borderRadius:
                                                                      10,
                                                                      height:
                                                                      30,
                                                                      buttonTextColor:
                                                                      ColorUtils.white,
                                                                      buttonColor:
                                                                      ColorUtils.primary,
                                                                    ),
                                                                  ),
                                                                  HorizontalSpace(
                                                                    width:
                                                                    8,
                                                                  ),
                                                                  Expanded(
                                                                    child: ButtonWidget(
                                                                      navigateTo: () {
                                                                        showDialog(
                                                                          context: context,
                                                                          builder:
                                                                              (
                                                                              _,
                                                                              ) => Dialog(
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
                                                                      buttonName:
                                                                      'Near By',
                                                                      borderRadius:
                                                                      10,
                                                                      height:
                                                                      30,
                                                                      buttonTextColor:
                                                                      ColorUtils.white,
                                                                      buttonColor:
                                                                      ColorUtils.primary,
                                                                    ),
                                                                  ),
                                                                  HorizontalSpace(
                                                                    width:
                                                                    8,
                                                                  ),
                                                                  Expanded(
                                                                    child: ButtonWidget(
                                                                      navigateTo: () {
                                                                        showDialog(
                                                                          context: context,
                                                                          builder:
                                                                              (
                                                                              _,
                                                                              ) => Dialog(
                                                                            backgroundColor: Colors.transparent,
                                                                            insetPadding: const EdgeInsets.symmetric(
                                                                              horizontal: 20,
                                                                            ),
                                                                            child: SizedBox(
                                                                              height: 195,
                                                                              child: Container(
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
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    TextWidget(
                                                                                      text: "GPS Location Saved Successfully for Lead..",
                                                                                      fontSize: 16,
                                                                                      textAlign: TextAlign.start,
                                                                                      textColor: const Color(
                                                                                        0xff1F1F1F,
                                                                                      ),
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                                    const VerticalSpace(
                                                                                      height: 10,
                                                                                    ),
                                                                                    TextWidget(
                                                                                      text: "Customer : Test User Dev",
                                                                                      fontSize: 14,
                                                                                      textAlign: TextAlign.start,
                                                                                      textColor: const Color(
                                                                                        0xff1F1F1F,
                                                                                      ),
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                    TextWidget(
                                                                                      text: "Contact Person : Test User Dev",
                                                                                      fontSize: 14,
                                                                                      textAlign: TextAlign.start,
                                                                                      textColor: const Color(
                                                                                        0xff1F1F1F,
                                                                                      ),
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                                    const VerticalSpace(
                                                                                      height: 14,
                                                                                    ),
                                                                                    ButtonWidget(
                                                                                      navigateTo: () {
                                                                                        Navigator.pop(
                                                                                          context,
                                                                                        );
                                                                                        Navigator.pop(
                                                                                          context,
                                                                                        );
                                                                                        Navigator.pop(
                                                                                          context,
                                                                                        );
                                                                                      },
                                                                                      buttonName: 'OK',
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
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      buttonName:
                                                                      'Ok',
                                                                      borderRadius:
                                                                      10,
                                                                      height:
                                                                      30,
                                                                      buttonTextColor:
                                                                      ColorUtils.white,
                                                                      buttonColor:
                                                                      ColorUtils.primary,
                                                                    ),
                                                                  ),
                                                                ],
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
                                                              "Update Client Location",
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

                                            shareClientLocation: () {

                                            },
                                          );
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                      ImagesUtils.more,
                                      height: 20,
                                      color: ColorUtils.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= TAB ITEM =================
  Widget _tabItem({required LocationRouteContactTab tab, required String icon}) {
    final bool isSelected = selectedTab == tab;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedTab = tab;
            isSearchShow = false;
            searchCtr.clear();
          });
        },
        child: Column(
          children: [
            ImageIcon(
              AssetImage(icon),
              size: 25,
              color: isSelected ? Colors.white : ColorUtils.grey,
            ),
            const SizedBox(height: 8),
            if (isSelected)
              Container(
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


