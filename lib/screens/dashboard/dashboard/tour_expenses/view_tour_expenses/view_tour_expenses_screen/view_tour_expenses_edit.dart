import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/date_formatter_utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/snackBarUtils.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/local_database/hive_database_utils/hive_database.dart';
import 'package:flexibiz/local_database/hive_model/new_tour_expense_hive_model/new_tour_expense_hive_model.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/TextField_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewTourExpensesEdit extends StatefulWidget {
  final NewTourExpenseHiveModel item;

  const ViewTourExpensesEdit({super.key, required this.item});

  @override
  State<ViewTourExpensesEdit> createState() => _ViewTourExpensesEditState();
}

class _ViewTourExpensesEditState extends State<ViewTourExpensesEdit> {

  TextEditingController remarkCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    remarkCtr.text = widget.item.tourRemark;
  }

  void _updateRemark() async {
    if (remarkCtr.text.trim().isEmpty) {
      SnackBarUtils.showWarning(
        'Warning',
        'Please enter remark',
      );
      return;
    }

    widget.item.tourRemark = remarkCtr.text.trim();
    await widget.item.save();

    SnackBarUtils.showSuccess(
      'Success',
      'Remark updated successfully',
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.lightScreenBackground,
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "Edit tour expenses".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ButtonWidget(
          navigateTo: _updateRemark,
          buttonName: 'Submit',
          borderRadius: 30,
          width: double.infinity,
          height: 50,
          buttonTextColor: ColorUtils.white,
          buttonColor: ColorUtils.primary,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: 'Tour',
                fontSize: 15,
                textAlign: TextAlign.center,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
              const VerticalSpace(height: 5),
              Container(
                padding: EdgeInsets.all(13),
                width: screenWidth(context),
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
                child:TextWidget(
                  text: widget.item.tourName,
                  fontSize: 14,
                  textAlign: TextAlign.start,
                  textColor: ColorUtils.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              VerticalSpace(height: 10),
              TextWidget(
                text: 'Date',
                fontSize: 15,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              Container(
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
                      text:DateFormatterUtils.formatDate(widget.item.tourDate),
                      fontSize: 14,
                      textColor: ColorUtils.black.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 10),
              TextWidget(
                text: 'Remark',
                fontSize: 15,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
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
                  controller: remarkCtr,
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
                    hintText: 'Remarks',
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
              VerticalSpace(height: 10),
              TextWidget(
                text: 'Amount',
                fontSize: 15,
                textColor: ColorUtils.primary,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(13),
                width: screenWidth(context),
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
                child: TextWidget(
                  text: widget.item.tourAmount,
                  fontSize: 14,
                  textAlign: TextAlign.start,
                  textColor:ColorUtils.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
              VerticalSpace(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}