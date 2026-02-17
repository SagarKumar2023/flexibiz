import 'dart:ui';
import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/model/lead_activity_model.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activites_upload_files/activites_upload_files.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_attachments/activities_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_auto_loged_mail/activities_auto_loged_mail.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_close_inquiries.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_lead_dialog.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_log_followups.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_new_task.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_note/activities_note.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_verification.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/lead_activities_with_details/lead_activities_with_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/new_contact_for_lead_customer_contact/activities_edit_contact.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/new_contact_for_lead_customer_contact/new_contact_for_lead_customer_contact.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:page_transition/page_transition.dart';

enum LeadTab { mapTabScreen, leadListTabScreen }

class LeadActivities extends StatefulWidget {
  final LeadFilter filter ;
  final LeadTab initialTab;
  const LeadActivities({super.key, required this.filter,this.initialTab = LeadTab.mapTabScreen,});

  @override
  State<LeadActivities> createState() => _LeadActivitiesState();
}

class _LeadActivitiesState extends State<LeadActivities> {

  late LeadTab selectedTab;
  bool isSearchShow = false;
  bool isLeadNearAboutContentExpanded = false;
  bool isDefaultRadiusChecked = false;
  double sliderValue = 5;
  Set<int> favouriteIndexes = {};
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
  final TextEditingController searchCtr = TextEditingController();
  final List<LeadActivityModel> leadActivityList = [
    LeadActivityModel(
      company: "Flexibiz ERP",
      contact: "Vaibhav Bansal",
      address:
      "Greater Noida West (Noida Extension), Gaur City 1, near Kisan Chowk",
      date: "01/01/2026",
      phone: "7295992601",
      email: "vaibhav@flexibiz.com",
    ),
    LeadActivityModel(
      company: "CodeCenit",
      contact: "Sagar Kumar",
      address: "Bangalore, Karnataka",
      date: "02/01/2026",
      phone: "9876543210",
      email: "sagar@codeceni.com",
    ),
    LeadActivityModel(
      company: "TechNova Solutions",
      contact: "Amit Sharma",
      address: "Sector 62, Noida, Uttar Pradesh",
      date: "03/01/2026",
      phone: "9123456780",
      email: "amit@technova.in",
    ),
    LeadActivityModel(
      company: "InnoSoft Pvt Ltd",
      contact: "Ritika Verma",
      address: "Salt Lake, Kolkata, West Bengal",
      date: "04/01/2026",
      phone: "9988776655",
      email: "ritika@innosoft.com",
    ),
    LeadActivityModel(
      company: "Cloudify Systems",
      contact: "Rahul Mehta",
      address: "Vastrapur, Ahmedabad, Gujarat",
      date: "05/01/2026",
      phone: "9090909090",
      email: "rahul@cloudify.io",
    ),
    LeadActivityModel(
      company: "NextGen IT",
      contact: "Neha Singh",
      address: "Indira Nagar, Lucknow, Uttar Pradesh",
      date: "06/01/2026",
      phone: "8811223344",
      email: "neha@nextgenit.com",
    ),
    LeadActivityModel(
      company: "BlueWave Tech",
      contact: "Ankit Gupta",
      address: "Malviya Nagar, Jaipur, Rajasthan",
      date: "07/01/2026",
      phone: "7700880099",
      email: "ankit@bluewave.tech",
    ),
    LeadActivityModel(
      company: "DataSpark",
      contact: "Pooja Nair",
      address: "Kakkanad, Kochi, Kerala",
      date: "08/01/2026",
      phone: "8899001122",
      email: "pooja@dataspark.ai",
    ),
    LeadActivityModel(
      company: "AppForge Labs",
      contact: "Rohit Malhotra",
      address: "Dwarka Sector 10, New Delhi",
      date: "09/01/2026",
      phone: "7766554433",
      email: "rohit@appforge.dev",
    ),
    LeadActivityModel(
      company: "PixelCraft Studio",
      contact: "Sneha Joshi",
      address: "Baner, Pune, Maharashtra",
      date: "10/01/2026",
      phone: "6655443322",
      email: "sneha@pixelcraft.design",
    ),
  ];
  late List<LeadActivityModel> _filteredList;

  List<LeadActivityModel> _applyFilter(List<LeadActivityModel> list, LeadFilter filter,) {
    // Select All → show everything
    if (filter.selectAll) {
      return List.from(list);
    }

    // No filters entered → show everything
    if (filter.name == null && filter.mobile == null && filter.email == null) {
      return List.from(list);
    }

    return list.where((item) {
      bool match = true;

      if (filter.name != null) {
        final q = filter.name!.toLowerCase();
        match &= item.company.toLowerCase().contains(q) || item.contact.toLowerCase().contains(q);
      }

      if (filter.mobile != null) {
        match &= item.phone.contains(filter.mobile!);
      }

      if (filter.email != null) {
        match &= item.email.toLowerCase().contains(filter.email!.toLowerCase());
      }

      return match;
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    selectedTab = widget.initialTab;
    _filteredList = _applyFilter(
      leadActivityList,
      widget.filter,
    );

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
        _filteredList = _applyFilter(leadActivityList, widget.filter);
      } else {
        _filteredList = _filteredList.where((item) {
          return  item.company.toLowerCase().contains(query) ||
              item.contact.toLowerCase().contains(query) ||
              item.phone.contains(query) ||
              item.email.toLowerCase().contains(query);
        }).toList();
      }
    });
  }

  final PageController _pageController = PageController();
  int _currentPage = 0;

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
                bottom: 2,
              ),
              decoration: BoxDecoration(
                color: ColorUtils.primary,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isSearchShow ? ListDataSearchField(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                              text: "LEAD ACTIVITIES",
                              fontSize: 15,
                              textColor: ColorUtils.white,
                              fontWeight: FontWeight.w700,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                ScreenNavigationUtils.push(
                                  context,
                                  child: const NewContactsForLeadCustomerContact(),
                                  type: PageTransitionType.fade,
                                );
                              },
                              child: Image.asset(
                                ImagesUtils.addIcon,
                                height: 18,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 14),

                            /// SEARCH ICON ONLY TAB TWO
                            if (selectedTab == LeadTab.leadListTabScreen)
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
                        tab: LeadTab.mapTabScreen,
                        icon: ImagesUtils.globalIcon,
                      ),
                      _tabItem(
                        tab: LeadTab.leadListTabScreen,
                        icon: ImagesUtils.leadListProjectTimingIcon,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// BODY  SECTION
            Expanded(
              child: selectedTab == LeadTab.mapTabScreen
                  ? Container(
                      height: screenHeight(context) * 0.87,
                      width: screenWidth(context),
                      color: ColorUtils.black.withOpacity(0.3),
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
                  :
              ListView.builder(
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
                                      ScreenNavigationUtils.push(
                                        context,
                                        child: const LeadActivitiesWithDetails(),
                                        type: PageTransitionType.fade,
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        LabelValueWidget(
                                          label: "Company",
                                          value: item.company,
                                        ),
                                        LabelValueWidget(
                                          label: "Contact",
                                          value: item.contact,
                                        ),
                                        LabelValueWidget(
                                          label: "Address",
                                          value: item.address,
                                        ),
                                        LabelValueWidget(
                                          label: "Date",
                                          value: item.date,
                                        ),
                                        LabelValueWidget(
                                          label: "Phone",
                                          value: item.phone,
                                        ),
                                        LabelValueWidget(
                                          label: "Email",
                                          value: item.email,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
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
                                                        // padding: const EdgeInsets.all(12),
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
                                                                children: [
                                                                  Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      border: Border.all(color:ColorUtils.white,width: 1.1),
                                                                      image: DecorationImage(
                                                                        image: AssetImage("assets/images/man_profile_.jpg"),
                                                                        fit: BoxFit.fill,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(width: 10),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      TextWidget(
                                                                        text: "Sagar Kumar Test User",
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.w600,
                                                                        textColor: const Color(0xFF1D2939),
                                                                      ),
                                                                      TextWidget(
                                                                        text: "sagar123@gmail.com",
                                                                        fontSize: 13,
                                                                        fontWeight: FontWeight.w500,
                                                                        textColor: const Color(0xFF475467),
                                                                      ),
                                                                      TextWidget(
                                                                        text: "7295992604",
                                                                        fontSize: 13,
                                                                        fontWeight: FontWeight.w500,
                                                                        textColor: const Color(0xFF475467),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            /// PAGE VIEW
                                                            Padding(
                                                              padding: const EdgeInsets.all(10),
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
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                iconImage: ImagesUtils.editIcon,
                                                                                title: "Edit",
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesEditContact(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                iconImage: ImagesUtils.starWithColorIcon,
                                                                                title: "Log Follow Up",
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesLogFollowups(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "New Task",
                                                                                iconImage: ImagesUtils.newTaskIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesNewTask(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(height: 10),
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                title: "Upload Files",
                                                                                iconImage: ImagesUtils.uploadFileIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesUploadFiles(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Attachments",
                                                                                iconImage: ImagesUtils.attachmentsIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesAttachments(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Verification",
                                                                                iconImage: ImagesUtils.attachmentsIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesVerification(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );

                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    /// PAGE 2
                                                                    SingleChildScrollView(
                                                                      padding: const EdgeInsets.only(right: 10),
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                title: "Auto Logged Mail",
                                                                                iconImage: ImagesUtils.emailIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext); // previous dialog close
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesAutoLoggedMail(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Close Inquiries",
                                                                                iconImage: ImagesUtils.closeIcons,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesCloseInquiries(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Notes",
                                                                                iconImage: ImagesUtils.noteIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesNote(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(height: 10),
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                title: "Update Client Location",
                                                                                iconImage: ImagesUtils.locationMarkIcon,
                                                                                onTap: () {
                                                                                  // Navigator.pop(bottomSheetContext);
                                                                                  showDialog(
                                                                                    context: context,
                                                                                    builder: (mainDialogContext) => Dialog(
                                                                                      backgroundColor:
                                                                                      Colors.transparent,
                                                                                      insetPadding: const EdgeInsets.symmetric(horizontal: 20,),
                                                                                      child:BackdropFilter(
                                                                                        filter: ImageFilter.blur(
                                                                                          sigmaX: 8,
                                                                                          sigmaY: 8,
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
                                                                                                      selectedLocation ?? 'Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking',
                                                                                                      fontSize: 16,
                                                                                                      textAlign:
                                                                                                      TextAlign.start,
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
                                                                                                              Navigator.pop(mainDialogContext);
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
                                                                                                                builder: (nearByDialogContext) => Dialog(
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
                                                                                                                                  Navigator.pop(context,);
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
                                                                                                                builder: (_) => Dialog(
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
                                                                                                alignment: Alignment.topCenter,
                                                                                                child: Container(
                                                                                                  padding:
                                                                                                  EdgeInsets.only(
                                                                                                    left: 14,
                                                                                                    right: 14,
                                                                                                    top: 5,
                                                                                                    bottom: 7,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius:
                                                                                                    BorderRadius.circular(20,),
                                                                                                    color: Color(0xFFFFFFFF,),
                                                                                                  ),
                                                                                                  child: TextWidget(
                                                                                                    text: "Update Client Location",
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
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Copy to Clipboard",
                                                                                iconImage: ImagesUtils.clipboardIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ContactActionUtils.copyToClipboard(
                                                                                    context,
                                                                                    item,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              HorizontalSpace(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Call",
                                                                                iconImage: ImagesUtils.mobileNoIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(bottomSheetContext);
                                                                                  ContactActionUtils.makePhoneCall(
                                                                                    item.phone,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(height: 10),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    /// PAGE 3
                                                                    Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            BottomSheetActionTile(
                                                                              title: "Share",
                                                                              iconImage: ImagesUtils.shareIcon,
                                                                              onTap: () {},
                                                                            ),
                                                                            HorizontalSpace(width: 10),
                                                                            BottomSheetActionTile(
                                                                              title: "Email",
                                                                              iconImage: ImagesUtils.emailIcon,
                                                                              onTap: (){
                                                                                Navigator.pop(bottomSheetContext);
                                                                                ContactActionUtils.sendEmail(
                                                                                  item.email,
                                                                                );
                                                                              },
                                                                            ),
                                                                            HorizontalSpace(width: 10),
                                                                            BottomSheetActionTile(
                                                                              title: "SMS",
                                                                              iconImage: ImagesUtils.smsIcon,
                                                                              onTap: () {
                                                                                Navigator.pop(bottomSheetContext);
                                                                                ContactActionUtils.sendSMS(
                                                                                  item.phone,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            /// INDICATOR (LIVE)
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: List.generate(3, (index) {
                                                                return AnimatedContainer(
                                                                  duration: const Duration(milliseconds: 300),
                                                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                                                  height: 6,
                                                                  width: _currentPage == index ? 20 : 6,
                                                                  decoration: BoxDecoration(
                                                                    color: _currentPage == index
                                                                        ? const Color(0xFF2FA1F9)
                                                                        : const Color(0xFF2FA1F9).withOpacity(0.25),
                                                                    borderRadius: BorderRadius.circular(10),
                                                                  ),
                                                                );
                                                              }),
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
                                          ///
                                          // onTap: () {
                                          //   showModalBottomSheet(
                                          //     context: context,
                                          //     isScrollControlled: true,
                                          //     backgroundColor:
                                          //         Colors.transparent,
                                          //     builder: (context) {
                                          //       return ActivitiesListThreeDotMBottomSheet(
                                          //         title:
                                          //             "Vaibhav bansal New test",
                                          //         mobileNo: "7295992601",
                                          //         email: "Vaibhav123@gmail.com",
                                          //         editOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesEditContact(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         logFollowupsOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesLogFollowups(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         newTaskOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesNewTask(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         uploadFilesOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesUploadFiles(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         attachmentsOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesAttachments(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         verificationOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesVerification(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         autoLoggedMailOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesAutoLoggedMail(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         closeInquiriesOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesCloseInquiries(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         notesOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ActivitiesNote(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         updateClientLocationOnTap: () {
                                          //           showDialog(
                                          //             context: context,
                                          //             builder: (_) => Dialog(
                                          //               backgroundColor:
                                          //                   Colors.transparent,
                                          //               insetPadding:
                                          //                   const EdgeInsets.symmetric(
                                          //                     horizontal: 20,
                                          //                   ),
                                          //               child: SizedBox(
                                          //                 height: 325,
                                          //                 child: Stack(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin:
                                          //                           EdgeInsets.only(
                                          //                             top: 17,
                                          //                           ),
                                          //                       padding:
                                          //                           const EdgeInsets.all(
                                          //                             16,
                                          //                           ),
                                          //                       decoration: BoxDecoration(
                                          //                         borderRadius:
                                          //                             BorderRadius.circular(
                                          //                               12,
                                          //                             ),
                                          //                         gradient: LinearGradient(
                                          //                           begin: Alignment
                                          //                               .topCenter,
                                          //                           end: Alignment
                                          //                               .bottomCenter,
                                          //                           colors: [
                                          //                             Color(
                                          //                               0xFFFFFFFF,
                                          //                             ),
                                          //                             Color(
                                          //                               0xFFF8F8FF,
                                          //                             ),
                                          //                           ],
                                          //                           stops: [
                                          //                             0.0,
                                          //                             1.0,
                                          //                           ],
                                          //                         ),
                                          //                       ),
                                          //                       child: Column(
                                          //                         mainAxisSize:
                                          //                             MainAxisSize
                                          //                                 .min,
                                          //                         crossAxisAlignment:
                                          //                             CrossAxisAlignment
                                          //                                 .start,
                                          //                         children: [
                                          //                           const VerticalSpace(
                                          //                             height:
                                          //                                 10,
                                          //                           ),
                                          //                           TextWidget(
                                          //                             text:
                                          //                                 selectedLocation ??
                                          //                                 'Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking',
                                          //                             fontSize:
                                          //                                 16,
                                          //                             textAlign:
                                          //                                 TextAlign
                                          //                                     .start,
                                          //                             textColor:
                                          //                                 Color(
                                          //                                   0xff1F1F1F,
                                          //                                 ),
                                          //                             fontWeight:
                                          //                                 FontWeight
                                          //                                     .w500,
                                          //                           ),
                                          //                           const VerticalSpace(
                                          //                             height:
                                          //                                 14,
                                          //                           ),
                                          //
                                          //                           Row(
                                          //                             children: [
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     Navigator.pop(
                                          //                                       context,
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName:
                                          //                                       'Cancel',
                                          //                                   borderRadius:
                                          //                                       10,
                                          //                                   height:
                                          //                                       30,
                                          //                                   buttonTextColor:
                                          //                                       ColorUtils.white,
                                          //                                   buttonColor:
                                          //                                       ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                               HorizontalSpace(
                                          //                                 width:
                                          //                                     8,
                                          //                               ),
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder:
                                          //                                           (
                                          //                                             _,
                                          //                                           ) => Dialog(
                                          //                                             backgroundColor: Colors.transparent,
                                          //                                             insetPadding: const EdgeInsets.symmetric(
                                          //                                               horizontal: 20,
                                          //                                             ),
                                          //                                             child: SizedBox(
                                          //                                               height: 560,
                                          //                                               child: Stack(
                                          //                                                 children: [
                                          //                                                   Container(
                                          //                                                     margin: EdgeInsets.only(
                                          //                                                       top: 17,
                                          //                                                     ),
                                          //                                                     padding: const EdgeInsets.all(
                                          //                                                       16,
                                          //                                                     ),
                                          //                                                     decoration: BoxDecoration(
                                          //                                                       borderRadius: BorderRadius.circular(
                                          //                                                         12,
                                          //                                                       ),
                                          //                                                       gradient: LinearGradient(
                                          //                                                         begin: Alignment.topCenter,
                                          //                                                         end: Alignment.bottomCenter,
                                          //                                                         colors: [
                                          //                                                           Color(
                                          //                                                             0xFFFFFFFF,
                                          //                                                           ),
                                          //                                                           Color(
                                          //                                                             0xFFF8F8FF,
                                          //                                                           ),
                                          //                                                         ],
                                          //                                                         stops: [
                                          //                                                           0.0,
                                          //                                                           1.0,
                                          //                                                         ],
                                          //                                                       ),
                                          //                                                     ),
                                          //                                                     child: Column(
                                          //                                                       mainAxisSize: MainAxisSize.min,
                                          //                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                       children: [
                                          //                                                         const VerticalSpace(
                                          //                                                           height: 10,
                                          //                                                         ),
                                          //                                                         SizedBox(
                                          //                                                           height: 450,
                                          //                                                           child: ListView.separated(
                                          //                                                             itemCount: locationList.length,
                                          //                                                             shrinkWrap: true,
                                          //                                                             separatorBuilder:
                                          //                                                                 (
                                          //                                                                   _,
                                          //                                                                   __,
                                          //                                                                 ) => const SizedBox(),
                                          //                                                             itemBuilder:
                                          //                                                                 (
                                          //                                                                   context,
                                          //                                                                   index,
                                          //                                                                 ) {
                                          //                                                                   return GestureDetector(
                                          //                                                                     onTap: () {
                                          //                                                                       setState(
                                          //                                                                         () {
                                          //                                                                           selectedLocation = locationList[index];
                                          //                                                                         },
                                          //                                                                       );
                                          //                                                                       Navigator.pop(
                                          //                                                                         context,
                                          //                                                                       );
                                          //                                                                     },
                                          //
                                          //                                                                     child: Padding(
                                          //                                                                       padding: const EdgeInsets.symmetric(
                                          //                                                                         vertical: 5,
                                          //                                                                       ),
                                          //                                                                       child: TextWidget(
                                          //                                                                         text: locationList[index],
                                          //                                                                         fontSize: 15,
                                          //                                                                         textAlign: TextAlign.start,
                                          //                                                                         textColor: const Color(
                                          //                                                                           0xff1F1F1F,
                                          //                                                                         ),
                                          //                                                                         fontWeight: FontWeight.w500,
                                          //                                                                       ),
                                          //                                                                     ),
                                          //                                                                   );
                                          //                                                                 },
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         const VerticalSpace(
                                          //                                                           height: 14,
                                          //                                                         ),
                                          //                                                         ButtonWidget(
                                          //                                                           navigateTo: () {
                                          //                                                             Navigator.pop(
                                          //                                                               context,
                                          //                                                             );
                                          //                                                           },
                                          //                                                           buttonName: 'Dismiss',
                                          //                                                           borderRadius: 10,
                                          //                                                           height: 35,
                                          //                                                           width: screenWidth(
                                          //                                                             context,
                                          //                                                           ),
                                          //                                                           buttonTextColor: ColorUtils.white,
                                          //                                                           buttonColor: ColorUtils.primary,
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   Align(
                                          //                                                     alignment: Alignment.topCenter,
                                          //                                                     child: Container(
                                          //                                                       padding: EdgeInsets.only(
                                          //                                                         left: 14,
                                          //                                                         right: 14,
                                          //                                                         top: 5,
                                          //                                                         bottom: 7,
                                          //                                                       ),
                                          //                                                       decoration: BoxDecoration(
                                          //                                                         borderRadius: BorderRadius.circular(
                                          //                                                           20,
                                          //                                                         ),
                                          //                                                         color: Color(
                                          //                                                           0xFFFFFFFF,
                                          //                                                         ),
                                          //                                                       ),
                                          //                                                       child: TextWidget(
                                          //                                                         text: "Are you in",
                                          //                                                         fontSize: 15.5,
                                          //                                                         textColor: ColorUtils.secondary,
                                          //                                                         fontWeight: FontWeight.w700,
                                          //                                                       ),
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                 ],
                                          //                                               ),
                                          //                                             ),
                                          //                                           ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName:
                                          //                                       'Near By',
                                          //                                   borderRadius:
                                          //                                       10,
                                          //                                   height:
                                          //                                       30,
                                          //                                   buttonTextColor:
                                          //                                       ColorUtils.white,
                                          //                                   buttonColor:
                                          //                                       ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                               HorizontalSpace(
                                          //                                 width:
                                          //                                     8,
                                          //                               ),
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder:
                                          //                                           (
                                          //                                             _,
                                          //                                           ) => Dialog(
                                          //                                             backgroundColor: Colors.transparent,
                                          //                                             insetPadding: const EdgeInsets.symmetric(
                                          //                                               horizontal: 20,
                                          //                                             ),
                                          //                                             child: SizedBox(
                                          //                                               height: 195,
                                          //                                               child: Container(
                                          //                                                 margin: EdgeInsets.only(
                                          //                                                   top: 17,
                                          //                                                 ),
                                          //                                                 padding: const EdgeInsets.all(
                                          //                                                   16,
                                          //                                                 ),
                                          //                                                 decoration: BoxDecoration(
                                          //                                                   borderRadius: BorderRadius.circular(
                                          //                                                     12,
                                          //                                                   ),
                                          //                                                   gradient: LinearGradient(
                                          //                                                     begin: Alignment.topCenter,
                                          //                                                     end: Alignment.bottomCenter,
                                          //                                                     colors: [
                                          //                                                       Color(
                                          //                                                         0xFFFFFFFF,
                                          //                                                       ),
                                          //                                                       Color(
                                          //                                                         0xFFF8F8FF,
                                          //                                                       ),
                                          //                                                     ],
                                          //                                                     stops: [
                                          //                                                       0.0,
                                          //                                                       1.0,
                                          //                                                     ],
                                          //                                                   ),
                                          //                                                 ),
                                          //                                                 child: Column(
                                          //                                                   mainAxisSize: MainAxisSize.min,
                                          //                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                   mainAxisAlignment: MainAxisAlignment.center,
                                          //                                                   children: [
                                          //                                                     TextWidget(
                                          //                                                       text: "GPS Location Saved Successfully for Lead..",
                                          //                                                       fontSize: 16,
                                          //                                                       textAlign: TextAlign.start,
                                          //                                                       textColor: const Color(
                                          //                                                         0xff1F1F1F,
                                          //                                                       ),
                                          //                                                       fontWeight: FontWeight.w600,
                                          //                                                     ),
                                          //                                                     const VerticalSpace(
                                          //                                                       height: 10,
                                          //                                                     ),
                                          //                                                     TextWidget(
                                          //                                                       text: "Customer : Test User Dev",
                                          //                                                       fontSize: 14,
                                          //                                                       textAlign: TextAlign.start,
                                          //                                                       textColor: const Color(
                                          //                                                         0xff1F1F1F,
                                          //                                                       ),
                                          //                                                       fontWeight: FontWeight.w500,
                                          //                                                     ),
                                          //                                                     TextWidget(
                                          //                                                       text: "Contact Person : Test User Dev",
                                          //                                                       fontSize: 14,
                                          //                                                       textAlign: TextAlign.start,
                                          //                                                       textColor: const Color(
                                          //                                                         0xff1F1F1F,
                                          //                                                       ),
                                          //                                                       fontWeight: FontWeight.w500,
                                          //                                                     ),
                                          //                                                     const VerticalSpace(
                                          //                                                       height: 14,
                                          //                                                     ),
                                          //                                                     ButtonWidget(
                                          //                                                       navigateTo: () {
                                          //                                                         Navigator.pop(
                                          //                                                           context,
                                          //                                                         );
                                          //                                                         Navigator.pop(
                                          //                                                           context,
                                          //                                                         );
                                          //                                                         Navigator.pop(
                                          //                                                           context,
                                          //                                                         );
                                          //                                                       },
                                          //                                                       buttonName: 'OK',
                                          //                                                       borderRadius: 10,
                                          //                                                       height: 35,
                                          //                                                       width: screenWidth(
                                          //                                                         context,
                                          //                                                       ),
                                          //                                                       buttonTextColor: ColorUtils.white,
                                          //                                                       buttonColor: ColorUtils.primary,
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ),
                                          //                                           ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName:
                                          //                                       'Ok',
                                          //                                   borderRadius:
                                          //                                       10,
                                          //                                   height:
                                          //                                       30,
                                          //                                   buttonTextColor:
                                          //                                       ColorUtils.white,
                                          //                                   buttonColor:
                                          //                                       ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                             ],
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ),
                                          //                     Align(
                                          //                       alignment:
                                          //                           Alignment
                                          //                               .topCenter,
                                          //                       child: Container(
                                          //                         padding:
                                          //                             EdgeInsets.only(
                                          //                               left:
                                          //                                   14,
                                          //                               right:
                                          //                                   14,
                                          //                               top: 5,
                                          //                               bottom:
                                          //                                   7,
                                          //                             ),
                                          //                         decoration: BoxDecoration(
                                          //                           borderRadius:
                                          //                               BorderRadius.circular(
                                          //                                 20,
                                          //                               ),
                                          //                           color: Color(
                                          //                             0xFFFFFFFF,
                                          //                           ),
                                          //                         ),
                                          //                         child: TextWidget(
                                          //                           text:
                                          //                               "Update Client Location",
                                          //                           fontSize:
                                          //                               15.5,
                                          //                           textColor:
                                          //                               ColorUtils
                                          //                                   .secondary,
                                          //                           fontWeight:
                                          //                               FontWeight
                                          //                                   .w700,
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //         copyToClipBoardOnTap: () {
                                          //           Navigator.pop(context);
                                          //           ContactActionUtils.copyToClipboard(
                                          //             context,
                                          //             item,
                                          //           );
                                          //         },
                                          //         callOnTap: () {
                                          //           Navigator.pop(context);
                                          //           ContactActionUtils.makePhoneCall(
                                          //             item.phone,
                                          //           );
                                          //         },
                                          //         shareOnTap: () {},
                                          //         smsOnTap: () {
                                          //           Navigator.pop(context);
                                          //           ContactActionUtils.sendSMS(
                                          //             item.phone,
                                          //           );
                                          //         },
                                          //         emailOnTap: () {
                                          //           Navigator.pop(context);
                                          //           ContactActionUtils.sendEmail(
                                          //             item.email,
                                          //           );
                                          //         },
                                          //       );
                                          //     },
                                          //   );
                                          // },
                                          child: Image.asset(
                                            ImagesUtils.more,
                                            height: 20,
                                            color: Color(0xff341f97),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (favouriteIndexes.contains(
                                                index,
                                              )) {
                                                favouriteIndexes.remove(index);
                                              } else {
                                                favouriteIndexes.add(index);
                                              }
                                            });
                                          },
                                          child: Image.asset(
                                            favouriteIndexes.contains(index)
                                                ? ImagesUtils.starWithColorIcon
                                                : ImagesUtils.starWithoutColorIcon,
                                            height: 20,
                                            color: ColorUtils.orange,
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
  Widget _tabItem({required LeadTab tab, required String icon}) {
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
