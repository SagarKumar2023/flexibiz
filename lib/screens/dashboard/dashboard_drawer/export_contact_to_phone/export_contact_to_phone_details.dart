import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';


class ExportContactToPhoneDetails extends StatefulWidget {
  const ExportContactToPhoneDetails({super.key});

  @override
  State<ExportContactToPhoneDetails> createState() => _ExportContactToPhoneDetailsState();
}

class _ExportContactToPhoneDetailsState extends State<ExportContactToPhoneDetails> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        titleSpacing: -8,
        centerTitle: true,
        title: TextWidget(
          text: "Export contact to phone".toUpperCase(),
          fontSize: 15,
          maxLine: 2,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),


      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: CommonBoxDecorations.screenBackgroundDecoration,
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }

}


