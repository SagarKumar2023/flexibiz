import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SavedUsers extends StatefulWidget {
  const SavedUsers({super.key});

  @override
  State<SavedUsers> createState() => _SavedUsersState();
}

class _SavedUsersState extends State<SavedUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        surfaceTintColor: ColorUtils.primary,
        backgroundColor: ColorUtils.primary,
        centerTitle: true,
        title: TextWidget(
          text: "Choose a User",
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),

      ),

      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: EdgeInsets.all(12),
       // color:ColorUtils.lightScreenBackground,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
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
          children: [
            Container(
              width: screenWidth(context),
              padding: EdgeInsets.only(left: 8,right: 12,top: 7,bottom: 7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
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
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.grey
                    ),
                    child: Center(
                      child: Icon(Icons.person,color: ColorUtils.white,),
                    ),
                  ),
                  HorizontalSpace(width: 12),
                  const TextWidget(
                    text: 'Super@1145',
                    fontSize: 16,
                    textAlign: TextAlign.center,
                    textColor: Color(0xff1F1F1F),
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){},
                    child: Container(
                        height: 25,
                        width: 25,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFEAECF0),
                            width: 1,
                          ),
                        ),
                        child: Image(image: AssetImage(ImagesUtils.closeIcons),height: 20,color: ColorUtils.secondary,width: 10,)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
