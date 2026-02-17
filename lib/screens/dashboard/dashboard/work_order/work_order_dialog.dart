import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class WorkOrderDialog extends StatefulWidget {
  final String dialogTitle;
  final TextEditingController nameCtr;
  final TextEditingController jobNameCtr;
  final VoidCallback onDismiss;
  final VoidCallback onOk;

  const WorkOrderDialog({
    super.key,
    required this.nameCtr,
    required this.jobNameCtr,
    required this.onDismiss,
    required this.onOk,
    required this.dialogTitle,
  });

  @override
  State<WorkOrderDialog> createState() => _WorkOrderDialogState();
}

class _WorkOrderDialogState extends State<WorkOrderDialog> {
  String unitSelectValue = 'None';
  List<String> selectedUnits = [];

  final List<String> unitCategoryList = [
    'UNIT NO 4 UNDER COMPANY',
    'UNIT 1- DELHI',
    'UNIT 2- NOIDA'
  ];
  bool isSelectAll = false;
  bool isShowClosed = false;

  void _onSelectAllTap() {
    setState(() {
      isSelectAll = !isSelectAll;
      if (isSelectAll) {
        isShowClosed = false;
      }
    });
  }

  void _onShowClosedTap() {
    setState(() {
      isShowClosed = !isShowClosed;
      if (isShowClosed) {
        isSelectAll = false;
      }
    });
  }


  Widget _checkBox(bool isChecked, VoidCallback onTap){
    return InkWell(
      onTap: onTap,
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
    ) ;
  }

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
                    text: 'Job Name',
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
                      controller: widget.jobNameCtr,
                      borderRadius: 30,
                      hintText: "Enter Job Name",
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
                  const VerticalSpace(height: 10),
                  const TextWidget(
                    text: 'Unit',
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    textColor: Color(0xff1F1F1F),
                    fontWeight: FontWeight.w500,
                  ),
                  const VerticalSpace(height: 5),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
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
                  child: PopupMenuButton<String>(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    color: ColorUtils.white,
                    constraints: const BoxConstraints(maxHeight: 250),
                    onSelected: (_) {}, // not used
                    itemBuilder: (context) {
                      return unitCategoryList.map((item) {
                        return PopupMenuItem<String>(
                          value: item,
                          enabled: false,
                          child: StatefulBuilder(
                            builder: (context, menuSetState) {
                              final bool isSelected = selectedUnits.contains(item);
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      selectedUnits.remove(item);
                                    } else {
                                      selectedUnits.add(item);
                                    }
                                  });
                                  menuSetState(() {});
                                },
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (isSelected) {
                                            selectedUnits.remove(item);
                                          } else {
                                            selectedUnits.add(item);
                                          }
                                        });
                                        menuSetState(() {});
                                      },
                                      borderRadius: BorderRadius.circular(4),
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? const Color(0xff007BFF)
                                              : Colors.white,
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(
                                            color: isSelected
                                                ? const Color(0xff007BFF)
                                                : const Color(0xFFEAECF0),
                                            width: 2,
                                          ),
                                        ),
                                        child: isSelected
                                            ? Image(
                                          height: 18,
                                          width: 18,
                                          color: ColorUtils.white,
                                          image:
                                          AssetImage(ImagesUtils.checkIcon),
                                        )
                                            : null,
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Expanded(
                                      child: TextWidget(
                                        text: item,
                                        fontSize: 14,
                                        textColor: ColorUtils.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }).toList();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: TextWidget(
                              text: selectedUnits.isEmpty
                                  ? "Select Units"
                                  : selectedUnits.join(", "),
                              fontSize: 14,
                              textColor: ColorUtils.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: ColorUtils.secondary.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 20,
                            color: ColorUtils.secondary.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const VerticalSpace(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _checkBox(isSelectAll, _onSelectAllTap),
                      const HorizontalSpace(width: 8),
                      GestureDetector(
                        onTap:_onSelectAllTap,
                        child: const TextWidget(
                          text: 'Select All',
                          fontSize: 14,
                          textAlign: TextAlign.center,
                          textColor: Color(0xff27364E),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const HorizontalSpace(width: 30),
                      Spacer(),
                        Row(
                          children: [
                            _checkBox(isShowClosed, _onShowClosedTap),                            const HorizontalSpace(width: 8),
                            GestureDetector(
                              onTap: _onShowClosedTap,
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