import 'dart:ui';

import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/activities_lead/activities_new_task.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_attachments/project_working_attachments.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_auto_loged_mail/project_working_auto_loged_mail.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_customerDetailsView.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_log_followups.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_note/project_working_note.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_verification.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/project_working_with_details/project_working_with_details.dart';
import 'package:flexibiz/screens/dashboard/dashboard/projects/project_working/selection_criteria_dialog.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProjectWorking extends StatefulWidget {
  const ProjectWorking({super.key});

  @override
  State<ProjectWorking> createState() => _ProjectWorkingState();
}

class _ProjectWorkingState extends State<ProjectWorking> {

  bool isSearchShow = false;
  bool isLeadNearAboutContentExpanded = false;
  bool isDefaultRadiusChecked = false;
  double sliderValue = 5;

  final List<ProjectWorkingListModel> leadActivityList = [
    ProjectWorkingListModel(
      project: "Green Valley Residency",
      address: "Flat No 302, Block A",
      location: "Sector 62, Noida",
      landmark: "Near Fortis Hospital",
      contact: "Rohit Sharma",
      phone: "+91 9876543210",
      remarks: "Client interested, site visit planned",
      customer: 'Test Sagar Kr',
    ),
    ProjectWorkingListModel(
      project: "Skyline Towers",
      address: "Plot 21, Tower B",
      location: "Indirapuram, Ghaziabad",
      landmark: "Opposite Shipra Mall",
      contact: "Anjali Verma",
      phone: "+91 9123456789",
      remarks: "Follow-up required next week",
      customer: 'Test Ravi Kr',
    ),
    ProjectWorkingListModel(
      project: "Palm Heights",
      address: "Villa No 12",
      location: "Greater Noida West",
      landmark: "Near DPS School",
      contact: "Amit Singh",
      phone: "+91 9988776655",
      remarks: "Budget discussion pending",
      customer: 'Test Bablu Chauhan',
    ),
    ProjectWorkingListModel(
      project: "Elite Enclave",
      address: "Office 405, 4th Floor",
      location: "Connaught Place, Delhi",
      landmark: "Near Rajiv Chowk Metro",
      contact: "Neha Kapoor",
      phone: "+91 9012345678",
      remarks: "High priority lead",
      customer: 'Test Rahul',
    ),
    ProjectWorkingListModel(
      project: "Riverfront Homes",
      address: "House No 78",
      location: "Yamuna Expressway",
      landmark: "Near Toll Plaza",
      contact: "Suresh Kumar",
      phone: "+91 8899001122",
      remarks: "Awaiting documents",
      customer: 'Test vicky',
    ),
    ProjectWorkingListModel(
      project: "Urban Nest",
      address: "Flat 1102, Tower C",
      location: "Dwarka Sector 18",
      landmark: "Near Metro Station",
      contact: "Pooja Malhotra",
      phone: "+91 7766554433",
      remarks: "Meeting rescheduled",
      customer: 'Test suraj',
    ),
    ProjectWorkingListModel(
      project: "Silver Oak Villas",
      address: "Villa 9",
      location: "Manesar, Gurgaon",
      landmark: "Near NH-48",
      contact: "Rahul Mehta",
      phone: "+91 9988112233",
      remarks: "Ready to close deal",
      customer: 'Test vikrant',
    ),
    ProjectWorkingListModel(
      project: "City Square",
      address: "Shop 15, Ground Floor",
      location: "Lajpat Nagar, Delhi",
      landmark: "Central Market",
      contact: "Karan Arora",
      phone: "+91 8877665544",
      remarks: "Commercial requirement",
      customer: 'Test chaavi',
    ),
    ProjectWorkingListModel(
      project: "Blue Pearl Apartments",
      address: "Flat 506",
      location: "Vaishali, Ghaziabad",
      landmark: "Near Max Hospital",
      contact: "Sunita Jain",
      phone: "+91 9090909090",
      remarks: "Family visit planned",
      customer: 'Test susant',
    ),
    ProjectWorkingListModel(
      project: "Harmony Homes",
      address: "Row House 4",
      location: "Sohna Road, Gurgaon",
      landmark: "Near Golf Course",
      contact: "Deepak Yadav",
      phone: "+91 9811223344",
      remarks: "Negotiation in progress",
      customer: 'Test sandeep',
    ),
  ];

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

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController selectionCriteriaNameCtr = TextEditingController();

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            datePickerTheme: DatePickerThemeData(
              backgroundColor: Colors.white,
              yearStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black,
                ),
              ),
              /// Dialog radius
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              /// Top header
              headerBackgroundColor: ColorUtils.primary,
              headerForegroundColor: Colors.white,

              /// Hide edit icon
              headerHelpStyle:GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black,
                ),
              ),

              ///  Show ONLY YEAR
              headerHeadlineStyle:  GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: ColorUtils.black,
                ),
              ),

              /// Month-Year row background
              dividerColor: Colors.transparent,

              dayStyle:  GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: ColorUtils.black,
                ),
              ),

              /// Normal day background
              dayBackgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (states.contains(MaterialState.selected)) {
                    return ColorUtils.primary;
                  }
                  return Colors.white;
                },
              ),

              /// Day text color
              dayForegroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return ColorUtils.black;
                },
              ),
              weekdayStyle: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize:15,
                  fontWeight: FontWeight.w600,
                  color: ColorUtils.black.withOpacity(0.8),
                ),
              ),

              cancelButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  ColorUtils.grey,
                ),
              ),

              confirmButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  ColorUtils.primary,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorUtils.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),

            timePickerTheme: TimePickerThemeData(
              backgroundColor: Colors.white,

              /// Dialog radius
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              /// Header (time text)
              hourMinuteTextStyle: GoogleFonts.montserrat(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: ColorUtils.white,
              ),
              hourMinuteColor: ColorUtils.primary,


              /// AM / PM style
              dayPeriodTextStyle: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              dayPeriodColor: ColorUtils.primary.withOpacity(0.15),

              /// Dial
              dialHandColor: ColorUtils.primary,
              dialBackgroundColor: ColorUtils.primary.withOpacity(0.08),
              dialTextColor: ColorUtils.black,
              entryModeIconColor: ColorUtils.primary,
              dialTextStyle:  GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorUtils.black,
              ),

              /// Buttons
              cancelButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  ColorUtils.grey,
                ),
              ),

              confirmButtonStyle: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(
                  ColorUtils.primary,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "WORKING PROJECT".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: Container(
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: leadActivityList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = leadActivityList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorUtils.white,
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: const Color(0xFFEAECF0)),
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: const Color(
                            //       0xFF43474D,
                            //     ).withOpacity(0.06),
                            //     blurRadius: 60,
                            //     offset: const Offset(0, 12),
                            //   ),
                            // ],
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
                                        child: const ProjectWorkingWithDetails(),
                                        type: PageTransitionType.fade,
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        LabelValueWidget(
                                          label: "project",
                                          value: item.project,
                                        ),
                                        LabelValueWidget(
                                          label: "address",
                                          value: item.address,
                                        ),
                                        LabelValueWidget(
                                          label: "location",
                                          value: item.location,
                                        ),
                                        LabelValueWidget(
                                          label: "landmark",
                                          value: item.landmark,
                                        ),
                                        LabelValueWidget(
                                          label: "customer",
                                          value: item.customer,
                                        ),
                                        LabelValueWidget(
                                          label: "contact",
                                          value: item.contact,
                                        ),
                                        LabelValueWidget(
                                          label: "Phone",
                                          value: item.phone,
                                          labelColor: ColorUtils.secondary,
                                          textDecoration: TextDecoration.underline,
                                          labelOnTap: (){
                                            Navigator.pop(context);
                                            ContactActionUtils.makePhoneCall(
                                              item.phone,
                                            );
                                          },
                                        ),
                                        LabelValueWidget(
                                          label: "remarks",
                                          value: item.remarks,
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
                                                                  const SizedBox(width: 10),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      TextWidget(
                                                                        text: "2nd Project Name Full Name",
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.w600,
                                                                        textColor: const Color(0xFF1D2939),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                iconImage: ImagesUtils.editIcon,
                                                                                title: "Check In",
                                                                                onTap: ()  {
                                                                                  //Navigator.pop(bottomSheetContext);
                                                                                  showDialog(
                                                                                    barrierColor: Colors.transparent,
                                                                                    context: context,
                                                                                    builder: (_) => Dialog(
                                                                                      backgroundColor: Colors.transparent,
                                                                                      insetPadding:
                                                                                      const EdgeInsets.symmetric(
                                                                                        horizontal: 10,
                                                                                      ),
                                                                                      child: SizedBox(
                                                                                        height: 100,
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
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: ButtonWidget(
                                                                                                          navigateTo: () {
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
                                                                                                                              "Your Location is ${selectedLocation ?? "Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking" }" ,
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
                                                                                                                                            height: 340,
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
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                children: [
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Dear SUPER",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.red,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 15,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "With Your Location at",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.black,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
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
                                                                                                                            "Attendance In",
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
                                                                                                          buttonName: 'Auto',
                                                                                                          borderRadius: 10,
                                                                                                          height: 35,
                                                                                                          width: screenWidth(
                                                                                                            context,
                                                                                                          ),
                                                                                                          buttonTextColor: ColorUtils.white,
                                                                                                          buttonColor: ColorUtils.primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                      HorizontalSpace(width: 10),
                                                                                                      Expanded(
                                                                                                        child: ButtonWidget(
                                                                                                          navigateTo: () {
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

                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                /// ================= DATE =================
                                                                                                                                Expanded(
                                                                                                                                  child: Column(
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      TextWidget(
                                                                                                                                        text: 'Date',
                                                                                                                                        fontSize: 15,
                                                                                                                                        textColor: ColorUtils.primary,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                      const SizedBox(height: 5),
                                                                                                                                      InkWell(
                                                                                                                                        // onTap: () => pickStyledDate(context),
                                                                                                                                        onTap: () => pickDate(context),
                                                                                                                                        child: Container(
                                                                                                                                          width: double.infinity,
                                                                                                                                          padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
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
                                                                                                                                          child: Row(
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Image(image: AssetImage(ImagesUtils.dateIcon),height: 24,color: ColorUtils.secondary,),
                                                                                                                                              HorizontalSpace(width: 15),
                                                                                                                                              TextWidget(
                                                                                                                                                text: selectedDate == null
                                                                                                                                                    ? 'Select Date'
                                                                                                                                                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                                                                                                                                fontSize: 14,
                                                                                                                                                textColor: ColorUtils.black.withOpacity(0.7),
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),

                                                                                                                                const SizedBox(width: 10),

                                                                                                                                /// ================= TIME =================
                                                                                                                                Expanded(
                                                                                                                                  child: Column(
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      TextWidget(
                                                                                                                                        text: 'Time',
                                                                                                                                        fontSize: 15,
                                                                                                                                        textColor: ColorUtils.primary,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                      const SizedBox(height: 5),
                                                                                                                                      InkWell(
                                                                                                                                        onTap: () => pickTime(context),
                                                                                                                                        child: Container(
                                                                                                                                          width: double.infinity,
                                                                                                                                          padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
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
                                                                                                                                          child: Row(
                                                                                                                                            children: [
                                                                                                                                              Image(image: AssetImage(ImagesUtils.timeIcon),height: 24,color: ColorUtils.secondary,),
                                                                                                                                              HorizontalSpace(width: 15),
                                                                                                                                              TextWidget(
                                                                                                                                                text: selectedTime == null
                                                                                                                                                    ? 'Select Time'
                                                                                                                                                    : selectedTime!.format(context),
                                                                                                                                                fontSize: 14,
                                                                                                                                                textColor: ColorUtils.black.withOpacity(0.7),
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
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
                                                                                                                                            height: 340,
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
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                children: [
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Dear SUPER",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.red,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 15,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "With Your Location at",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.black,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
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
                                                                                                                                    "Check In",
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
                                                                                                                            "Check In",
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
                                                                                                          buttonName: 'Manual',
                                                                                                          borderRadius: 10,
                                                                                                          height: 35,
                                                                                                          width: screenWidth(
                                                                                                            context,
                                                                                                          ),
                                                                                                          buttonTextColor: ColorUtils.white,
                                                                                                          buttonColor: ColorUtils.primary,
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
                                                                                                  "Check In",
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
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                iconImage: ImagesUtils.editIcon,
                                                                                title: "Check Out",
                                                                                onTap: () {
                                                                                  showDialog(
                                                                                    context: context,
                                                                                    builder: (_) => Dialog(
                                                                                      backgroundColor: Colors.transparent,
                                                                                      insetPadding:
                                                                                      const EdgeInsets.symmetric(
                                                                                        horizontal: 20,
                                                                                      ),
                                                                                      child: SizedBox(
                                                                                        height: 100,
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
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: ButtonWidget(
                                                                                                          navigateTo: () {
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
                                                                                                                              "Your Location is ${selectedLocation ?? "Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking" }" ,
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
                                                                                                                                            height: 340,
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
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                children: [
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Dear SUPER",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.red,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 15,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "With Your Location at",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.black,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
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
                                                                                                                            "Attendance In",
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
                                                                                                          buttonName: 'Auto',
                                                                                                          borderRadius: 10,
                                                                                                          height: 35,
                                                                                                          width: screenWidth(
                                                                                                            context,
                                                                                                          ),
                                                                                                          buttonTextColor: ColorUtils.white,
                                                                                                          buttonColor: ColorUtils.primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                      HorizontalSpace(width: 10),
                                                                                                      Expanded(
                                                                                                        child: ButtonWidget(
                                                                                                          navigateTo: () {
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

                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                /// ================= DATE =================
                                                                                                                                Expanded(
                                                                                                                                  child: Column(
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      TextWidget(
                                                                                                                                        text: 'Date',
                                                                                                                                        fontSize: 15,
                                                                                                                                        textColor: ColorUtils.primary,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                      const SizedBox(height: 5),
                                                                                                                                      InkWell(
                                                                                                                                        // onTap: () => pickStyledDate(context),
                                                                                                                                        onTap: () => pickDate(context),
                                                                                                                                        child: Container(
                                                                                                                                          width: double.infinity,
                                                                                                                                          padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
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
                                                                                                                                          child: Row(
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Image(image: AssetImage(ImagesUtils.dateIcon),height: 24,color: ColorUtils.secondary,),
                                                                                                                                              HorizontalSpace(width: 15),
                                                                                                                                              TextWidget(
                                                                                                                                                text: selectedDate == null
                                                                                                                                                    ? 'Select Date'
                                                                                                                                                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                                                                                                                                fontSize: 14,
                                                                                                                                                textColor: ColorUtils.black.withOpacity(0.7),
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),

                                                                                                                                const SizedBox(width: 10),

                                                                                                                                /// ================= TIME =================
                                                                                                                                Expanded(
                                                                                                                                  child: Column(
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      TextWidget(
                                                                                                                                        text: 'Time',
                                                                                                                                        fontSize: 15,
                                                                                                                                        textColor: ColorUtils.primary,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                      const SizedBox(height: 5),
                                                                                                                                      InkWell(
                                                                                                                                        onTap: () => pickTime(context),
                                                                                                                                        child: Container(
                                                                                                                                          width: double.infinity,
                                                                                                                                          padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
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
                                                                                                                                          child: Row(
                                                                                                                                            children: [
                                                                                                                                              Image(image: AssetImage(ImagesUtils.timeIcon),height: 24,color: ColorUtils.secondary,),
                                                                                                                                              HorizontalSpace(width: 15),
                                                                                                                                              TextWidget(
                                                                                                                                                text: selectedTime == null
                                                                                                                                                    ? 'Select Time'
                                                                                                                                                    : selectedTime!.format(context),
                                                                                                                                                fontSize: 14,
                                                                                                                                                textColor: ColorUtils.black.withOpacity(0.7),
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
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
                                                                                                                                            height: 340,
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
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                children: [
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Dear SUPER",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.red,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 15,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "With Your Location at",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.black,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
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
                                                                                                                                    "Check In",
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
                                                                                                                            "Check In",
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
                                                                                                          buttonName: 'Manual',
                                                                                                          borderRadius: 10,
                                                                                                          height: 35,
                                                                                                          width: screenWidth(
                                                                                                            context,
                                                                                                          ),
                                                                                                          buttonTextColor: ColorUtils.white,
                                                                                                          buttonColor: ColorUtils.primary,
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
                                                                                                  "Check In",
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
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                iconImage: ImagesUtils.deleteIcon,
                                                                                title: "Delete Today Timing",
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
                                                                                        height: 100,
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
                                                                                                  Row(
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: ButtonWidget(
                                                                                                          navigateTo: () {
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
                                                                                                                              text:"Are you sure you want to delete your attandence?",
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
                                                                                                                                        builder: (_,) => Dialog(
                                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                                          insetPadding: const EdgeInsets.symmetric(
                                                                                                                                            horizontal: 20,
                                                                                                                                          ),
                                                                                                                                          child: SizedBox(
                                                                                                                                            height: 200,
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
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                children: [
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Check Out Deleted successfully for today.",
                                                                                                                                                    fontSize: 16,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "You can mark Project Check In/Out again...",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.black,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
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
                                                                                                                            "Delete Attendance Out?",
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
                                                                                                          buttonName: 'Out',
                                                                                                          borderRadius: 10,
                                                                                                          height: 35,
                                                                                                          width: screenWidth(
                                                                                                            context,
                                                                                                          ),
                                                                                                          buttonTextColor: ColorUtils.white,
                                                                                                          buttonColor: ColorUtils.primary,
                                                                                                        ),
                                                                                                      ),
                                                                                                      HorizontalSpace(width: 10),
                                                                                                      Expanded(
                                                                                                        child: ButtonWidget(
                                                                                                          navigateTo: () {
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

                                                                                                                            Row(
                                                                                                                              children: [
                                                                                                                                /// ================= DATE =================
                                                                                                                                Expanded(
                                                                                                                                  child: Column(
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      TextWidget(
                                                                                                                                        text: 'Date',
                                                                                                                                        fontSize: 15,
                                                                                                                                        textColor: ColorUtils.primary,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                      const SizedBox(height: 5),
                                                                                                                                      InkWell(
                                                                                                                                        // onTap: () => pickStyledDate(context),
                                                                                                                                        onTap: () => pickDate(context),
                                                                                                                                        child: Container(
                                                                                                                                          width: double.infinity,
                                                                                                                                          padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
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
                                                                                                                                          child: Row(
                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                            children: [
                                                                                                                                              Image(image: AssetImage(ImagesUtils.dateIcon),height: 24,color: ColorUtils.secondary,),
                                                                                                                                              HorizontalSpace(width: 15),
                                                                                                                                              TextWidget(
                                                                                                                                                text: selectedDate == null
                                                                                                                                                    ? 'Select Date'
                                                                                                                                                    : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                                                                                                                                fontSize: 14,
                                                                                                                                                textColor: ColorUtils.black.withOpacity(0.7),
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),

                                                                                                                                const SizedBox(width: 10),

                                                                                                                                /// ================= TIME =================
                                                                                                                                Expanded(
                                                                                                                                  child: Column(
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      TextWidget(
                                                                                                                                        text: 'Time',
                                                                                                                                        fontSize: 15,
                                                                                                                                        textColor: ColorUtils.primary,
                                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                                      ),
                                                                                                                                      const SizedBox(height: 5),
                                                                                                                                      InkWell(
                                                                                                                                        onTap: () => pickTime(context),
                                                                                                                                        child: Container(
                                                                                                                                          width: double.infinity,
                                                                                                                                          padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
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
                                                                                                                                          child: Row(
                                                                                                                                            children: [
                                                                                                                                              Image(image: AssetImage(ImagesUtils.timeIcon),height: 24,color: ColorUtils.secondary,),
                                                                                                                                              HorizontalSpace(width: 15),
                                                                                                                                              TextWidget(
                                                                                                                                                text: selectedTime == null
                                                                                                                                                    ? 'Select Time'
                                                                                                                                                    : selectedTime!.format(context),
                                                                                                                                                fontSize: 14,
                                                                                                                                                textColor: ColorUtils.black.withOpacity(0.7),
                                                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ],
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
                                                                                                                                            height: 340,
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
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                                children: [
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Dear SUPER",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.red,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 15,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "With Your Location at",
                                                                                                                                                    fontSize: 15,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor: const Color(
                                                                                                                                                      0xff1F1F1F,
                                                                                                                                                    ),
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
                                                                                                                                                  ),
                                                                                                                                                  TextWidget(
                                                                                                                                                    text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                                                                                                                                    fontSize: 14,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    textColor:ColorUtils.black,
                                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                                  ),
                                                                                                                                                  const VerticalSpace(
                                                                                                                                                    height: 20,
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
                                                                                                                                    "Check In",
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
                                                                                                                            "Check In",
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
                                                                                                          buttonName: 'Both',
                                                                                                          borderRadius: 10,
                                                                                                          height: 35,
                                                                                                          width: screenWidth(
                                                                                                            context,
                                                                                                          ),
                                                                                                          buttonTextColor: ColorUtils.white,
                                                                                                          buttonColor: ColorUtils.primary,
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
                                                                                                  "Delete Attendance?",
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
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(height: 10),
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                title: "Update Project Location",
                                                                                iconImage: ImagesUtils.locationMarkIcon,
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
                                                                                                  "Update Project Location",
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
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Update Project Landmark",
                                                                                iconImage: ImagesUtils.locationMarkIcon,
                                                                                onTap: () {

                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Customer Detail View",
                                                                                iconImage: ImagesUtils.commonFileIcon,
                                                                                onTap: () {
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ProjectWorkingCustomerDetailsView(),
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
                                                                                title: "Log Follow Up",
                                                                                iconImage: ImagesUtils.starWithColorIcon,
                                                                                onTap: () {
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ProjectWorkingLogFollowups(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "New Task",
                                                                                iconImage: ImagesUtils.newTaskIcon,
                                                                                onTap: () {
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ActivitiesNewTask(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );

                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Attachments",
                                                                                iconImage: ImagesUtils.attachmentsIcon,
                                                                                onTap: (){
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ProjectWorkingAttachments(),
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
                                                                                title: "Verification",
                                                                                iconImage: ImagesUtils.verificationIcon,
                                                                                onTap: () {
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ProjectWorkingVerification(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Auto Logged Mail",
                                                                                iconImage: ImagesUtils.emailIcon,
                                                                                onTap: () {
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ProjectWorkingAutoLogedMail(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );

                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Notes",
                                                                                iconImage: ImagesUtils.noteIcon,
                                                                                onTap: () {
                                                                                  ScreenNavigationUtils.push(
                                                                                    context,
                                                                                    child: const ProjectWorkingNote(),
                                                                                    type: PageTransitionType.fade,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),

                                                                    /// PAGE 3
                                                                    SingleChildScrollView(
                                                                      padding: const EdgeInsets.only(right: 10),
                                                                      child: Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                title: "Copy to Clipboard",
                                                                                iconImage: ImagesUtils.clipboardIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                  ContactActionUtils.copyToClipboard(
                                                                                    context,
                                                                                    item,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Call",
                                                                                iconImage: ImagesUtils.mobileNoIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                  ContactActionUtils.makePhoneCall(
                                                                                    item.phone,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "Share",
                                                                                iconImage: ImagesUtils.shareIcon,
                                                                                onTap: () {

                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          const SizedBox(height: 10),
                                                                          Row(
                                                                            children: [
                                                                              BottomSheetActionTile(
                                                                                title: "Email",
                                                                                iconImage: ImagesUtils.emailIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                  ContactActionUtils.sendEmail(
                                                                                    "sagar123@gmail.com"
                                                                                  );
                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              BottomSheetActionTile(
                                                                                title: "SMS",
                                                                                iconImage: ImagesUtils.smsIcon,
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                  ContactActionUtils.sendSMS(
                                                                                    item.phone,
                                                                                  );
                                                                                },
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              Expanded(child: SizedBox())
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),

                                                            /// INDICATOR
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
                                          //     Colors.transparent,
                                          //     builder: (context) {
                                          //       return ProjectWorkingListThreeDotMBottomSheet(
                                          //         projectTitle: "2nd Project Name Full Name",
                                          //         checkInOnTap: () {
                                          //           showDialog(
                                          //             context: context,
                                          //             builder: (_) => Dialog(
                                          //               backgroundColor:
                                          //               Colors.transparent,
                                          //               insetPadding:
                                          //               const EdgeInsets.symmetric(
                                          //                 horizontal: 20,
                                          //               ),
                                          //               child: SizedBox(
                                          //                 height: 100,
                                          //                 child: Stack(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin:
                                          //                       EdgeInsets.only(
                                          //                         top: 17,
                                          //                       ),
                                          //                       padding:
                                          //                       const EdgeInsets.all(
                                          //                         16,
                                          //                       ),
                                          //                       decoration: BoxDecoration(
                                          //                         borderRadius:
                                          //                         BorderRadius.circular(
                                          //                           12,
                                          //                         ),
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
                                          //                         MainAxisSize
                                          //                             .min,
                                          //                         crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .start,
                                          //                         children: [
                                          //                           const VerticalSpace(
                                          //                             height:
                                          //                             10,
                                          //                           ),
                                          //                           Row(
                                          //                             children: [
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder: (_) => Dialog(
                                          //                                         backgroundColor:
                                          //                                         Colors.transparent,
                                          //                                         insetPadding:
                                          //                                         const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 325,
                                          //                                           child: Stack(
                                          //                                             children: [
                                          //                                               Container(
                                          //                                                 margin:
                                          //                                                 EdgeInsets.only(
                                          //                                                   top: 17,
                                          //                                                 ),
                                          //                                                 padding:
                                          //                                                 const EdgeInsets.all(
                                          //                                                   16,
                                          //                                                 ),
                                          //                                                 decoration: BoxDecoration(
                                          //                                                   borderRadius:
                                          //                                                   BorderRadius.circular(
                                          //                                                     12,
                                          //                                                   ),
                                          //                                                   gradient: LinearGradient(
                                          //                                                     begin: Alignment
                                          //                                                         .topCenter,
                                          //                                                     end: Alignment
                                          //                                                         .bottomCenter,
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
                                          //                                                   mainAxisSize:
                                          //                                                   MainAxisSize
                                          //                                                       .min,
                                          //                                                   crossAxisAlignment:
                                          //                                                   CrossAxisAlignment
                                          //                                                       .start,
                                          //                                                   children: [
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       10,
                                          //                                                     ),
                                          //                                                     TextWidget(
                                          //                                                       text:
                                          //                                                       "Your Location is ${selectedLocation ?? "Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking" }" ,
                                          //                                                       fontSize:
                                          //                                                       16,
                                          //                                                       textAlign:
                                          //                                                       TextAlign
                                          //                                                           .start,
                                          //                                                       textColor:
                                          //                                                       Color(
                                          //                                                         0xff1F1F1F,
                                          //                                                       ),
                                          //                                                       fontWeight:
                                          //                                                       FontWeight
                                          //                                                           .w500,
                                          //                                                     ),
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       14,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               Navigator.pop(
                                          //                                                                 context,
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Cancel',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder:
                                          //                                                                     (
                                          //                                                                     _,
                                          //                                                                     ) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 560,
                                          //                                                                     child: Stack(
                                          //                                                                       children: [
                                          //                                                                         Container(
                                          //                                                                           margin: EdgeInsets.only(
                                          //                                                                             top: 17,
                                          //                                                                           ),
                                          //                                                                           padding: const EdgeInsets.all(
                                          //                                                                             16,
                                          //                                                                           ),
                                          //                                                                           decoration: BoxDecoration(
                                          //                                                                             borderRadius: BorderRadius.circular(
                                          //                                                                               12,
                                          //                                                                             ),
                                          //                                                                             gradient: LinearGradient(
                                          //                                                                               begin: Alignment.topCenter,
                                          //                                                                               end: Alignment.bottomCenter,
                                          //                                                                               colors: [
                                          //                                                                                 Color(
                                          //                                                                                   0xFFFFFFFF,
                                          //                                                                                 ),
                                          //                                                                                 Color(
                                          //                                                                                   0xFFF8F8FF,
                                          //                                                                                 ),
                                          //                                                                               ],
                                          //                                                                               stops: [
                                          //                                                                                 0.0,
                                          //                                                                                 1.0,
                                          //                                                                               ],
                                          //                                                                             ),
                                          //                                                                           ),
                                          //                                                                           child: Column(
                                          //                                                                             mainAxisSize: MainAxisSize.min,
                                          //                                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                             children: [
                                          //                                                                               const VerticalSpace(
                                          //                                                                                 height: 10,
                                          //                                                                               ),
                                          //                                                                               SizedBox(
                                          //                                                                                 height: 450,
                                          //                                                                                 child: ListView.separated(
                                          //                                                                                   itemCount: locationList.length,
                                          //                                                                                   shrinkWrap: true,
                                          //                                                                                   separatorBuilder:
                                          //                                                                                       (
                                          //                                                                                       _,
                                          //                                                                                       __,
                                          //                                                                                       ) => const SizedBox(),
                                          //                                                                                   itemBuilder:
                                          //                                                                                       (
                                          //                                                                                       context,
                                          //                                                                                       index,
                                          //                                                                                       ) {
                                          //                                                                                     return GestureDetector(
                                          //                                                                                       onTap: () {
                                          //                                                                                         setState(
                                          //                                                                                               () {
                                          //                                                                                             selectedLocation = locationList[index];
                                          //                                                                                           },
                                          //                                                                                         );
                                          //                                                                                         Navigator.pop(
                                          //                                                                                           context,
                                          //                                                                                         );
                                          //                                                                                       },
                                          //
                                          //                                                                                       child: Padding(
                                          //                                                                                         padding: const EdgeInsets.symmetric(
                                          //                                                                                           vertical: 5,
                                          //                                                                                         ),
                                          //                                                                                         child: TextWidget(
                                          //                                                                                           text: locationList[index],
                                          //                                                                                           fontSize: 15,
                                          //                                                                                           textAlign: TextAlign.start,
                                          //                                                                                           textColor: const Color(
                                          //                                                                                             0xff1F1F1F,
                                          //                                                                                           ),
                                          //                                                                                           fontWeight: FontWeight.w500,
                                          //                                                                                         ),
                                          //                                                                                       ),
                                          //                                                                                     );
                                          //                                                                                   },
                                          //                                                                                 ),
                                          //                                                                               ),
                                          //                                                                               const VerticalSpace(
                                          //                                                                                 height: 14,
                                          //                                                                               ),
                                          //                                                                               ButtonWidget(
                                          //                                                                                 navigateTo: () {
                                          //                                                                                   Navigator.pop(
                                          //                                                                                     context,
                                          //                                                                                   );
                                          //                                                                                 },
                                          //                                                                                 buttonName: 'Dismiss',
                                          //                                                                                 borderRadius: 10,
                                          //                                                                                 height: 35,
                                          //                                                                                 width: screenWidth(
                                          //                                                                                   context,
                                          //                                                                                 ),
                                          //                                                                                 buttonTextColor: ColorUtils.white,
                                          //                                                                                 buttonColor: ColorUtils.primary,
                                          //                                                                               ),
                                          //                                                                             ],
                                          //                                                                           ),
                                          //                                                                         ),
                                          //                                                                         Align(
                                          //                                                                           alignment: Alignment.topCenter,
                                          //                                                                           child: Container(
                                          //                                                                             padding: EdgeInsets.only(
                                          //                                                                               left: 14,
                                          //                                                                               right: 14,
                                          //                                                                               top: 5,
                                          //                                                                               bottom: 7,
                                          //                                                                             ),
                                          //                                                                             decoration: BoxDecoration(
                                          //                                                                               borderRadius: BorderRadius.circular(
                                          //                                                                                 20,
                                          //                                                                               ),
                                          //                                                                               color: Color(
                                          //                                                                                 0xFFFFFFFF,
                                          //                                                                               ),
                                          //                                                                             ),
                                          //                                                                             child: TextWidget(
                                          //                                                                               text: "Are you in",
                                          //                                                                               fontSize: 15.5,
                                          //                                                                               textColor: ColorUtils.secondary,
                                          //                                                                               fontWeight: FontWeight.w700,
                                          //                                                                             ),
                                          //                                                                           ),
                                          //                                                                         ),
                                          //                                                                       ],
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Near By',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder:
                                          //                                                                     (
                                          //                                                                     _,
                                          //                                                                     ) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 340,
                                          //                                                                     child: Container(
                                          //                                                                       margin: EdgeInsets.only(
                                          //                                                                         top: 17,
                                          //                                                                       ),
                                          //                                                                       padding: const EdgeInsets.all(
                                          //                                                                         16,
                                          //                                                                       ),
                                          //                                                                       decoration: BoxDecoration(
                                          //                                                                         borderRadius: BorderRadius.circular(
                                          //                                                                           12,
                                          //                                                                         ),
                                          //                                                                         gradient: LinearGradient(
                                          //                                                                           begin: Alignment.topCenter,
                                          //                                                                           end: Alignment.bottomCenter,
                                          //                                                                           colors: [
                                          //                                                                             Color(
                                          //                                                                               0xFFFFFFFF,
                                          //                                                                             ),
                                          //                                                                             Color(
                                          //                                                                               0xFFF8F8FF,
                                          //                                                                             ),
                                          //                                                                           ],
                                          //                                                                           stops: [
                                          //                                                                             0.0,
                                          //                                                                             1.0,
                                          //                                                                           ],
                                          //                                                                         ),
                                          //                                                                       ),
                                          //                                                                       child: Column(
                                          //                                                                         mainAxisSize: MainAxisSize.min,
                                          //                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                                          //                                                                         children: [
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Dear SUPER",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.red,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 15,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "With Your Location at",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.black,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           ButtonWidget(
                                          //                                                                             navigateTo: () {
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                             },
                                          //                                                                             buttonName: 'OK',
                                          //                                                                             borderRadius: 10,
                                          //                                                                             height: 35,
                                          //                                                                             width: screenWidth(
                                          //                                                                               context,
                                          //                                                                             ),
                                          //                                                                             buttonTextColor: ColorUtils.white,
                                          //                                                                             buttonColor: ColorUtils.primary,
                                          //                                                                           ),
                                          //                                                                         ],
                                          //                                                                       ),
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Ok',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                               ),
                                          //                                               Align(
                                          //                                                 alignment:
                                          //                                                 Alignment
                                          //                                                     .topCenter,
                                          //                                                 child: Container(
                                          //                                                   padding:
                                          //                                                   EdgeInsets.only(
                                          //                                                     left:
                                          //                                                     14,
                                          //                                                     right:
                                          //                                                     14,
                                          //                                                     top: 5,
                                          //                                                     bottom:
                                          //                                                     7,
                                          //                                                   ),
                                          //                                                   decoration: BoxDecoration(
                                          //                                                     borderRadius:
                                          //                                                     BorderRadius.circular(
                                          //                                                       20,
                                          //                                                     ),
                                          //                                                     color: Color(
                                          //                                                       0xFFFFFFFF,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   child: TextWidget(
                                          //                                                     text:
                                          //                                                     "Attendance In",
                                          //                                                     fontSize:
                                          //                                                     15.5,
                                          //                                                     textColor:
                                          //                                                     ColorUtils
                                          //                                                         .secondary,
                                          //                                                     fontWeight:
                                          //                                                     FontWeight
                                          //                                                         .w700,
                                          //                                                   ),
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName: 'Auto',
                                          //                                   borderRadius: 10,
                                          //                                   height: 35,
                                          //                                   width: screenWidth(
                                          //                                     context,
                                          //                                   ),
                                          //                                   buttonTextColor: ColorUtils.white,
                                          //                                   buttonColor: ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                               HorizontalSpace(width: 10),
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder: (_) => Dialog(
                                          //                                         backgroundColor:
                                          //                                         Colors.transparent,
                                          //                                         insetPadding:
                                          //                                         const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 325,
                                          //                                           child: Stack(
                                          //                                             children: [
                                          //                                               Container(
                                          //                                                 margin:
                                          //                                                 EdgeInsets.only(
                                          //                                                   top: 17,
                                          //                                                 ),
                                          //                                                 padding:
                                          //                                                 const EdgeInsets.all(
                                          //                                                   16,
                                          //                                                 ),
                                          //                                                 decoration: BoxDecoration(
                                          //                                                   borderRadius:
                                          //                                                   BorderRadius.circular(
                                          //                                                     12,
                                          //                                                   ),
                                          //                                                   gradient: LinearGradient(
                                          //                                                     begin: Alignment
                                          //                                                         .topCenter,
                                          //                                                     end: Alignment
                                          //                                                         .bottomCenter,
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
                                          //                                                   mainAxisSize:
                                          //                                                   MainAxisSize
                                          //                                                       .min,
                                          //                                                   crossAxisAlignment:
                                          //                                                   CrossAxisAlignment
                                          //                                                       .start,
                                          //                                                   children: [
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       10,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         /// ================= DATE =================
                                          //                                                         Expanded(
                                          //                                                           child: Column(
                                          //                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                             children: [
                                          //                                                               TextWidget(
                                          //                                                                 text: 'Date',
                                          //                                                                 fontSize: 15,
                                          //                                                                 textColor: ColorUtils.primary,
                                          //                                                                 fontWeight: FontWeight.w500,
                                          //                                                               ),
                                          //                                                               const SizedBox(height: 5),
                                          //                                                               InkWell(
                                          //                                                                 // onTap: () => pickStyledDate(context),
                                          //                                                                 onTap: () => pickDate(context),
                                          //                                                                 child: Container(
                                          //                                                                   width: double.infinity,
                                          //                                                                   padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
                                          //                                                                   decoration:  BoxDecoration(
                                          //                                                                     borderRadius: BorderRadius.circular(11),
                                          //                                                                     color: ColorUtils.white,
                                          //                                                                     border: Border.all(
                                          //                                                                       color: const Color(0xFFEAECF0),
                                          //                                                                       width: 1,
                                          //                                                                     ),
                                          //                                                                     boxShadow: [
                                          //                                                                       BoxShadow(
                                          //                                                                         color: const Color(0xFF43474D).withOpacity(0.06),
                                          //                                                                         blurRadius: 60,
                                          //                                                                         offset: const Offset(0, 12),
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                   child: Row(
                                          //                                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                          //                                                                     children: [
                                          //                                                                       Image(image: AssetImage(ImagesUtils.dateIcon),height: 24,color: ColorUtils.secondary,),
                                          //                                                                       HorizontalSpace(width: 15),
                                          //                                                                       TextWidget(
                                          //                                                                         text: selectedDate == null
                                          //                                                                             ? 'Select Date'
                                          //                                                                             : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                          //                                                                         fontSize: 14,
                                          //                                                                         textColor: ColorUtils.black.withOpacity(0.7),
                                          //                                                                         fontWeight: FontWeight.w500,
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               ),
                                          //                                                             ],
                                          //                                                           ),
                                          //                                                         ),
                                          //
                                          //                                                         const SizedBox(width: 10),
                                          //
                                          //                                                         /// ================= TIME =================
                                          //                                                         Expanded(
                                          //                                                           child: Column(
                                          //                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                             children: [
                                          //                                                               TextWidget(
                                          //                                                                 text: 'Time',
                                          //                                                                 fontSize: 15,
                                          //                                                                 textColor: ColorUtils.primary,
                                          //                                                                 fontWeight: FontWeight.w500,
                                          //                                                               ),
                                          //                                                               const SizedBox(height: 5),
                                          //                                                               InkWell(
                                          //                                                                 onTap: () => pickTime(context),
                                          //                                                                 child: Container(
                                          //                                                                   width: double.infinity,
                                          //                                                                   padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
                                          //                                                                   decoration:  BoxDecoration(
                                          //                                                                     borderRadius: BorderRadius.circular(11),
                                          //                                                                     color: ColorUtils.white,
                                          //                                                                     border: Border.all(
                                          //                                                                       color: const Color(0xFFEAECF0),
                                          //                                                                       width: 1,
                                          //                                                                     ),
                                          //                                                                     boxShadow: [
                                          //                                                                       BoxShadow(
                                          //                                                                         color: const Color(0xFF43474D).withOpacity(0.06),
                                          //                                                                         blurRadius: 60,
                                          //                                                                         offset: const Offset(0, 12),
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                   child: Row(
                                          //                                                                     children: [
                                          //                                                                       Image(image: AssetImage(ImagesUtils.timeIcon),height: 24,color: ColorUtils.secondary,),
                                          //                                                                       HorizontalSpace(width: 15),
                                          //                                                                       TextWidget(
                                          //                                                                         text: selectedTime == null
                                          //                                                                             ? 'Select Time'
                                          //                                                                             : selectedTime!.format(context),
                                          //                                                                         fontSize: 14,
                                          //                                                                         textColor: ColorUtils.black.withOpacity(0.7),
                                          //                                                                         fontWeight: FontWeight.w500,
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               ),
                                          //                                                             ],
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       14,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               Navigator.pop(
                                          //                                                                 context,
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Cancel',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder:
                                          //                                                                     (
                                          //                                                                     _,
                                          //                                                                     ) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 340,
                                          //                                                                     child: Container(
                                          //                                                                       margin: EdgeInsets.only(
                                          //                                                                         top: 17,
                                          //                                                                       ),
                                          //                                                                       padding: const EdgeInsets.all(
                                          //                                                                         16,
                                          //                                                                       ),
                                          //                                                                       decoration: BoxDecoration(
                                          //                                                                         borderRadius: BorderRadius.circular(
                                          //                                                                           12,
                                          //                                                                         ),
                                          //                                                                         gradient: LinearGradient(
                                          //                                                                           begin: Alignment.topCenter,
                                          //                                                                           end: Alignment.bottomCenter,
                                          //                                                                           colors: [
                                          //                                                                             Color(
                                          //                                                                               0xFFFFFFFF,
                                          //                                                                             ),
                                          //                                                                             Color(
                                          //                                                                               0xFFF8F8FF,
                                          //                                                                             ),
                                          //                                                                           ],
                                          //                                                                           stops: [
                                          //                                                                             0.0,
                                          //                                                                             1.0,
                                          //                                                                           ],
                                          //                                                                         ),
                                          //                                                                       ),
                                          //                                                                       child: Column(
                                          //                                                                         mainAxisSize: MainAxisSize.min,
                                          //                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                                          //                                                                         children: [
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Dear SUPER",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.red,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 15,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "With Your Location at",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.black,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           ButtonWidget(
                                          //                                                                             navigateTo: () {
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                             },
                                          //                                                                             buttonName: 'OK',
                                          //                                                                             borderRadius: 10,
                                          //                                                                             height: 35,
                                          //                                                                             width: screenWidth(
                                          //                                                                               context,
                                          //                                                                             ),
                                          //                                                                             buttonTextColor: ColorUtils.white,
                                          //                                                                             buttonColor: ColorUtils.primary,
                                          //                                                                           ),
                                          //                                                                         ],
                                          //                                                                       ),
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             "Check In",
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                               ),
                                          //                                               Align(
                                          //                                                 alignment:
                                          //                                                 Alignment
                                          //                                                     .topCenter,
                                          //                                                 child: Container(
                                          //                                                   padding:
                                          //                                                   EdgeInsets.only(
                                          //                                                     left:
                                          //                                                     14,
                                          //                                                     right:
                                          //                                                     14,
                                          //                                                     top: 5,
                                          //                                                     bottom:
                                          //                                                     7,
                                          //                                                   ),
                                          //                                                   decoration: BoxDecoration(
                                          //                                                     borderRadius:
                                          //                                                     BorderRadius.circular(
                                          //                                                       20,
                                          //                                                     ),
                                          //                                                     color: Color(
                                          //                                                       0xFFFFFFFF,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   child: TextWidget(
                                          //                                                     text:
                                          //                                                     "Check In",
                                          //                                                     fontSize:
                                          //                                                     15.5,
                                          //                                                     textColor:
                                          //                                                     ColorUtils
                                          //                                                         .secondary,
                                          //                                                     fontWeight:
                                          //                                                     FontWeight
                                          //                                                         .w700,
                                          //                                                   ),
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName: 'Manual',
                                          //                                   borderRadius: 10,
                                          //                                   height: 35,
                                          //                                   width: screenWidth(
                                          //                                     context,
                                          //                                   ),
                                          //                                   buttonTextColor: ColorUtils.white,
                                          //                                   buttonColor: ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                             ],
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ),
                                          //                     Align(
                                          //                       alignment:
                                          //                       Alignment
                                          //                           .topCenter,
                                          //                       child: Container(
                                          //                         padding:
                                          //                         EdgeInsets.only(
                                          //                           left:
                                          //                           14,
                                          //                           right:
                                          //                           14,
                                          //                           top: 5,
                                          //                           bottom:
                                          //                           7,
                                          //                         ),
                                          //                         decoration: BoxDecoration(
                                          //                           borderRadius:
                                          //                           BorderRadius.circular(
                                          //                             20,
                                          //                           ),
                                          //                           color: Color(
                                          //                             0xFFFFFFFF,
                                          //                           ),
                                          //                         ),
                                          //                         child: TextWidget(
                                          //                           text:
                                          //                           "Check In",
                                          //                           fontSize:
                                          //                           15.5,
                                          //                           textColor:
                                          //                           ColorUtils
                                          //                               .secondary,
                                          //                           fontWeight:
                                          //                           FontWeight
                                          //                               .w700,
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //         checkOutOnTap: (){
                                          //           showDialog(
                                          //             context: context,
                                          //             builder: (_) => Dialog(
                                          //               backgroundColor:
                                          //               Colors.transparent,
                                          //               insetPadding:
                                          //               const EdgeInsets.symmetric(
                                          //                 horizontal: 20,
                                          //               ),
                                          //               child: SizedBox(
                                          //                 height: 100,
                                          //                 child: Stack(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin:
                                          //                       EdgeInsets.only(
                                          //                         top: 17,
                                          //                       ),
                                          //                       padding:
                                          //                       const EdgeInsets.all(
                                          //                         16,
                                          //                       ),
                                          //                       decoration: BoxDecoration(
                                          //                         borderRadius:
                                          //                         BorderRadius.circular(
                                          //                           12,
                                          //                         ),
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
                                          //                         MainAxisSize
                                          //                             .min,
                                          //                         crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .start,
                                          //                         children: [
                                          //                           const VerticalSpace(
                                          //                             height:
                                          //                             10,
                                          //                           ),
                                          //                           Row(
                                          //                             children: [
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder: (_) => Dialog(
                                          //                                         backgroundColor:
                                          //                                         Colors.transparent,
                                          //                                         insetPadding:
                                          //                                         const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 325,
                                          //                                           child: Stack(
                                          //                                             children: [
                                          //                                               Container(
                                          //                                                 margin:
                                          //                                                 EdgeInsets.only(
                                          //                                                   top: 17,
                                          //                                                 ),
                                          //                                                 padding:
                                          //                                                 const EdgeInsets.all(
                                          //                                                   16,
                                          //                                                 ),
                                          //                                                 decoration: BoxDecoration(
                                          //                                                   borderRadius:
                                          //                                                   BorderRadius.circular(
                                          //                                                     12,
                                          //                                                   ),
                                          //                                                   gradient: LinearGradient(
                                          //                                                     begin: Alignment
                                          //                                                         .topCenter,
                                          //                                                     end: Alignment
                                          //                                                         .bottomCenter,
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
                                          //                                                   mainAxisSize:
                                          //                                                   MainAxisSize
                                          //                                                       .min,
                                          //                                                   crossAxisAlignment:
                                          //                                                   CrossAxisAlignment
                                          //                                                       .start,
                                          //                                                   children: [
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       10,
                                          //                                                     ),
                                          //                                                     TextWidget(
                                          //                                                       text:
                                          //                                                       "Your Location is ${selectedLocation ?? "Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking" }" ,
                                          //                                                       fontSize:
                                          //                                                       16,
                                          //                                                       textAlign:
                                          //                                                       TextAlign
                                          //                                                           .start,
                                          //                                                       textColor:
                                          //                                                       Color(
                                          //                                                         0xff1F1F1F,
                                          //                                                       ),
                                          //                                                       fontWeight:
                                          //                                                       FontWeight
                                          //                                                           .w500,
                                          //                                                     ),
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       14,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               Navigator.pop(
                                          //                                                                 context,
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Cancel',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder:
                                          //                                                                     (
                                          //                                                                     _,
                                          //                                                                     ) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 560,
                                          //                                                                     child: Stack(
                                          //                                                                       children: [
                                          //                                                                         Container(
                                          //                                                                           margin: EdgeInsets.only(
                                          //                                                                             top: 17,
                                          //                                                                           ),
                                          //                                                                           padding: const EdgeInsets.all(
                                          //                                                                             16,
                                          //                                                                           ),
                                          //                                                                           decoration: BoxDecoration(
                                          //                                                                             borderRadius: BorderRadius.circular(
                                          //                                                                               12,
                                          //                                                                             ),
                                          //                                                                             gradient: LinearGradient(
                                          //                                                                               begin: Alignment.topCenter,
                                          //                                                                               end: Alignment.bottomCenter,
                                          //                                                                               colors: [
                                          //                                                                                 Color(
                                          //                                                                                   0xFFFFFFFF,
                                          //                                                                                 ),
                                          //                                                                                 Color(
                                          //                                                                                   0xFFF8F8FF,
                                          //                                                                                 ),
                                          //                                                                               ],
                                          //                                                                               stops: [
                                          //                                                                                 0.0,
                                          //                                                                                 1.0,
                                          //                                                                               ],
                                          //                                                                             ),
                                          //                                                                           ),
                                          //                                                                           child: Column(
                                          //                                                                             mainAxisSize: MainAxisSize.min,
                                          //                                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                             children: [
                                          //                                                                               const VerticalSpace(
                                          //                                                                                 height: 10,
                                          //                                                                               ),
                                          //                                                                               SizedBox(
                                          //                                                                                 height: 450,
                                          //                                                                                 child: ListView.separated(
                                          //                                                                                   itemCount: locationList.length,
                                          //                                                                                   shrinkWrap: true,
                                          //                                                                                   separatorBuilder:
                                          //                                                                                       (
                                          //                                                                                       _,
                                          //                                                                                       __,
                                          //                                                                                       ) => const SizedBox(),
                                          //                                                                                   itemBuilder:
                                          //                                                                                       (
                                          //                                                                                       context,
                                          //                                                                                       index,
                                          //                                                                                       ) {
                                          //                                                                                     return GestureDetector(
                                          //                                                                                       onTap: () {
                                          //                                                                                         setState(
                                          //                                                                                               () {
                                          //                                                                                             selectedLocation = locationList[index];
                                          //                                                                                           },
                                          //                                                                                         );
                                          //                                                                                         Navigator.pop(
                                          //                                                                                           context,
                                          //                                                                                         );
                                          //                                                                                       },
                                          //
                                          //                                                                                       child: Padding(
                                          //                                                                                         padding: const EdgeInsets.symmetric(
                                          //                                                                                           vertical: 5,
                                          //                                                                                         ),
                                          //                                                                                         child: TextWidget(
                                          //                                                                                           text: locationList[index],
                                          //                                                                                           fontSize: 15,
                                          //                                                                                           textAlign: TextAlign.start,
                                          //                                                                                           textColor: const Color(
                                          //                                                                                             0xff1F1F1F,
                                          //                                                                                           ),
                                          //                                                                                           fontWeight: FontWeight.w500,
                                          //                                                                                         ),
                                          //                                                                                       ),
                                          //                                                                                     );
                                          //                                                                                   },
                                          //                                                                                 ),
                                          //                                                                               ),
                                          //                                                                               const VerticalSpace(
                                          //                                                                                 height: 14,
                                          //                                                                               ),
                                          //                                                                               ButtonWidget(
                                          //                                                                                 navigateTo: () {
                                          //                                                                                   Navigator.pop(
                                          //                                                                                     context,
                                          //                                                                                   );
                                          //                                                                                 },
                                          //                                                                                 buttonName: 'Dismiss',
                                          //                                                                                 borderRadius: 10,
                                          //                                                                                 height: 35,
                                          //                                                                                 width: screenWidth(
                                          //                                                                                   context,
                                          //                                                                                 ),
                                          //                                                                                 buttonTextColor: ColorUtils.white,
                                          //                                                                                 buttonColor: ColorUtils.primary,
                                          //                                                                               ),
                                          //                                                                             ],
                                          //                                                                           ),
                                          //                                                                         ),
                                          //                                                                         Align(
                                          //                                                                           alignment: Alignment.topCenter,
                                          //                                                                           child: Container(
                                          //                                                                             padding: EdgeInsets.only(
                                          //                                                                               left: 14,
                                          //                                                                               right: 14,
                                          //                                                                               top: 5,
                                          //                                                                               bottom: 7,
                                          //                                                                             ),
                                          //                                                                             decoration: BoxDecoration(
                                          //                                                                               borderRadius: BorderRadius.circular(
                                          //                                                                                 20,
                                          //                                                                               ),
                                          //                                                                               color: Color(
                                          //                                                                                 0xFFFFFFFF,
                                          //                                                                               ),
                                          //                                                                             ),
                                          //                                                                             child: TextWidget(
                                          //                                                                               text: "Are you in",
                                          //                                                                               fontSize: 15.5,
                                          //                                                                               textColor: ColorUtils.secondary,
                                          //                                                                               fontWeight: FontWeight.w700,
                                          //                                                                             ),
                                          //                                                                           ),
                                          //                                                                         ),
                                          //                                                                       ],
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Near By',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder:
                                          //                                                                     (
                                          //                                                                     _,
                                          //                                                                     ) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 340,
                                          //                                                                     child: Container(
                                          //                                                                       margin: EdgeInsets.only(
                                          //                                                                         top: 17,
                                          //                                                                       ),
                                          //                                                                       padding: const EdgeInsets.all(
                                          //                                                                         16,
                                          //                                                                       ),
                                          //                                                                       decoration: BoxDecoration(
                                          //                                                                         borderRadius: BorderRadius.circular(
                                          //                                                                           12,
                                          //                                                                         ),
                                          //                                                                         gradient: LinearGradient(
                                          //                                                                           begin: Alignment.topCenter,
                                          //                                                                           end: Alignment.bottomCenter,
                                          //                                                                           colors: [
                                          //                                                                             Color(
                                          //                                                                               0xFFFFFFFF,
                                          //                                                                             ),
                                          //                                                                             Color(
                                          //                                                                               0xFFF8F8FF,
                                          //                                                                             ),
                                          //                                                                           ],
                                          //                                                                           stops: [
                                          //                                                                             0.0,
                                          //                                                                             1.0,
                                          //                                                                           ],
                                          //                                                                         ),
                                          //                                                                       ),
                                          //                                                                       child: Column(
                                          //                                                                         mainAxisSize: MainAxisSize.min,
                                          //                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                                          //                                                                         children: [
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Dear SUPER",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.red,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 15,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "With Your Location at",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.black,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           ButtonWidget(
                                          //                                                                             navigateTo: () {
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                             },
                                          //                                                                             buttonName: 'OK',
                                          //                                                                             borderRadius: 10,
                                          //                                                                             height: 35,
                                          //                                                                             width: screenWidth(
                                          //                                                                               context,
                                          //                                                                             ),
                                          //                                                                             buttonTextColor: ColorUtils.white,
                                          //                                                                             buttonColor: ColorUtils.primary,
                                          //                                                                           ),
                                          //                                                                         ],
                                          //                                                                       ),
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Ok',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                               ),
                                          //                                               Align(
                                          //                                                 alignment:
                                          //                                                 Alignment
                                          //                                                     .topCenter,
                                          //                                                 child: Container(
                                          //                                                   padding:
                                          //                                                   EdgeInsets.only(
                                          //                                                     left:
                                          //                                                     14,
                                          //                                                     right:
                                          //                                                     14,
                                          //                                                     top: 5,
                                          //                                                     bottom:
                                          //                                                     7,
                                          //                                                   ),
                                          //                                                   decoration: BoxDecoration(
                                          //                                                     borderRadius:
                                          //                                                     BorderRadius.circular(
                                          //                                                       20,
                                          //                                                     ),
                                          //                                                     color: Color(
                                          //                                                       0xFFFFFFFF,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   child: TextWidget(
                                          //                                                     text:
                                          //                                                     "Attendance In",
                                          //                                                     fontSize:
                                          //                                                     15.5,
                                          //                                                     textColor:
                                          //                                                     ColorUtils
                                          //                                                         .secondary,
                                          //                                                     fontWeight:
                                          //                                                     FontWeight
                                          //                                                         .w700,
                                          //                                                   ),
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName: 'Auto',
                                          //                                   borderRadius: 10,
                                          //                                   height: 35,
                                          //                                   width: screenWidth(
                                          //                                     context,
                                          //                                   ),
                                          //                                   buttonTextColor: ColorUtils.white,
                                          //                                   buttonColor: ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                               HorizontalSpace(width: 10),
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder: (_) => Dialog(
                                          //                                         backgroundColor:
                                          //                                         Colors.transparent,
                                          //                                         insetPadding:
                                          //                                         const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 325,
                                          //                                           child: Stack(
                                          //                                             children: [
                                          //                                               Container(
                                          //                                                 margin:
                                          //                                                 EdgeInsets.only(
                                          //                                                   top: 17,
                                          //                                                 ),
                                          //                                                 padding:
                                          //                                                 const EdgeInsets.all(
                                          //                                                   16,
                                          //                                                 ),
                                          //                                                 decoration: BoxDecoration(
                                          //                                                   borderRadius:
                                          //                                                   BorderRadius.circular(
                                          //                                                     12,
                                          //                                                   ),
                                          //                                                   gradient: LinearGradient(
                                          //                                                     begin: Alignment
                                          //                                                         .topCenter,
                                          //                                                     end: Alignment
                                          //                                                         .bottomCenter,
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
                                          //                                                   mainAxisSize:
                                          //                                                   MainAxisSize
                                          //                                                       .min,
                                          //                                                   crossAxisAlignment:
                                          //                                                   CrossAxisAlignment
                                          //                                                       .start,
                                          //                                                   children: [
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       10,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         /// ================= DATE =================
                                          //                                                         Expanded(
                                          //                                                           child: Column(
                                          //                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                             children: [
                                          //                                                               TextWidget(
                                          //                                                                 text: 'Date',
                                          //                                                                 fontSize: 15,
                                          //                                                                 textColor: ColorUtils.primary,
                                          //                                                                 fontWeight: FontWeight.w500,
                                          //                                                               ),
                                          //                                                               const SizedBox(height: 5),
                                          //                                                               InkWell(
                                          //                                                                 // onTap: () => pickStyledDate(context),
                                          //                                                                 onTap: () => pickDate(context),
                                          //                                                                 child: Container(
                                          //                                                                   width: double.infinity,
                                          //                                                                   padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
                                          //                                                                   decoration:  BoxDecoration(
                                          //                                                                     borderRadius: BorderRadius.circular(11),
                                          //                                                                     color: ColorUtils.white,
                                          //                                                                     border: Border.all(
                                          //                                                                       color: const Color(0xFFEAECF0),
                                          //                                                                       width: 1,
                                          //                                                                     ),
                                          //                                                                     boxShadow: [
                                          //                                                                       BoxShadow(
                                          //                                                                         color: const Color(0xFF43474D).withOpacity(0.06),
                                          //                                                                         blurRadius: 60,
                                          //                                                                         offset: const Offset(0, 12),
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                   child: Row(
                                          //                                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                          //                                                                     children: [
                                          //                                                                       Image(image: AssetImage(ImagesUtils.dateIcon),height: 24,color: ColorUtils.secondary,),
                                          //                                                                       HorizontalSpace(width: 15),
                                          //                                                                       TextWidget(
                                          //                                                                         text: selectedDate == null
                                          //                                                                             ? 'Select Date'
                                          //                                                                             : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                          //                                                                         fontSize: 14,
                                          //                                                                         textColor: ColorUtils.black.withOpacity(0.7),
                                          //                                                                         fontWeight: FontWeight.w500,
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               ),
                                          //                                                             ],
                                          //                                                           ),
                                          //                                                         ),
                                          //
                                          //                                                         const SizedBox(width: 10),
                                          //
                                          //                                                         /// ================= TIME =================
                                          //                                                         Expanded(
                                          //                                                           child: Column(
                                          //                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                             children: [
                                          //                                                               TextWidget(
                                          //                                                                 text: 'Time',
                                          //                                                                 fontSize: 15,
                                          //                                                                 textColor: ColorUtils.primary,
                                          //                                                                 fontWeight: FontWeight.w500,
                                          //                                                               ),
                                          //                                                               const SizedBox(height: 5),
                                          //                                                               InkWell(
                                          //                                                                 onTap: () => pickTime(context),
                                          //                                                                 child: Container(
                                          //                                                                   width: double.infinity,
                                          //                                                                   padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
                                          //                                                                   decoration:  BoxDecoration(
                                          //                                                                     borderRadius: BorderRadius.circular(11),
                                          //                                                                     color: ColorUtils.white,
                                          //                                                                     border: Border.all(
                                          //                                                                       color: const Color(0xFFEAECF0),
                                          //                                                                       width: 1,
                                          //                                                                     ),
                                          //                                                                     boxShadow: [
                                          //                                                                       BoxShadow(
                                          //                                                                         color: const Color(0xFF43474D).withOpacity(0.06),
                                          //                                                                         blurRadius: 60,
                                          //                                                                         offset: const Offset(0, 12),
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                   child: Row(
                                          //                                                                     children: [
                                          //                                                                       Image(image: AssetImage(ImagesUtils.timeIcon),height: 24,color: ColorUtils.secondary,),
                                          //                                                                       HorizontalSpace(width: 15),
                                          //                                                                       TextWidget(
                                          //                                                                         text: selectedTime == null
                                          //                                                                             ? 'Select Time'
                                          //                                                                             : selectedTime!.format(context),
                                          //                                                                         fontSize: 14,
                                          //                                                                         textColor: ColorUtils.black.withOpacity(0.7),
                                          //                                                                         fontWeight: FontWeight.w500,
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               ),
                                          //                                                             ],
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       14,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               Navigator.pop(
                                          //                                                                 context,
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Cancel',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder:
                                          //                                                                     (
                                          //                                                                     _,
                                          //                                                                     ) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 340,
                                          //                                                                     child: Container(
                                          //                                                                       margin: EdgeInsets.only(
                                          //                                                                         top: 17,
                                          //                                                                       ),
                                          //                                                                       padding: const EdgeInsets.all(
                                          //                                                                         16,
                                          //                                                                       ),
                                          //                                                                       decoration: BoxDecoration(
                                          //                                                                         borderRadius: BorderRadius.circular(
                                          //                                                                           12,
                                          //                                                                         ),
                                          //                                                                         gradient: LinearGradient(
                                          //                                                                           begin: Alignment.topCenter,
                                          //                                                                           end: Alignment.bottomCenter,
                                          //                                                                           colors: [
                                          //                                                                             Color(
                                          //                                                                               0xFFFFFFFF,
                                          //                                                                             ),
                                          //                                                                             Color(
                                          //                                                                               0xFFF8F8FF,
                                          //                                                                             ),
                                          //                                                                           ],
                                          //                                                                           stops: [
                                          //                                                                             0.0,
                                          //                                                                             1.0,
                                          //                                                                           ],
                                          //                                                                         ),
                                          //                                                                       ),
                                          //                                                                       child: Column(
                                          //                                                                         mainAxisSize: MainAxisSize.min,
                                          //                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                                          //                                                                         children: [
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Dear SUPER",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.red,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 15,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "With Your Location at",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.black,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           ButtonWidget(
                                          //                                                                             navigateTo: () {
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                             },
                                          //                                                                             buttonName: 'OK',
                                          //                                                                             borderRadius: 10,
                                          //                                                                             height: 35,
                                          //                                                                             width: screenWidth(
                                          //                                                                               context,
                                          //                                                                             ),
                                          //                                                                             buttonTextColor: ColorUtils.white,
                                          //                                                                             buttonColor: ColorUtils.primary,
                                          //                                                                           ),
                                          //                                                                         ],
                                          //                                                                       ),
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             "Check In",
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                               ),
                                          //                                               Align(
                                          //                                                 alignment:
                                          //                                                 Alignment
                                          //                                                     .topCenter,
                                          //                                                 child: Container(
                                          //                                                   padding:
                                          //                                                   EdgeInsets.only(
                                          //                                                     left:
                                          //                                                     14,
                                          //                                                     right:
                                          //                                                     14,
                                          //                                                     top: 5,
                                          //                                                     bottom:
                                          //                                                     7,
                                          //                                                   ),
                                          //                                                   decoration: BoxDecoration(
                                          //                                                     borderRadius:
                                          //                                                     BorderRadius.circular(
                                          //                                                       20,
                                          //                                                     ),
                                          //                                                     color: Color(
                                          //                                                       0xFFFFFFFF,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   child: TextWidget(
                                          //                                                     text:
                                          //                                                     "Check In",
                                          //                                                     fontSize:
                                          //                                                     15.5,
                                          //                                                     textColor:
                                          //                                                     ColorUtils
                                          //                                                         .secondary,
                                          //                                                     fontWeight:
                                          //                                                     FontWeight
                                          //                                                         .w700,
                                          //                                                   ),
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName: 'Manual',
                                          //                                   borderRadius: 10,
                                          //                                   height: 35,
                                          //                                   width: screenWidth(
                                          //                                     context,
                                          //                                   ),
                                          //                                   buttonTextColor: ColorUtils.white,
                                          //                                   buttonColor: ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                             ],
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ),
                                          //                     Align(
                                          //                       alignment:
                                          //                       Alignment
                                          //                           .topCenter,
                                          //                       child: Container(
                                          //                         padding:
                                          //                         EdgeInsets.only(
                                          //                           left:
                                          //                           14,
                                          //                           right:
                                          //                           14,
                                          //                           top: 5,
                                          //                           bottom:
                                          //                           7,
                                          //                         ),
                                          //                         decoration: BoxDecoration(
                                          //                           borderRadius:
                                          //                           BorderRadius.circular(
                                          //                             20,
                                          //                           ),
                                          //                           color: Color(
                                          //                             0xFFFFFFFF,
                                          //                           ),
                                          //                         ),
                                          //                         child: TextWidget(
                                          //                           text:
                                          //                           "Check In",
                                          //                           fontSize:
                                          //                           15.5,
                                          //                           textColor:
                                          //                           ColorUtils
                                          //                               .secondary,
                                          //                           fontWeight:
                                          //                           FontWeight
                                          //                               .w700,
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //         deleteTodayTimingOnTap: (){
                                          //           showDialog(
                                          //             context: context,
                                          //             builder: (_) => Dialog(
                                          //               backgroundColor:
                                          //               Colors.transparent,
                                          //               insetPadding:
                                          //               const EdgeInsets.symmetric(
                                          //                 horizontal: 20,
                                          //               ),
                                          //               child: SizedBox(
                                          //                 height: 100,
                                          //                 child: Stack(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin:
                                          //                       EdgeInsets.only(
                                          //                         top: 17,
                                          //                       ),
                                          //                       padding:
                                          //                       const EdgeInsets.all(
                                          //                         16,
                                          //                       ),
                                          //                       decoration: BoxDecoration(
                                          //                         borderRadius:
                                          //                         BorderRadius.circular(
                                          //                           12,
                                          //                         ),
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
                                          //                         MainAxisSize
                                          //                             .min,
                                          //                         crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .start,
                                          //                         children: [
                                          //                           const VerticalSpace(
                                          //                             height:
                                          //                             10,
                                          //                           ),
                                          //                           Row(
                                          //                             children: [
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder: (_) => Dialog(
                                          //                                         backgroundColor:
                                          //                                         Colors.transparent,
                                          //                                         insetPadding:
                                          //                                         const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 325,
                                          //                                           child: Stack(
                                          //                                             children: [
                                          //                                               Container(
                                          //                                                 margin:
                                          //                                                 EdgeInsets.only(
                                          //                                                   top: 17,
                                          //                                                 ),
                                          //                                                 padding:
                                          //                                                 const EdgeInsets.all(
                                          //                                                   16,
                                          //                                                 ),
                                          //                                                 decoration: BoxDecoration(
                                          //                                                   borderRadius:
                                          //                                                   BorderRadius.circular(
                                          //                                                     12,
                                          //                                                   ),
                                          //                                                   gradient: LinearGradient(
                                          //                                                     begin: Alignment
                                          //                                                         .topCenter,
                                          //                                                     end: Alignment
                                          //                                                         .bottomCenter,
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
                                          //                                                   mainAxisSize:
                                          //                                                   MainAxisSize
                                          //                                                       .min,
                                          //                                                   crossAxisAlignment:
                                          //                                                   CrossAxisAlignment
                                          //                                                       .start,
                                          //                                                   children: [
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       10,
                                          //                                                     ),
                                          //                                                     TextWidget(
                                          //                                                       text:"Are you sure you want to delete your attandence?",
                                          //                                                       fontSize:
                                          //                                                       16,
                                          //                                                       textAlign:
                                          //                                                       TextAlign
                                          //                                                           .start,
                                          //                                                       textColor:
                                          //                                                       Color(
                                          //                                                         0xff1F1F1F,
                                          //                                                       ),
                                          //                                                       fontWeight:
                                          //                                                       FontWeight
                                          //                                                           .w500,
                                          //                                                     ),
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       14,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               Navigator.pop(
                                          //                                                                 context,
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Cancel',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder: (_,) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 200,
                                          //                                                                     child: Container(
                                          //                                                                       margin: EdgeInsets.only(
                                          //                                                                         top: 17,
                                          //                                                                       ),
                                          //                                                                       padding: const EdgeInsets.all(
                                          //                                                                         16,
                                          //                                                                       ),
                                          //                                                                       decoration: BoxDecoration(
                                          //                                                                         borderRadius: BorderRadius.circular(
                                          //                                                                           12,
                                          //                                                                         ),
                                          //                                                                         gradient: LinearGradient(
                                          //                                                                           begin: Alignment.topCenter,
                                          //                                                                           end: Alignment.bottomCenter,
                                          //                                                                           colors: [
                                          //                                                                             Color(
                                          //                                                                               0xFFFFFFFF,
                                          //                                                                             ),
                                          //                                                                             Color(
                                          //                                                                               0xFFF8F8FF,
                                          //                                                                             ),
                                          //                                                                           ],
                                          //                                                                           stops: [
                                          //                                                                             0.0,
                                          //                                                                             1.0,
                                          //                                                                           ],
                                          //                                                                         ),
                                          //                                                                       ),
                                          //                                                                       child: Column(
                                          //                                                                         mainAxisSize: MainAxisSize.min,
                                          //                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                                          //                                                                         children: [
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Check Out Deleted successfully for today.",
                                          //                                                                             fontSize: 16,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "You can mark Project Check In/Out again...",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.black,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           ButtonWidget(
                                          //                                                                             navigateTo: () {
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                             },
                                          //                                                                             buttonName: 'OK',
                                          //                                                                             borderRadius: 10,
                                          //                                                                             height: 35,
                                          //                                                                             width: screenWidth(
                                          //                                                                               context,
                                          //                                                                             ),
                                          //                                                                             buttonTextColor: ColorUtils.white,
                                          //                                                                             buttonColor: ColorUtils.primary,
                                          //                                                                           ),
                                          //                                                                         ],
                                          //                                                                       ),
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Ok',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                               ),
                                          //                                               Align(
                                          //                                                 alignment:
                                          //                                                 Alignment
                                          //                                                     .topCenter,
                                          //                                                 child: Container(
                                          //                                                   padding:
                                          //                                                   EdgeInsets.only(
                                          //                                                     left:
                                          //                                                     14,
                                          //                                                     right:
                                          //                                                     14,
                                          //                                                     top: 5,
                                          //                                                     bottom:
                                          //                                                     7,
                                          //                                                   ),
                                          //                                                   decoration: BoxDecoration(
                                          //                                                     borderRadius:
                                          //                                                     BorderRadius.circular(
                                          //                                                       20,
                                          //                                                     ),
                                          //                                                     color: Color(
                                          //                                                       0xFFFFFFFF,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   child: TextWidget(
                                          //                                                     text:
                                          //                                                     "Delete Attendance Out?",
                                          //                                                     fontSize:
                                          //                                                     15.5,
                                          //                                                     textColor:
                                          //                                                     ColorUtils
                                          //                                                         .secondary,
                                          //                                                     fontWeight:
                                          //                                                     FontWeight
                                          //                                                         .w700,
                                          //                                                   ),
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName: 'Out',
                                          //                                   borderRadius: 10,
                                          //                                   height: 35,
                                          //                                   width: screenWidth(
                                          //                                     context,
                                          //                                   ),
                                          //                                   buttonTextColor: ColorUtils.white,
                                          //                                   buttonColor: ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                               HorizontalSpace(width: 10),
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder: (_) => Dialog(
                                          //                                         backgroundColor:
                                          //                                         Colors.transparent,
                                          //                                         insetPadding:
                                          //                                         const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 325,
                                          //                                           child: Stack(
                                          //                                             children: [
                                          //                                               Container(
                                          //                                                 margin:
                                          //                                                 EdgeInsets.only(
                                          //                                                   top: 17,
                                          //                                                 ),
                                          //                                                 padding:
                                          //                                                 const EdgeInsets.all(
                                          //                                                   16,
                                          //                                                 ),
                                          //                                                 decoration: BoxDecoration(
                                          //                                                   borderRadius:
                                          //                                                   BorderRadius.circular(
                                          //                                                     12,
                                          //                                                   ),
                                          //                                                   gradient: LinearGradient(
                                          //                                                     begin: Alignment
                                          //                                                         .topCenter,
                                          //                                                     end: Alignment
                                          //                                                         .bottomCenter,
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
                                          //                                                   mainAxisSize:
                                          //                                                   MainAxisSize
                                          //                                                       .min,
                                          //                                                   crossAxisAlignment:
                                          //                                                   CrossAxisAlignment
                                          //                                                       .start,
                                          //                                                   children: [
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       10,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         /// ================= DATE =================
                                          //                                                         Expanded(
                                          //                                                           child: Column(
                                          //                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                             children: [
                                          //                                                               TextWidget(
                                          //                                                                 text: 'Date',
                                          //                                                                 fontSize: 15,
                                          //                                                                 textColor: ColorUtils.primary,
                                          //                                                                 fontWeight: FontWeight.w500,
                                          //                                                               ),
                                          //                                                               const SizedBox(height: 5),
                                          //                                                               InkWell(
                                          //                                                                 // onTap: () => pickStyledDate(context),
                                          //                                                                 onTap: () => pickDate(context),
                                          //                                                                 child: Container(
                                          //                                                                   width: double.infinity,
                                          //                                                                   padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
                                          //                                                                   decoration:  BoxDecoration(
                                          //                                                                     borderRadius: BorderRadius.circular(11),
                                          //                                                                     color: ColorUtils.white,
                                          //                                                                     border: Border.all(
                                          //                                                                       color: const Color(0xFFEAECF0),
                                          //                                                                       width: 1,
                                          //                                                                     ),
                                          //                                                                     boxShadow: [
                                          //                                                                       BoxShadow(
                                          //                                                                         color: const Color(0xFF43474D).withOpacity(0.06),
                                          //                                                                         blurRadius: 60,
                                          //                                                                         offset: const Offset(0, 12),
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                   child: Row(
                                          //                                                                     crossAxisAlignment: CrossAxisAlignment.center,
                                          //                                                                     children: [
                                          //                                                                       Image(image: AssetImage(ImagesUtils.dateIcon),height: 24,color: ColorUtils.secondary,),
                                          //                                                                       HorizontalSpace(width: 15),
                                          //                                                                       TextWidget(
                                          //                                                                         text: selectedDate == null
                                          //                                                                             ? 'Select Date'
                                          //                                                                             : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                                          //                                                                         fontSize: 14,
                                          //                                                                         textColor: ColorUtils.black.withOpacity(0.7),
                                          //                                                                         fontWeight: FontWeight.w500,
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               ),
                                          //                                                             ],
                                          //                                                           ),
                                          //                                                         ),
                                          //
                                          //                                                         const SizedBox(width: 10),
                                          //
                                          //                                                         /// ================= TIME =================
                                          //                                                         Expanded(
                                          //                                                           child: Column(
                                          //                                                             crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                             children: [
                                          //                                                               TextWidget(
                                          //                                                                 text: 'Time',
                                          //                                                                 fontSize: 15,
                                          //                                                                 textColor: ColorUtils.primary,
                                          //                                                                 fontWeight: FontWeight.w500,
                                          //                                                               ),
                                          //                                                               const SizedBox(height: 5),
                                          //                                                               InkWell(
                                          //                                                                 onTap: () => pickTime(context),
                                          //                                                                 child: Container(
                                          //                                                                   width: double.infinity,
                                          //                                                                   padding: const EdgeInsets.only(left: 10,right: 12,top: 10,bottom: 10),
                                          //                                                                   decoration:  BoxDecoration(
                                          //                                                                     borderRadius: BorderRadius.circular(11),
                                          //                                                                     color: ColorUtils.white,
                                          //                                                                     border: Border.all(
                                          //                                                                       color: const Color(0xFFEAECF0),
                                          //                                                                       width: 1,
                                          //                                                                     ),
                                          //                                                                     boxShadow: [
                                          //                                                                       BoxShadow(
                                          //                                                                         color: const Color(0xFF43474D).withOpacity(0.06),
                                          //                                                                         blurRadius: 60,
                                          //                                                                         offset: const Offset(0, 12),
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                   child: Row(
                                          //                                                                     children: [
                                          //                                                                       Image(image: AssetImage(ImagesUtils.timeIcon),height: 24,color: ColorUtils.secondary,),
                                          //                                                                       HorizontalSpace(width: 15),
                                          //                                                                       TextWidget(
                                          //                                                                         text: selectedTime == null
                                          //                                                                             ? 'Select Time'
                                          //                                                                             : selectedTime!.format(context),
                                          //                                                                         fontSize: 14,
                                          //                                                                         textColor: ColorUtils.black.withOpacity(0.7),
                                          //                                                                         fontWeight: FontWeight.w500,
                                          //                                                                       ),
                                          //                                                                     ],
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               ),
                                          //                                                             ],
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //
                                          //                                                     const VerticalSpace(
                                          //                                                       height:
                                          //                                                       14,
                                          //                                                     ),
                                          //
                                          //                                                     Row(
                                          //                                                       children: [
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               Navigator.pop(
                                          //                                                                 context,
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             'Cancel',
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                         HorizontalSpace(
                                          //                                                           width:
                                          //                                                           8,
                                          //                                                         ),
                                          //                                                         Expanded(
                                          //                                                           child: ButtonWidget(
                                          //                                                             navigateTo: () {
                                          //                                                               showDialog(
                                          //                                                                 context: context,
                                          //                                                                 builder:
                                          //                                                                     (
                                          //                                                                     _,
                                          //                                                                     ) => Dialog(
                                          //                                                                   backgroundColor: Colors.transparent,
                                          //                                                                   insetPadding: const EdgeInsets.symmetric(
                                          //                                                                     horizontal: 20,
                                          //                                                                   ),
                                          //                                                                   child: SizedBox(
                                          //                                                                     height: 340,
                                          //                                                                     child: Container(
                                          //                                                                       margin: EdgeInsets.only(
                                          //                                                                         top: 17,
                                          //                                                                       ),
                                          //                                                                       padding: const EdgeInsets.all(
                                          //                                                                         16,
                                          //                                                                       ),
                                          //                                                                       decoration: BoxDecoration(
                                          //                                                                         borderRadius: BorderRadius.circular(
                                          //                                                                           12,
                                          //                                                                         ),
                                          //                                                                         gradient: LinearGradient(
                                          //                                                                           begin: Alignment.topCenter,
                                          //                                                                           end: Alignment.bottomCenter,
                                          //                                                                           colors: [
                                          //                                                                             Color(
                                          //                                                                               0xFFFFFFFF,
                                          //                                                                             ),
                                          //                                                                             Color(
                                          //                                                                               0xFFF8F8FF,
                                          //                                                                             ),
                                          //                                                                           ],
                                          //                                                                           stops: [
                                          //                                                                             0.0,
                                          //                                                                             1.0,
                                          //                                                                           ],
                                          //                                                                         ),
                                          //                                                                       ),
                                          //                                                                       child: Column(
                                          //                                                                         mainAxisSize: MainAxisSize.min,
                                          //                                                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                                                         mainAxisAlignment: MainAxisAlignment.start,
                                          //                                                                         children: [
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Dear SUPER",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Project Check in allready Logged for 12-jan-2026 For Project 2nd Project Name Full Name at 14:38",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.red,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 15,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "With Your Location at",
                                          //                                                                             fontSize: 15,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor: const Color(
                                          //                                                                               0xff1F1F1F,
                                          //                                                                             ),
                                          //                                                                             fontWeight: FontWeight.w600,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           TextWidget(
                                          //                                                                             text: "Fiesta Travels Offices Number : 11125,Gaur City Mall,Greater Noida West Road,sector-4,Greated Noida",
                                          //                                                                             fontSize: 14,
                                          //                                                                             textAlign: TextAlign.start,
                                          //                                                                             textColor:ColorUtils.black,
                                          //                                                                             fontWeight: FontWeight.w500,
                                          //                                                                           ),
                                          //                                                                           const VerticalSpace(
                                          //                                                                             height: 20,
                                          //                                                                           ),
                                          //                                                                           ButtonWidget(
                                          //                                                                             navigateTo: () {
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                               Navigator.pop(
                                          //                                                                                 context,
                                          //                                                                               );
                                          //                                                                             },
                                          //                                                                             buttonName: 'OK',
                                          //                                                                             borderRadius: 10,
                                          //                                                                             height: 35,
                                          //                                                                             width: screenWidth(
                                          //                                                                               context,
                                          //                                                                             ),
                                          //                                                                             buttonTextColor: ColorUtils.white,
                                          //                                                                             buttonColor: ColorUtils.primary,
                                          //                                                                           ),
                                          //                                                                         ],
                                          //                                                                       ),
                                          //                                                                     ),
                                          //                                                                   ),
                                          //                                                                 ),
                                          //                                                               );
                                          //                                                             },
                                          //                                                             buttonName:
                                          //                                                             "Check In",
                                          //                                                             borderRadius:
                                          //                                                             10,
                                          //                                                             height:
                                          //                                                             30,
                                          //                                                             buttonTextColor:
                                          //                                                             ColorUtils.white,
                                          //                                                             buttonColor:
                                          //                                                             ColorUtils.primary,
                                          //                                                           ),
                                          //                                                         ),
                                          //                                                       ],
                                          //                                                     ),
                                          //                                                   ],
                                          //                                                 ),
                                          //                                               ),
                                          //                                               Align(
                                          //                                                 alignment:
                                          //                                                 Alignment
                                          //                                                     .topCenter,
                                          //                                                 child: Container(
                                          //                                                   padding:
                                          //                                                   EdgeInsets.only(
                                          //                                                     left:
                                          //                                                     14,
                                          //                                                     right:
                                          //                                                     14,
                                          //                                                     top: 5,
                                          //                                                     bottom:
                                          //                                                     7,
                                          //                                                   ),
                                          //                                                   decoration: BoxDecoration(
                                          //                                                     borderRadius:
                                          //                                                     BorderRadius.circular(
                                          //                                                       20,
                                          //                                                     ),
                                          //                                                     color: Color(
                                          //                                                       0xFFFFFFFF,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   child: TextWidget(
                                          //                                                     text:
                                          //                                                     "Check In",
                                          //                                                     fontSize:
                                          //                                                     15.5,
                                          //                                                     textColor:
                                          //                                                     ColorUtils
                                          //                                                         .secondary,
                                          //                                                     fontWeight:
                                          //                                                     FontWeight
                                          //                                                         .w700,
                                          //                                                   ),
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName: 'Both',
                                          //                                   borderRadius: 10,
                                          //                                   height: 35,
                                          //                                   width: screenWidth(
                                          //                                     context,
                                          //                                   ),
                                          //                                   buttonTextColor: ColorUtils.white,
                                          //                                   buttonColor: ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                             ],
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ),
                                          //                     Align(
                                          //                       alignment:
                                          //                       Alignment
                                          //                           .topCenter,
                                          //                       child: Container(
                                          //                         padding:
                                          //                         EdgeInsets.only(
                                          //                           left:
                                          //                           14,
                                          //                           right:
                                          //                           14,
                                          //                           top: 5,
                                          //                           bottom:
                                          //                           7,
                                          //                         ),
                                          //                         decoration: BoxDecoration(
                                          //                           borderRadius:
                                          //                           BorderRadius.circular(
                                          //                             20,
                                          //                           ),
                                          //                           color: Color(
                                          //                             0xFFFFFFFF,
                                          //                           ),
                                          //                         ),
                                          //                         child: TextWidget(
                                          //                           text:
                                          //                           "Delete Attendance?",
                                          //                           fontSize:
                                          //                           15.5,
                                          //                           textColor:
                                          //                           ColorUtils
                                          //                               .secondary,
                                          //                           fontWeight:
                                          //                           FontWeight
                                          //                               .w700,
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //         updateProjectLocationOnTap: (){
                                          //           showDialog(
                                          //             context: context,
                                          //             builder: (_) => Dialog(
                                          //               backgroundColor:
                                          //               Colors.transparent,
                                          //               insetPadding:
                                          //               const EdgeInsets.symmetric(
                                          //                 horizontal: 20,
                                          //               ),
                                          //               child: SizedBox(
                                          //                 height: 325,
                                          //                 child: Stack(
                                          //                   children: [
                                          //                     Container(
                                          //                       margin:
                                          //                       EdgeInsets.only(
                                          //                         top: 17,
                                          //                       ),
                                          //                       padding:
                                          //                       const EdgeInsets.all(
                                          //                         16,
                                          //                       ),
                                          //                       decoration: BoxDecoration(
                                          //                         borderRadius:
                                          //                         BorderRadius.circular(
                                          //                           12,
                                          //                         ),
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
                                          //                         MainAxisSize
                                          //                             .min,
                                          //                         crossAxisAlignment:
                                          //                         CrossAxisAlignment
                                          //                             .start,
                                          //                         children: [
                                          //                           const VerticalSpace(
                                          //                             height:
                                          //                             10,
                                          //                           ),
                                          //                           TextWidget(
                                          //                             text:
                                          //                             selectedLocation ??
                                          //                                 'Gaur City Mall is located in Greater Noida West (Noida Extension), specifically in Gaur City 1, near Kisan Chowk (Gaur Chowk) and the upcoming metro station, serving as a major shopping, dining, and entertainment hub with brands, PVR Cinemas, food courts, and ample parking',
                                          //                             fontSize:
                                          //                             16,
                                          //                             textAlign:
                                          //                             TextAlign
                                          //                                 .start,
                                          //                             textColor:
                                          //                             Color(
                                          //                               0xff1F1F1F,
                                          //                             ),
                                          //                             fontWeight:
                                          //                             FontWeight
                                          //                                 .w500,
                                          //                           ),
                                          //                           const VerticalSpace(
                                          //                             height:
                                          //                             14,
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
                                          //                                   'Cancel',
                                          //                                   borderRadius:
                                          //                                   10,
                                          //                                   height:
                                          //                                   30,
                                          //                                   buttonTextColor:
                                          //                                   ColorUtils.white,
                                          //                                   buttonColor:
                                          //                                   ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                               HorizontalSpace(
                                          //                                 width:
                                          //                                 8,
                                          //                               ),
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder:
                                          //                                           (
                                          //                                           _,
                                          //                                           ) => Dialog(
                                          //                                         backgroundColor: Colors.transparent,
                                          //                                         insetPadding: const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 560,
                                          //                                           child: Stack(
                                          //                                             children: [
                                          //                                               Container(
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
                                          //                                                   children: [
                                          //                                                     const VerticalSpace(
                                          //                                                       height: 10,
                                          //                                                     ),
                                          //                                                     SizedBox(
                                          //                                                       height: 450,
                                          //                                                       child: ListView.separated(
                                          //                                                         itemCount: locationList.length,
                                          //                                                         shrinkWrap: true,
                                          //                                                         separatorBuilder:
                                          //                                                             (
                                          //                                                             _,
                                          //                                                             __,
                                          //                                                             ) => const SizedBox(),
                                          //                                                         itemBuilder:
                                          //                                                             (
                                          //                                                             context,
                                          //                                                             index,
                                          //                                                             ) {
                                          //                                                           return GestureDetector(
                                          //                                                             onTap: () {
                                          //                                                               setState(
                                          //                                                                     () {
                                          //                                                                   selectedLocation = locationList[index];
                                          //                                                                 },
                                          //                                                               );
                                          //                                                               Navigator.pop(
                                          //                                                                 context,
                                          //                                                               );
                                          //                                                             },
                                          //
                                          //                                                             child: Padding(
                                          //                                                               padding: const EdgeInsets.symmetric(
                                          //                                                                 vertical: 5,
                                          //                                                               ),
                                          //                                                               child: TextWidget(
                                          //                                                                 text: locationList[index],
                                          //                                                                 fontSize: 15,
                                          //                                                                 textAlign: TextAlign.start,
                                          //                                                                 textColor: const Color(
                                          //                                                                   0xff1F1F1F,
                                          //                                                                 ),
                                          //                                                                 fontWeight: FontWeight.w500,
                                          //                                                               ),
                                          //                                                             ),
                                          //                                                           );
                                          //                                                         },
                                          //                                                       ),
                                          //                                                     ),
                                          //                                                     const VerticalSpace(
                                          //                                                       height: 14,
                                          //                                                     ),
                                          //                                                     ButtonWidget(
                                          //                                                       navigateTo: () {
                                          //                                                         Navigator.pop(
                                          //                                                           context,
                                          //                                                         );
                                          //                                                       },
                                          //                                                       buttonName: 'Dismiss',
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
                                          //                                               Align(
                                          //                                                 alignment: Alignment.topCenter,
                                          //                                                 child: Container(
                                          //                                                   padding: EdgeInsets.only(
                                          //                                                     left: 14,
                                          //                                                     right: 14,
                                          //                                                     top: 5,
                                          //                                                     bottom: 7,
                                          //                                                   ),
                                          //                                                   decoration: BoxDecoration(
                                          //                                                     borderRadius: BorderRadius.circular(
                                          //                                                       20,
                                          //                                                     ),
                                          //                                                     color: Color(
                                          //                                                       0xFFFFFFFF,
                                          //                                                     ),
                                          //                                                   ),
                                          //                                                   child: TextWidget(
                                          //                                                     text: "Are you in",
                                          //                                                     fontSize: 15.5,
                                          //                                                     textColor: ColorUtils.secondary,
                                          //                                                     fontWeight: FontWeight.w700,
                                          //                                                   ),
                                          //                                                 ),
                                          //                                               ),
                                          //                                             ],
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName:
                                          //                                   'Near By',
                                          //                                   borderRadius:
                                          //                                   10,
                                          //                                   height:
                                          //                                   30,
                                          //                                   buttonTextColor:
                                          //                                   ColorUtils.white,
                                          //                                   buttonColor:
                                          //                                   ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                               HorizontalSpace(
                                          //                                 width:
                                          //                                 8,
                                          //                               ),
                                          //                               Expanded(
                                          //                                 child: ButtonWidget(
                                          //                                   navigateTo: () {
                                          //                                     showDialog(
                                          //                                       context: context,
                                          //                                       builder:
                                          //                                           (
                                          //                                           _,
                                          //                                           ) => Dialog(
                                          //                                         backgroundColor: Colors.transparent,
                                          //                                         insetPadding: const EdgeInsets.symmetric(
                                          //                                           horizontal: 20,
                                          //                                         ),
                                          //                                         child: SizedBox(
                                          //                                           height: 195,
                                          //                                           child: Container(
                                          //                                             margin: EdgeInsets.only(
                                          //                                               top: 17,
                                          //                                             ),
                                          //                                             padding: const EdgeInsets.all(
                                          //                                               16,
                                          //                                             ),
                                          //                                             decoration: BoxDecoration(
                                          //                                               borderRadius: BorderRadius.circular(
                                          //                                                 12,
                                          //                                               ),
                                          //                                               gradient: LinearGradient(
                                          //                                                 begin: Alignment.topCenter,
                                          //                                                 end: Alignment.bottomCenter,
                                          //                                                 colors: [
                                          //                                                   Color(
                                          //                                                     0xFFFFFFFF,
                                          //                                                   ),
                                          //                                                   Color(
                                          //                                                     0xFFF8F8FF,
                                          //                                                   ),
                                          //                                                 ],
                                          //                                                 stops: [
                                          //                                                   0.0,
                                          //                                                   1.0,
                                          //                                                 ],
                                          //                                               ),
                                          //                                             ),
                                          //                                             child: Column(
                                          //                                               mainAxisSize: MainAxisSize.min,
                                          //                                               crossAxisAlignment: CrossAxisAlignment.start,
                                          //                                               mainAxisAlignment: MainAxisAlignment.center,
                                          //                                               children: [
                                          //                                                 TextWidget(
                                          //                                                   text: "GPS Location Saved Successfully for Lead..",
                                          //                                                   fontSize: 16,
                                          //                                                   textAlign: TextAlign.start,
                                          //                                                   textColor: const Color(
                                          //                                                     0xff1F1F1F,
                                          //                                                   ),
                                          //                                                   fontWeight: FontWeight.w600,
                                          //                                                 ),
                                          //                                                 const VerticalSpace(
                                          //                                                   height: 10,
                                          //                                                 ),
                                          //                                                 TextWidget(
                                          //                                                   text: "Customer : Test User Dev",
                                          //                                                   fontSize: 14,
                                          //                                                   textAlign: TextAlign.start,
                                          //                                                   textColor: const Color(
                                          //                                                     0xff1F1F1F,
                                          //                                                   ),
                                          //                                                   fontWeight: FontWeight.w500,
                                          //                                                 ),
                                          //                                                 TextWidget(
                                          //                                                   text: "Contact Person : Test User Dev",
                                          //                                                   fontSize: 14,
                                          //                                                   textAlign: TextAlign.start,
                                          //                                                   textColor: const Color(
                                          //                                                     0xff1F1F1F,
                                          //                                                   ),
                                          //                                                   fontWeight: FontWeight.w500,
                                          //                                                 ),
                                          //                                                 const VerticalSpace(
                                          //                                                   height: 14,
                                          //                                                 ),
                                          //                                                 ButtonWidget(
                                          //                                                   navigateTo: () {
                                          //                                                     Navigator.pop(
                                          //                                                       context,
                                          //                                                     );
                                          //                                                     Navigator.pop(
                                          //                                                       context,
                                          //                                                     );
                                          //                                                     Navigator.pop(
                                          //                                                       context,
                                          //                                                     );
                                          //                                                   },
                                          //                                                   buttonName: 'OK',
                                          //                                                   borderRadius: 10,
                                          //                                                   height: 35,
                                          //                                                   width: screenWidth(
                                          //                                                     context,
                                          //                                                   ),
                                          //                                                   buttonTextColor: ColorUtils.white,
                                          //                                                   buttonColor: ColorUtils.primary,
                                          //                                                 ),
                                          //                                               ],
                                          //                                             ),
                                          //                                           ),
                                          //                                         ),
                                          //                                       ),
                                          //                                     );
                                          //                                   },
                                          //                                   buttonName:
                                          //                                   'Ok',
                                          //                                   borderRadius:
                                          //                                   10,
                                          //                                   height:
                                          //                                   30,
                                          //                                   buttonTextColor:
                                          //                                   ColorUtils.white,
                                          //                                   buttonColor:
                                          //                                   ColorUtils.primary,
                                          //                                 ),
                                          //                               ),
                                          //                             ],
                                          //                           ),
                                          //                         ],
                                          //                       ),
                                          //                     ),
                                          //                     Align(
                                          //                       alignment:
                                          //                       Alignment
                                          //                           .topCenter,
                                          //                       child: Container(
                                          //                         padding:
                                          //                         EdgeInsets.only(
                                          //                           left:
                                          //                           14,
                                          //                           right:
                                          //                           14,
                                          //                           top: 5,
                                          //                           bottom:
                                          //                           7,
                                          //                         ),
                                          //                         decoration: BoxDecoration(
                                          //                           borderRadius:
                                          //                           BorderRadius.circular(
                                          //                             20,
                                          //                           ),
                                          //                           color: Color(
                                          //                             0xFFFFFFFF,
                                          //                           ),
                                          //                         ),
                                          //                         child: TextWidget(
                                          //                           text:
                                          //                           "Update Project Location",
                                          //                           fontSize:
                                          //                           15.5,
                                          //                           textColor:
                                          //                           ColorUtils
                                          //                               .secondary,
                                          //                           fontWeight:
                                          //                           FontWeight
                                          //                               .w700,
                                          //                         ),
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //           );
                                          //         },
                                          //         updateProjectLandMarkOnTap: (){},
                                          //         customerDetailsViewOnTap: (){
                                          //           Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectWorkingCustomerDetailsView(),));
                                          //         },
                                          //         logFollowupsOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ProjectWorkingLogFollowups(),
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
                                          //         attachmentsOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ProjectWorkingAttachments(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         verificationOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ProjectWorkingVerification(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         autoLoggedMailOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ProjectWorkingAutoLogedMail(),
                                          //             ),
                                          //           );
                                          //         },
                                          //         notesOnTap: () {
                                          //           Navigator.push(
                                          //             context,
                                          //             MaterialPageRoute(
                                          //               builder: (_) =>
                                          //                   ProjectWorkingNote(),
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
                                          //
                                          //         },
                                          //       );
                                          //     },
                                          //   );
                                          // },
                                          child: Image.asset(
                                            ImagesUtils.more,
                                            height: 20,
                                            color: ColorUtils.secondary,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {

                                          },
                                          child: Image.asset(
                                            ImagesUtils.msgSendIcon,
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
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ButtonWidget(
                  navigateTo: () {
                    showDialog(
                      context: context,
                      builder: (_) => SelectionCriteriaDialog(
                        dialogTitle: "Selection Criteria",
                        nameCtr: selectionCriteriaNameCtr,
                        onDismiss: () {
                          Navigator.pop(context);
                        },
                        onOk: () {
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                  buttonName: 'Select Other Project',
                  borderRadius: 30,
                  width: screenWidth(context),
                  height: 50,
                  buttonTextColor: ColorUtils.white,
                  buttonColor: ColorUtils.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectWorkingListModel {
  final String project;
  final String address;
  final String location;
  final String landmark;
  final String contact;
  final String customer;
  final String phone;

  final String remarks;


  ProjectWorkingListModel({
    required this.project,
    required this.address,
    required this.location,
    required this.landmark,
    required this.contact,
    required this.customer,
    required this.phone,
    required this.remarks,

  });
}