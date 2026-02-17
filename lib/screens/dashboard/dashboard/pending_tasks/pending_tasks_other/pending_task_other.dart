import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/contact_action_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/screen_navigation_utils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/screens/dashboard/dashboard/activities/all_activities_reausable_widget/all_activities_reausable_widget.dart';
import 'package:flexibiz/screens/dashboard/dashboard/bottom_sheet_action_tile.dart';
import 'package:flexibiz/screens/dashboard/dashboard/pending_tasks/pending_tasks_other/pending_tasks_other_list_details.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PendingTaskOther extends StatefulWidget {
  const PendingTaskOther({super.key});

  @override
  State<PendingTaskOther> createState() => _PendingTaskOtherState();
}

class _PendingTaskOtherState extends State<PendingTaskOther> {

  final List<PendingTaskOtherListModel> leadActivityList = [
    PendingTaskOtherListModel(
      choice: "Call",
      taskName: "Initial Follow-up Call",
      company: "FlexiBiz ERP",
      contact: "Vikas Sharma",
      date: "12-Mar-2025",
      phone: "9876543210",
      email: "vikasflexibiz@gmail.com",
      taskDate: "13-Mar-2025",
      taskTime: "10:30 AM",
      executive: "Amit Kumar",
    ),
    PendingTaskOtherListModel(
      choice: "Meeting",
      taskName: "Product Requirement Meeting",
      company: "TechNova Solutions",
      contact: "Anjali Verma",
      date: "10-Mar-2025",
      phone: "9123456789",
      email: "anjalitechnova@gmail.com",
      taskDate: "14-Mar-2025",
      taskTime: "02:00 PM",
      executive: "Rahul Singh",
    ),
    PendingTaskOtherListModel(
      choice: "Follow Up",
      taskName: "Pricing Discussion Follow-up",
      company: "NextGen IT",
      contact: "Rohit Mehta",
      date: "09-Mar-2025",
      phone: "9988776655",
      email: "rohitnextgenit@gmail.com",
      taskDate: "15-Mar-2025",
      taskTime: "11:15 AM",
      executive: "Neha Gupta",
    ),
    PendingTaskOtherListModel(
      choice: "Demo",
      taskName: "ERP Product Demo",
      company: "BlueOcean Pvt Ltd",
      contact: "Suman Roy",
      date: "08-Mar-2025",
      phone: "9090909090",
      email: "sumanblueocean@gmail.com",
      taskDate: "16-Mar-2025",
      taskTime: "04:00 PM",
      executive: "Aakash Jain",
    ),
    PendingTaskOtherListModel(
      choice: "Call",
      taskName: "Client Feedback Call",
      company: "Global Soft",
      contact: "Manish Patel",
      date: "07-Mar-2025",
      phone: "9811122233",
      email: "manishglobalsoft@gmail.com",
      taskDate: "17-Mar-2025",
      taskTime: "09:45 AM",
      executive: "Pooja Malhotra",
    ),
    PendingTaskOtherListModel(
      choice: "Meeting",
      taskName: "Contract Finalization Meeting",
      company: "InnoTech",
      contact: "Kiran Joshi",
      date: "06-Mar-2025",
      phone: "9345678123",
      email: "kiraninnotech@gmail.com",
      taskDate: "18-Mar-2025",
      taskTime: "12:30 PM",
      executive: "Sandeep Verma",
    ),
    PendingTaskOtherListModel(
      choice: "Follow Up",
      taskName: "Payment Confirmation Follow-up",
      company: "Apex Systems",
      contact: "Deepak Yadav",
      date: "05-Mar-2025",
      phone: "9765432109",
      email: "deepakapex@gmail.com",
      taskDate: "19-Mar-2025",
      taskTime: "03:20 PM",
      executive: "Ritika Singh",
    ),
    PendingTaskOtherListModel(
      choice: "Demo",
      taskName: "CRM Demo Session",
      company: "VisionWare",
      contact: "Sneha Kapoor",
      date: "04-Mar-2025",
      phone: "9001122334",
      email: "snehavisionware@gmail.com",
      taskDate: "20-Mar-2025",
      taskTime: "01:00 PM",
      executive: "Mohit Aggarwal",
    ),
    PendingTaskOtherListModel(
      choice: "Call",
      taskName: "Renewal Reminder Call",
      company: "CloudNine",
      contact: "Tarun Khanna",
      date: "03-Mar-2025",
      phone: "8899776655",
      email: "taruncloudnine@gmail.com",
      taskDate: "21-Mar-2025",
      taskTime: "05:10 PM",
      executive: "Ankita Rao",
    ),
    PendingTaskOtherListModel(
      choice: "Meeting",
      taskName: "Quarterly Review Meeting",
      company: "SmartWorks",
      contact: "Nitin Arora",
      date: "02-Mar-2025",
      phone: "9112233445",
      email: "nitinsmartworks@gmail.com",
      taskDate: "22-Mar-2025",
      taskTime: "10:00 AM",
      executive: "Vivek Mishra",
    ),
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
                              child: PendingTasksOtherListDetails(),
                              type: PageTransitionType.fade,
                            );
                          },
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              VerticalSpace(height: 7),
                              TextWidget(
                                text: item.taskName,
                                fontSize: 13,
                                textAlign: TextAlign.start,
                                textColor:ColorUtils.primary,
                                fontWeight: FontWeight.w700,
                              ),
                              VerticalSpace(height: 5),
                              LabelValueWidget(
                                label: "choice",
                                value: item.choice,
                              ),
                              LabelValueWidget(
                                label: "company",
                                value: item.company,
                              ),
                              LabelValueWidget(
                                label: "contact",
                                value: item.contact,
                              ),
                              LabelValueWidget(
                                label: "date",
                                value: item.date,
                              ),
                              LabelValueWidget(
                                label: "Phone",
                                value: item.phone,
                                labelColor: ColorUtils.secondary,
                                textDecoration: TextDecoration.underline,
                                labelOnTap: (){
                                  ContactActionUtils.makePhoneCall(item.phone,);
                                },
                              ),
                              LabelValueWidget(
                                label: "email",
                                value: item.email,
                                labelColor: ColorUtils.secondary,
                                textDecoration: TextDecoration.underline,
                                labelOnTap: (){
                                  ContactActionUtils.sendEmail(item.email);
                                },
                              ),
                              LabelValueWidget(
                                label: "task date",
                                value: item.taskDate,
                              ),
                              LabelValueWidget(
                                label: "tast time",
                                value: item.taskTime,
                              ),
                              LabelValueWidget(
                                label: "executive",
                                value: item.executive,
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
                                              children: [

                                                /// HEADER
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFFF9FAFB),
                                                    borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 50,
                                                        width: 50,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8),
                                                          border: Border.all(color:ColorUtils.white,width: 1.1),
                                                          image: DecorationImage(
                                                            image: AssetImage(ImagesUtils.appLogo),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 10),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          TextWidget(
                                                            text: item.taskName,
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w600,
                                                            textColor: ColorUtils.secondary,
                                                          ),
                                                          TextWidget(
                                                            text: item.email,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w500,
                                                            textColor: const Color(0xFF1D2939),
                                                          ),

                                                          TextWidget(
                                                            text: item.phone,
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w500,
                                                            textColor: const Color(0xFF475467),
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
                                                                    iconImage: ImagesUtils.closeIcons,
                                                                    title: "Close Task",
                                                                    onTap: () {
                                                                      showDialog(
                                                                        context: context,
                                                                        builder: (_) => Dialog(
                                                                          backgroundColor: Colors.transparent,
                                                                          insetPadding: const EdgeInsets.symmetric(horizontal: 20,),
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
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      const VerticalSpace(height: 10,),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 4,right: 4),
                                                                                        child: TextWidget(
                                                                                          text: "Test Project dev",
                                                                                          fontSize: 16,
                                                                                          textAlign: TextAlign.start,
                                                                                          textColor:ColorUtils.black.withOpacity(0.8),
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 4,right: 4),
                                                                                        child: TextWidget(
                                                                                          text: "4567987623",
                                                                                          fontSize: 14,
                                                                                          textAlign: TextAlign.start,
                                                                                          textColor:ColorUtils.black.withOpacity(0.7),
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: const EdgeInsets.only(left: 4,right: 4,bottom: 5),
                                                                                        child: TextWidget(
                                                                                          text: "test111dev@gmailcom",
                                                                                          fontSize: 14,
                                                                                          textAlign: TextAlign.start,
                                                                                          textColor:ColorUtils.black.withOpacity(0.7),
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        height: 130,
                                                                                        width: screenWidth(context),
                                                                                        padding: const EdgeInsets.only(left: 8,right: 8),
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
                                                                                        child: TextField(
                                                                                          maxLines: 10,
                                                                                          minLines: 1,
                                                                                          expands: false,
                                                                                          keyboardType: TextInputType.multiline,
                                                                                          textAlignVertical: TextAlignVertical.top,
                                                                                          style: GoogleFonts.montserrat(
                                                                                            textStyle: TextStyle(
                                                                                                fontSize: 14,
                                                                                                color:ColorUtils.black.withOpacity(0.8),
                                                                                                fontWeight: FontWeight.w500
                                                                                            ),
                                                                                          ),
                                                                                          decoration:  InputDecoration(
                                                                                            hintText: 'Remark...',
                                                                                            border: InputBorder.none,
                                                                                            hintStyle: GoogleFonts.montserrat(
                                                                                              textStyle: TextStyle(
                                                                                                  fontSize: 14,
                                                                                                  color:ColorUtils.black,
                                                                                                  fontWeight: FontWeight.w500
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      VerticalSpace(height: 12),
                                                                                      Row(
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: ButtonWidget(
                                                                                              navigateTo: () {
                                                                                                Navigator.pop(context,);
                                                                                              },
                                                                                              buttonName:
                                                                                              'Cancel',
                                                                                              borderRadius:
                                                                                              100,
                                                                                              height:
                                                                                              40,
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
                                                                                              navigateTo: (){},
                                                                                              buttonName:
                                                                                              'Close Task',
                                                                                              borderRadius:
                                                                                              100,
                                                                                              height:
                                                                                              40,
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
                                                                                      "Close Task",
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
                                                                    iconImage: ImagesUtils.mobileNoIcon,
                                                                    title: "Call",
                                                                    onTap: () {
                                                                      Navigator.pop(context);
                                                                      ContactActionUtils.makePhoneCall(
                                                                        item.phone,
                                                                      );
                                                                    },
                                                                  ),
                                                                  const SizedBox(width: 10),
                                                                  BottomSheetActionTile(
                                                                    iconImage: ImagesUtils.shareIcon,
                                                                    title: "Share",
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
                                                                        item.email,
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
                                                                  Expanded(child: Container(height: 50,width: 50,))
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
                                //     backgroundColor:
                                //     Colors.transparent,
                                //     builder: (context) {
                                //       return PendingTaskOtherListThreeDotMBottomSheet(
                                //         title: "2nd Project Name Full Name",
                                //         email: "textdev@gmail.com",
                                //         mobileNo: "4567876523",
                                //         closeTaskOnTap: (){
                                //           showDialog(
                                //             context: context,
                                //             builder: (_) => Dialog(
                                //               backgroundColor: Colors.transparent,
                                //               insetPadding: const EdgeInsets.symmetric(horizontal: 20,),
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
                                //                         mainAxisSize: MainAxisSize.min,
                                //                         crossAxisAlignment: CrossAxisAlignment.start,
                                //                         children: [
                                //                           const VerticalSpace(height: 10,),
                                //                           Padding(
                                //                             padding: const EdgeInsets.only(left: 4,right: 4),
                                //                             child: TextWidget(
                                //                               text: "Test Project dev",
                                //                               fontSize: 16,
                                //                               textAlign: TextAlign.start,
                                //                               textColor:ColorUtils.black.withOpacity(0.8),
                                //                               fontWeight: FontWeight.w600,
                                //                             ),
                                //                           ),
                                //                           Padding(
                                //                             padding: const EdgeInsets.only(left: 4,right: 4),
                                //                             child: TextWidget(
                                //                               text: "4567987623",
                                //                               fontSize: 14,
                                //                               textAlign: TextAlign.start,
                                //                               textColor:ColorUtils.black.withOpacity(0.7),
                                //                               fontWeight: FontWeight.w500,
                                //                             ),
                                //                           ),
                                //                           Padding(
                                //                             padding: const EdgeInsets.only(left: 4,right: 4,bottom: 5),
                                //                             child: TextWidget(
                                //                               text: "test111dev@gmailcom",
                                //                               fontSize: 14,
                                //                               textAlign: TextAlign.start,
                                //                               textColor:ColorUtils.black.withOpacity(0.7),
                                //                               fontWeight: FontWeight.w500,
                                //                             ),
                                //                           ),
                                //                           Container(
                                //                             height: 130,
                                //                             width: screenWidth(context),
                                //                             padding: const EdgeInsets.only(left: 8,right: 8),
                                //                             decoration:  BoxDecoration(
                                //                               borderRadius: BorderRadius.circular(11),
                                //                               color: ColorUtils.white,
                                //                               border: Border.all(
                                //                                 color: const Color(0xFFEAECF0),
                                //                                 width: 1,
                                //                               ),
                                //                               boxShadow: [
                                //                                 BoxShadow(
                                //                                   color: const Color(0xFF43474D).withOpacity(0.06),
                                //                                   blurRadius: 60,
                                //                                   offset: const Offset(0, 12),
                                //                                 ),
                                //                               ],
                                //                             ),
                                //                             child: TextField(
                                //                               maxLines: 10,
                                //                               minLines: 1,
                                //                               expands: false,
                                //                               keyboardType: TextInputType.multiline,
                                //                               textAlignVertical: TextAlignVertical.top,
                                //                               style: GoogleFonts.montserrat(
                                //                                 textStyle: TextStyle(
                                //                                     fontSize: 14,
                                //                                     color:ColorUtils.black.withOpacity(0.8),
                                //                                     fontWeight: FontWeight.w500
                                //                                 ),
                                //                               ),
                                //                               decoration:  InputDecoration(
                                //                                 hintText: 'Remark...',
                                //                                 border: InputBorder.none,
                                //                                 hintStyle: GoogleFonts.montserrat(
                                //                                   textStyle: TextStyle(
                                //                                       fontSize: 14,
                                //                                       color:ColorUtils.black,
                                //                                       fontWeight: FontWeight.w500
                                //                                   ),
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                           ),
                                //                           VerticalSpace(height: 12),
                                //                           Row(
                                //                             children: [
                                //                               Expanded(
                                //                                 child: ButtonWidget(
                                //                                   navigateTo: () {
                                //                                     Navigator.pop(context,);
                                //                                   },
                                //                                   buttonName:
                                //                                   'Cancel',
                                //                                   borderRadius:
                                //                                   100,
                                //                                   height:
                                //                                   40,
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
                                //
                                //                               Expanded(
                                //                                 child: ButtonWidget(
                                //                                   navigateTo: (){},
                                //                                   buttonName:
                                //                                   'Close Task',
                                //                                   borderRadius:
                                //                                   100,
                                //                                   height:
                                //                                   40,
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
                                //                           "Close Task",
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
    );
  }
}

class PendingTaskOtherListModel {
  final String taskName;
  final String choice;
  final String company;
  final String contact;
  final String date;
  final String phone;
  final String email;
  final String taskDate;
  final String taskTime;
  final String executive;



  PendingTaskOtherListModel({
    required this.choice,
    required this.company,
    required this.contact,
    required this.date,
    required this.phone,
    required this.email,
    required this.taskDate,
    required this.taskTime,
    required this.executive,
    required this.taskName
  });
}
