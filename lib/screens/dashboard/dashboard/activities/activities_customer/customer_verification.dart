import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature/signature.dart';

class CustomerVerification extends StatefulWidget {
  const CustomerVerification({super.key});

  @override
  State<CustomerVerification> createState() => _CustomerVerificationState();
}

class _CustomerVerificationState extends State<CustomerVerification> {

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

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
          text: "Flexibiz erp".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(12),
          height: screenHeight(context),
          width: screenWidth(context),
          decoration: CommonBoxDecorations.screenBackgroundDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Dear User,',
                fontSize: 14,
                textAlign: TextAlign.start,
                textColor:ColorUtils.black.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
              TextWidget(
                text: 'You are requested to add your remark with attached Signature.',
                fontSize: 13,
                textAlign: TextAlign.start,
                textColor:ColorUtils.black.withOpacity(0.75),
                fontWeight: FontWeight.w500,
              ),
              VerticalSpace(height: 12),
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
                    hintText: 'Type Here...',
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
              Container(
                height: screenHeight(context) * 0.53,
                width: screenWidth(context),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Your Signature',
                      fontSize: 14,
                      textAlign: TextAlign.start,
                      textColor: ColorUtils.black.withOpacity(0.8),
                      fontWeight: FontWeight.w600,
                    ),
                    Expanded(
                      child: Container(
                        child: Signature(
                          controller: _signatureController,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            _signatureController.clear(); // clear signature
                          },
                          child: const Text("Clear"),
                        ),
                        TextButton(
                          onPressed: () async {
                            var data = await _signatureController.toPngBytes();
                            if (data != null) {
                              // data me PNG bytes milenge, aap save ya upload kar sakte ho
                              print("Signature captured, length: ${data.length}");
                            }
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ButtonWidget(
                navigateTo: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MediaScreen(),));
                } ,
                buttonName: 'Submit',
                borderRadius: 30,
                width: screenWidth(context),
                height: 50,
                buttonTextColor: ColorUtils.white,
                buttonColor: ColorUtils.primary,
              ),
              VerticalSpace(height: 8),
        
            ],
          ),
        ),
      ),
    );
  }
}












