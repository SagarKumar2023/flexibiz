import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ListDataSearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPrefixTap;
  const ListDataSearchField({
    super.key,
    required this.controller,
    required this.onPrefixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: TextFieldWidget(
        cursorColor: ColorUtils.grey,
        focusBorderColor: ColorUtils.white.withOpacity(0.9),
        disableBorderColor: ColorUtils.white.withOpacity(0.3),
        enableBorderColor: ColorUtils.white.withOpacity(0.9),
        hintTextColor: ColorUtils.grey,
        labelTextColor: ColorUtils.grey,
        controller: controller,
        borderRadius: 30,
        hintText: "Search...",
        keyboardType: TextInputType.text,
        enabled: true,
        preFixIcon: InkWell(
          onTap: onPrefixTap,
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
            ),
            height: 30,
            width: 30,
            padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorUtils.white,
                size: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActivitiesListThreeDotMBottomSheet extends StatelessWidget {
  final String title;
  final String mobileNo;
  final String email;
  final VoidCallback editOnTap;
  final VoidCallback logFollowupsOnTap;
  final VoidCallback newTaskOnTap;
  final VoidCallback uploadFilesOnTap;
  final VoidCallback attachmentsOnTap;
  final VoidCallback verificationOnTap;
  final VoidCallback autoLoggedMailOnTap;
  final VoidCallback closeInquiriesOnTap;
  final VoidCallback notesOnTap;
  final VoidCallback updateClientLocationOnTap;
  final VoidCallback copyToClipBoardOnTap;
  final VoidCallback callOnTap;
  final VoidCallback shareOnTap;
  final VoidCallback emailOnTap;
  final VoidCallback smsOnTap;

  const ActivitiesListThreeDotMBottomSheet({
    super.key,
    required this.editOnTap,
    required this.logFollowupsOnTap,
    required this.newTaskOnTap,
    required this.uploadFilesOnTap,
    required this.attachmentsOnTap,
    required this.verificationOnTap,
    required this.autoLoggedMailOnTap,
    required this.closeInquiriesOnTap,
    required this.notesOnTap,
    required this.updateClientLocationOnTap,
    required this.copyToClipBoardOnTap,
    required this.callOnTap,
    required this.shareOnTap,
    required this.smsOnTap,
    required this.title,
    required this.mobileNo,
    required this.email,
    required this.emailOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontSize: 16,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  text: mobileNo,
                  fontSize: 14,
                  textColor: ColorUtils.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
                TextWidget(
                  text: email,
                  fontSize: 14,
                  textColor: ColorUtils.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          VerticalSpace(height: 10),
          Divider(height: 1.5, color: ColorUtils.black.withOpacity(0.2)),
          VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                _threeDotInsideItem(
                  icon: ImagesUtils.editIcon,
                  title: "Edit",
                  onTap: editOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.starWithColorIcon,
                  title: "Log follow up",
                  onTap: logFollowupsOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.newTaskIcon,
                  title: "New Task",
                  onTap: newTaskOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.uploadFileIcon,
                  title: "Upload files",
                  onTap: uploadFilesOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.attachmentsIcon,
                  title: "Attachments",
                  onTap: attachmentsOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.attachmentsIcon,
                  title: "Verification",
                  onTap: verificationOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.emailIcon,
                  title: "Auto Logged Mail",
                  onTap: autoLoggedMailOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.closeIcons,
                  title: "Close Inquiries",
                  onTap: closeInquiriesOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.noteIcon,
                  title: "Notes",
                  onTap: notesOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.locationMarkIcon,
                  title: "Update Client Location",
                  onTap: updateClientLocationOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.clipboardIcon,
                  title: "Copy to Clipboard",
                  onTap: updateClientLocationOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.mobileNoIcon,
                  title: "Call",
                  onTap: callOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.shareIcon,
                  title: "Share",
                  onTap: shareOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.emailIcon,
                  title: "Email",
                  onTap: emailOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.smsIcon,
                  title: "SMS",
                  onTap: smsOnTap,
                ),
              ],
            ),
          ),
        ],
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
                color: ColorUtils.secondary,
              ),
              child: Image(
                image: AssetImage(icon),
                height: 13,
                color: ColorUtils.white,
              ),
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
}

class ProjectWorkingListThreeDotMBottomSheet extends StatelessWidget {
  final String projectTitle;
  final VoidCallback checkInOnTap;
  final VoidCallback checkOutOnTap;
  final VoidCallback deleteTodayTimingOnTap;
  final VoidCallback updateProjectLocationOnTap;
  final VoidCallback updateProjectLandMarkOnTap;
  final VoidCallback customerDetailsViewOnTap;
  final VoidCallback logFollowupsOnTap;
  final VoidCallback newTaskOnTap;
  final VoidCallback attachmentsOnTap;
  final VoidCallback verificationOnTap;
  final VoidCallback autoLoggedMailOnTap;
  final VoidCallback notesOnTap;
  final VoidCallback copyToClipBoardOnTap;
  final VoidCallback callOnTap;
  final VoidCallback shareOnTap;
  final VoidCallback emailOnTap;
  final VoidCallback smsOnTap;

  const ProjectWorkingListThreeDotMBottomSheet({
    super.key,
    required this.checkInOnTap,
    required this.logFollowupsOnTap,
    required this.newTaskOnTap,
    required this.attachmentsOnTap,
    required this.verificationOnTap,
    required this.autoLoggedMailOnTap,
    required this.notesOnTap,
    required this.copyToClipBoardOnTap,
    required this.callOnTap,
    required this.shareOnTap,
    required this.smsOnTap,
    required this.projectTitle,
    required this.emailOnTap,
    required this.checkOutOnTap,
    required this.deleteTodayTimingOnTap,
    required this.updateProjectLocationOnTap,
    required this.updateProjectLandMarkOnTap,
    required this.customerDetailsViewOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: projectTitle,
                  fontSize: 16,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          VerticalSpace(height: 10),
          Divider(height: 1.5, color: ColorUtils.black.withOpacity(0.2)),
          VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                _threeDotInsideItem(
                  icon: ImagesUtils.editIcon,
                  title: "Check In",
                  onTap: checkInOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.editIcon,
                  title: "Check Out",
                  onTap: checkOutOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.deleteIcon,
                  title: "Delete Today Timing",
                  onTap: deleteTodayTimingOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.locationMarkIcon,
                  title: "Update Project Location",
                  onTap: updateProjectLocationOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.locationMarkIcon,
                  title: "Update Project Landmark",
                  onTap: checkInOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.commonFileIcon,
                  title: "Customer Detail View",
                  onTap: customerDetailsViewOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.starWithColorIcon,
                  title: "Log follow up",
                  onTap: logFollowupsOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.newTaskIcon,
                  title: "New Task",
                  onTap: newTaskOnTap,
                ),

                _threeDotInsideItem(
                  icon: ImagesUtils.attachmentsIcon,
                  title: "Attachments",
                  onTap: attachmentsOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.verificationIcon,
                  title: "Verification",
                  onTap: verificationOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.emailIcon,
                  title: "Auto Logged Mail",
                  onTap: autoLoggedMailOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.noteIcon,
                  title: "Notes",
                  onTap: notesOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.clipboardIcon,
                  title: "Copy to Clipboard",
                  onTap: copyToClipBoardOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.mobileNoIcon,
                  title: "Call",
                  onTap: callOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.shareIcon,
                  title: "Share",
                  onTap: shareOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.emailIcon,
                  title: "Email",
                  onTap: emailOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.smsIcon,
                  title: "SMS",
                  onTap: smsOnTap,
                ),
              ],
            ),
          ),
        ],
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
                color: ColorUtils.secondary,
              ),
              child: Image(
                image: AssetImage(icon),
                height: 13,
                color: ColorUtils.white,
              ),
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
}


class PendingTaskOtherListThreeDotMBottomSheet extends StatelessWidget {
  final String title;
  final String mobileNo;
  final String email;
  final VoidCallback closeTaskOnTap;
  final VoidCallback callOnTap;
  final VoidCallback shareOnTap;
  final VoidCallback emailOnTap;
  final VoidCallback smsOnTap;

  const PendingTaskOtherListThreeDotMBottomSheet({
    super.key,
    required this.closeTaskOnTap,
    required this.callOnTap,
    required this.shareOnTap,
    required this.smsOnTap,
    required this.title,
    required this.mobileNo,
    required this.email,
    required this.emailOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontSize: 16,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  text: mobileNo,
                  fontSize: 14,
                  textColor: ColorUtils.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
                TextWidget(
                  text: email,
                  fontSize: 14,
                  textColor: ColorUtils.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          VerticalSpace(height: 10),
          Divider(height: 1.5, color: ColorUtils.black.withOpacity(0.2)),
          VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                _threeDotInsideItem(
                  icon: ImagesUtils.closeIcons,
                  title: "Close Task",
                  onTap: closeTaskOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.mobileNoIcon,
                  title: "Call",
                  onTap: callOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.shareIcon,
                  title: "Share",
                  onTap: shareOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.emailIcon,
                  title: "Email",
                  onTap: emailOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.smsIcon,
                  title: "SMS",
                  onTap: smsOnTap,
                ),
              ],
            ),
          ),
        ],
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
                color: ColorUtils.secondary,
              ),
              child: Image(
                image: AssetImage(icon),
                height: 13,
                color: ColorUtils.white,
              ),
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
}

class WorkOrderListThreeDotMBottomSheet extends StatelessWidget {
  final String title;
  final VoidCallback labInfoOnTap;
  final VoidCallback approveOnTap;
  final VoidCallback woQCOnTap;
  final VoidCallback woStatusOnTap;
  final VoidCallback jobComplaintOnTap;
  final VoidCallback processWiseProductionOnTap;
  final VoidCallback fgStockOnTap;


  const WorkOrderListThreeDotMBottomSheet({
    super.key,
    required this.title,
    required this.labInfoOnTap,
    required this.woQCOnTap,
    required this.woStatusOnTap,
    required this.jobComplaintOnTap,
    required this.processWiseProductionOnTap,
    required this.fgStockOnTap,
    required this.approveOnTap

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontSize: 15,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          VerticalSpace(height: 10),
          Divider(height: 1.5, color: ColorUtils.black.withOpacity(0.2)),
          VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                _threeDotInsideItem(
                  icon: ImagesUtils.labInfoIcon,
                  title: "Lab Info",
                  onTap: labInfoOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.likeIcon,
                  title: "Approve",
                  onTap: approveOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.leadInformationIcon,
                  title: "WO QC",
                  onTap: woQCOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.uploadFileIcon,
                  title: "WO Status",
                  onTap: woStatusOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.complaintIcon,
                  title: "Job Complaint",
                  onTap: jobComplaintOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.creativeThinkingIcon,
                  title: "Process wise production",
                  onTap: processWiseProductionOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.lineChartIcon,
                  title: "FG Stock",
                  onTap: fgStockOnTap,
                ),
              ],
            ),
          ),
        ],
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
                color: ColorUtils.secondary,
              ),
              child: Image(
                image: AssetImage(icon),
                height: 13,
                color: ColorUtils.white,
              ),
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
}


class LeadLocationRouteListThreeDotMBottomSheet extends StatelessWidget {
  final String title;
  final String mobileNo;
  final String email;
  final VoidCallback updateClientLocationOnTap;
  final VoidCallback callOnTap;
  final VoidCallback shareOnTap;
  final VoidCallback updateLandMarkLocationOnTap;
  final VoidCallback shareClientLocation;

  const LeadLocationRouteListThreeDotMBottomSheet({
    super.key,
    required this.title,
    required this.mobileNo,
    required this.email,
    required this.updateClientLocationOnTap,
    required this.callOnTap,
    required this.shareOnTap,
    required this.updateLandMarkLocationOnTap,
    required this.shareClientLocation,




  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontSize: 16,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  text: mobileNo,
                  fontSize: 14,
                  textColor: ColorUtils.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
                TextWidget(
                  text: email,
                  fontSize: 14,
                  textColor: ColorUtils.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          VerticalSpace(height: 10),
          Divider(height: 1.5, color: ColorUtils.black.withOpacity(0.2)),
          VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                _threeDotInsideItem(
                  icon: ImagesUtils.locationMarkIcon,
                  title: "Update client location",
                  onTap: updateClientLocationOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.mobileNoIcon,
                  title: "Call",
                  onTap: callOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.shareIcon,
                  title: "Share",
                  onTap: shareOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.locationMarkIcon,
                  title: "Update landmark Location",
                  onTap: updateLandMarkLocationOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.shareIcon,
                  title: "Share client location",
                  onTap: shareClientLocation,
                ),

              ],
            ),
          ),
        ],
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
                color: ColorUtils.secondary,
              ),
              child: Image(
                image: AssetImage(icon),
                height: 13,
                color: ColorUtils.white,
              ),
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
}

class PendingTaskNoteListThreeDotMBottomSheet extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback editOnTap;
  final VoidCallback deleteOnTap;

  const PendingTaskNoteListThreeDotMBottomSheet({
    super.key,
    required this.title,
    required this.date,
    required this.editOnTap,
    required this.deleteOnTap,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontSize: 16,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
                TextWidget(
                  text: date,
                  fontSize: 14,
                  textColor: ColorUtils.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          VerticalSpace(height: 10),
          Divider(height: 1.5, color: ColorUtils.black.withOpacity(0.2)),
          VerticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                _threeDotInsideItem(
                  icon: ImagesUtils.editIcon,
                  title: "Edit",
                  onTap: editOnTap,
                ),
                _threeDotInsideItem(
                  icon: ImagesUtils.deleteIcon,
                  title: "Delete",
                  onTap: deleteOnTap,
                ),
              ],
            ),
          ),
        ],
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
                color: ColorUtils.secondary,
              ),
              child: Image(
                image: AssetImage(icon),
                height: 13,
                color: ColorUtils.white,
              ),
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
}


class LabelValueWidget extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? labelOnTap;
  final TextDecoration? textDecoration;
  final int maxLines;
  final Color? labelColor;

  const LabelValueWidget({
    super.key,
    required this.label,
    required this.value,
    this.labelOnTap,
    this.textDecoration,
    this.maxLines = 1,
    this.labelColor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LABEL
          Expanded(
            flex: 3,
            child: TextWidget(
              text: label.toUpperCase(),
              fontSize: 12,
              textColor: ColorUtils.black,
              // textColor: ColorUtils.secondary,
              //textColor: Color(0xff341f97),
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(width: 5),

          /// VALUE
          Expanded(
            flex: 7,
            child: GestureDetector(
              onTap: labelOnTap,
              child: TextWidget(
                text: value,
                maxLines: maxLines,
                fontSize: 12,
                textColor:labelColor?? ColorUtils.black.withOpacity(0.66),
                fontWeight: FontWeight.w500,
                textDecoration: textDecoration,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



/// isDefaultRadiusChecked jis screen pe main user karunga MapRadiusTrackerWidget ushi screen pe mujhe input lena hai user se
/// baaki sare cheeze dekh lo sahi se apply to kiye hai na
/// check box ka value ushi screen pe lunga main
/// sliderOnChanged sahi apply kiye ya nhi ye check kar lena
class MapRadiusTrackerWidget extends StatefulWidget {
  final double sliderMinValue;
  final double sliderMaxValue;
  final double sliderValue;
  final String sliderLabel;
  final Function(double)? sliderOnChanged;
  const MapRadiusTrackerWidget({
    super.key,
    required this.sliderMinValue,
    required this.sliderMaxValue,
    required this.sliderValue,
    required this.sliderLabel,
    this.sliderOnChanged,
  });

  @override
  State<MapRadiusTrackerWidget> createState() => _MapRadiusTrackerWidgetState();
}

class _MapRadiusTrackerWidgetState extends State<MapRadiusTrackerWidget> {
  bool isLeadNearAboutContentExpanded = false;
  bool isDefaultRadiusChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'Lead Near about',
                          fontSize: 14,
                          textColor: ColorUtils.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                        TextWidget(
                          text: 'Tap to change the radius',
                          fontSize: 12,
                          textColor: ColorUtils.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: '${widget.sliderValue.round()} Kms',
                          fontSize: 14,
                          textColor: ColorUtils.orangeAccent,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 6),
                        Icon(
                          isLeadNearAboutContentExpanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
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
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: ColorUtils.primary,
                          inactiveTrackColor: ColorUtils.grey.withOpacity(0.3),
                          thumbColor: ColorUtils.primary,
                          trackHeight: 4,
                          overlayShape: SliderComponentShape.noOverlay,
                          valueIndicatorColor: ColorUtils.black,
                          valueIndicatorTextStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Slider(
                          min: widget.sliderMinValue,
                          max: widget.sliderMaxValue,
                          value: widget.sliderValue,
                          label: widget.sliderLabel,
                          onChanged: widget.sliderOnChanged,
                        ),
                      ),
                    ),
                    TextWidget(
                      text: '50',
                      fontSize: 14,
                      textAlign: TextAlign.center,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),

                VerticalSpace(height: 14),

                /// ================= CHECKBOX =================
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isDefaultRadiusChecked = !isDefaultRadiusChecked;
                        });
                      },
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: isDefaultRadiusChecked
                              ? const Color(0xff007BFF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isDefaultRadiusChecked
                                ? const Color(0xff007BFF)
                                : const Color(0xFFEAECF0),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Default Radius',
                            fontSize: 14,
                            textAlign: TextAlign.center,
                            textColor: ColorUtils.black.withOpacity(0.7),
                            fontWeight: FontWeight.w600,
                          ),
                          TextWidget(
                            text:
                                'Check box set selected radius as a default radius for next time',
                            fontSize: 12,
                            textAlign: TextAlign.start,
                            textColor: ColorUtils.black.withOpacity(0.7),
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
    );
  }
}



class LeadInformationInnerWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor ;
  const LeadInformationInnerWidget({super.key, required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TextWidget(
              text: label,
              fontSize: 13,
              textAlign: TextAlign.start,
              textColor: ColorUtils.primary,
              // textColor: Color(0xff1F1F1F),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextWidget(
            text: ':',
            fontSize: 12,
            textAlign: TextAlign.start,
            textColor: ColorUtils.black.withOpacity(0.85),
            fontWeight: FontWeight.w700,
          ),
          Expanded(
            flex: 3,
            child: TextWidget(
              text: ' $value',
              fontSize: 14,
              textAlign: TextAlign.start,
              textColor:valueColor??ColorUtils.black.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}


class LeadInformationInnerWidgetWithValueIcon extends StatelessWidget {
  final String label;
  final String value;
  final String? valueIcon;
  final bool isUnderline;
  final VoidCallback? onTap;

  const LeadInformationInnerWidgetWithValueIcon({
    super.key,
    required this.label,
    required this.value,
    this.valueIcon,
    this.isUnderline = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label
          Expanded(
            flex: 1,
            child: TextWidget(
              text: label,
              fontSize: 13,
              textAlign: TextAlign.start,
              textColor: ColorUtils.primary,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// :
          TextWidget(
            text: ': ',
            fontSize: 12,
            textColor: ColorUtils.black.withOpacity(0.85),
            fontWeight: FontWeight.w700,
          ),

          /// Value + Icon
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (valueIcon != null)
                  SizedBox(
                    height: 15,
                    width: 15,
                    child: Image.asset(
                      valueIcon!,
                      height: 14,
                      color: ColorUtils.secondary,
                    ),
                  ),

                if (valueIcon != null)
                  const HorizontalSpace(width: 5),

                Expanded(
                  child: GestureDetector(
                    onTap: onTap,
                    child: TextWidget(
                      text: value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.secondary,
                      fontWeight: FontWeight.w500,
                      textDecoration:
                      isUnderline ? TextDecoration.underline : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
