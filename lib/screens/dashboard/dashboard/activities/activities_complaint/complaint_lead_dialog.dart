import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ComplaintLeadDialog extends StatefulWidget {
  final String dialogTitle;
  final TextEditingController nameCtr;
  final TextEditingController mobileNoCtr;
  final TextEditingController emailCtr;
  final bool showMapView;
  final bool showClosed;

  final VoidCallback? onMapTap;
  final VoidCallback onDismiss;
  final VoidCallback onOk;

  const ComplaintLeadDialog({
    super.key,
    required this.nameCtr,
    required this.mobileNoCtr,
    required this.emailCtr,
    required this.onDismiss,
    required this.onOk,
    this.showMapView = false,
    this.showClosed = false,
    this.onMapTap,
    required this.dialogTitle,
  });

  @override
  State<ComplaintLeadDialog> createState() => _ComplaintLeadDialogState();
}

class _ComplaintLeadDialogState extends State<ComplaintLeadDialog> {
  bool isChecked = false;
  bool isStarred = false;
  bool isCheckedShowClosed = false;


  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 425,
        child: Stack(
          children: [
            Container(
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
                  const TextWidget(
                    text: 'Name',
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    textColor: Color(0xff1F1F1F),
                    fontWeight: FontWeight.w500,
                  ),
                  const VerticalSpace(height: 5),
                  Container(
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
                    child: TextFieldWidget(
                      cursorColor: ColorUtils.grey,
                      focusBorderColor: ColorUtils.white.withOpacity(0.9),
                      disableBorderColor: ColorUtils.white.withOpacity(0.3),
                      enableBorderColor: ColorUtils.white.withOpacity(0.9),
                      hintTextColor:ColorUtils.grey,
                      labelTextColor:ColorUtils.grey,
                      controller: widget.nameCtr,
                      borderRadius: 30,
                      hintText: "Enter Name",
                      keyboardType: TextInputType.url,
                      enabled: true,
                      suffixIcon: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.person,
                          color: ColorUtils.grey.withOpacity(0.65),
                        ),
                      ),
                    ),
                  ),
                  const VerticalSpace(height: 10),
                  const TextWidget(
                    text: 'Mobile No',
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    textColor: Color(0xff1F1F1F),
                    fontWeight: FontWeight.w500,
                  ),
                  const VerticalSpace(height: 5),
                  Container(
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
                    child: TextFieldWidget(
                      cursorColor: ColorUtils.grey,
                      focusBorderColor: ColorUtils.white.withOpacity(0.9),
                      disableBorderColor: ColorUtils.white.withOpacity(0.3),
                      enableBorderColor: ColorUtils.white.withOpacity(0.9),
                      hintTextColor:ColorUtils.grey,
                      labelTextColor:ColorUtils.grey,
                      controller: widget.mobileNoCtr,
                      borderRadius: 30,
                      hintText: "Enter Mobile No",
                      keyboardType: TextInputType.visiblePassword,
                      enabled: true, // always enabled
                      suffixIcon: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.call,
                          color: ColorUtils.grey.withOpacity(0.65),
                        ),
                      ),
                    ),
                  ),
                  const VerticalSpace(height: 10),
                  const TextWidget(
                    text: 'Email',
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    textColor: Color(0xff1F1F1F),
                    fontWeight: FontWeight.w500,
                  ),
                  const VerticalSpace(height: 5),
                  Container(
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
                    child: TextFieldWidget(
                      cursorColor: ColorUtils.grey,
                      focusBorderColor: ColorUtils.white.withOpacity(0.9),
                      disableBorderColor: ColorUtils.white.withOpacity(0.3),
                      enableBorderColor: ColorUtils.white.withOpacity(0.9),
                      hintTextColor:ColorUtils.grey,
                      labelTextColor:ColorUtils.grey,
                      controller: widget.emailCtr,
                      borderRadius: 30,
                      hintText: "Enter Email",
                      keyboardType: TextInputType.emailAddress,
                      enabled: true, // always enabled
                      suffixIcon: Container(
                        height: 30,
                        width: 30,
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.email_outlined,
                          color: ColorUtils.grey.withOpacity(0.65),
                        ),
                      ),
                    ),
                  ),
                  const VerticalSpace(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color:isChecked ? Color(0xff007BFF) : Colors.white,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: isChecked ? Color(0xff007BFF) : Color(0xFFEAECF0),
                              width: 2,
                            ),
                          ),
                          child: isChecked ?
                          Image(height: 18,width:18,color: ColorUtils.white,image: AssetImage(ImagesUtils.checkIcon))
                              : null,
                        ),
                      ),
                      const HorizontalSpace(width: 8),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: const TextWidget(
                          text: 'Select All',
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff27364E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const HorizontalSpace(width: 30),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isStarred = !isStarred;
                          });
                          debugPrint("Star Value: $isStarred");
                        },
                        child: Image(
                          image: AssetImage(
                            isStarred
                                ? ImagesUtils.starWithColorIcon
                                : ImagesUtils.starWithoutColorIcon,
                          ),
                          height: 18,
                        ),
                      ),
                      Spacer(),
                      if(widget.showMapView)
                      InkWell(
                        onTap: widget.onMapTap,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                ImagesUtils.locationMarkIcon,
                              ),
                              height: 15,
                              color: ColorUtils.secondary,
                            ),
                            HorizontalSpace(width: 5),
                            TextWidget(
                              text: "Map view",
                              fontSize: 15,
                              textAlign: TextAlign.center,
                              textColor: ColorUtils.secondary,
                              softSwap: true,
                              overflow: TextOverflow.visible,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      if(widget.showClosed)
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isCheckedShowClosed = !isCheckedShowClosed;
                              });
                            },
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color:isCheckedShowClosed ? Color(0xff007BFF) : Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: isCheckedShowClosed ? Color(0xff007BFF) : Color(0xFFEAECF0),
                                  width: 2,
                                ),
                              ),
                              child: isCheckedShowClosed ?
                              Image(height: 18,width:18,color: ColorUtils.white,image: AssetImage(ImagesUtils.checkIcon))
                                  : null,
                            ),
                          ),
                          const HorizontalSpace(width: 8),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isCheckedShowClosed = !isCheckedShowClosed;
                              });
                            },
                            child: const TextWidget(
                              text: 'Show Closed',
                              fontSize: 14,
                              textAlign: TextAlign.center,
                              textColor: Color(0xff27364E),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const VerticalSpace(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonWidget(
                          navigateTo:widget.onDismiss ,
                          buttonName: 'Dismiss',
                          borderRadius: 30,
                          height: 50,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                      HorizontalSpace(width: 8),
                      Expanded(
                        child: ButtonWidget(
                          navigateTo: widget.onOk,
                          buttonName: 'Ok',
                          borderRadius: 30,
                          height: 50,
                          buttonTextColor: ColorUtils.white,
                          buttonColor: ColorUtils.primary,
                        ),
                      ),
                    ],
                  )
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
                  text:widget.dialogTitle,
                  fontSize: 15.5,
                  textColor: ColorUtils.secondary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





