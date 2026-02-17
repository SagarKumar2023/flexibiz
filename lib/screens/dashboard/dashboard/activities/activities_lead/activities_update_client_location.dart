import 'package:flexibiz/constant/color_Utils.dart';
import 'package:flexibiz/constant/images.dart';
import 'package:flexibiz/constant/screen_Size.dart';
import 'package:flexibiz/constant/spacer.dart';
import 'package:flexibiz/widgets/Button_widget.dart';
import 'package:flexibiz/widgets/arrow_back_button_widget.dart';
import 'package:flexibiz/widgets/text_widget.dart';
import 'package:flexibiz/widgets/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ActivitiesUpdateClientLocation extends StatefulWidget {
  const ActivitiesUpdateClientLocation({super.key});

  @override
  State<ActivitiesUpdateClientLocation> createState() => _ActivitiesUpdateClientLocationState();
}

class _ActivitiesUpdateClientLocationState extends State<ActivitiesUpdateClientLocation> {

  double audioProgress = 0.0;
  final ImagePicker _picker = ImagePicker();

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
          text: "ActivitiesUpdateClientLocation".toUpperCase(),
          fontSize: 15,
          textColor: ColorUtils.white,
          fontWeight: FontWeight.w700,
        ),
        leading: ArrowBackButtonWidget(onTap: ()=>Navigator.of(context).pop()),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        decoration: const BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              decoration: BoxDecoration(
                                // color: ColorUtils.primary,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextWidget(
                                      text: 'Attachment From',
                                      fontSize: 16,
                                      textColor: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorUtils.red,
                                        border: Border.all(
                                          color: ColorUtils.red.withOpacity(0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child:  Icon(
                                        Icons.close,
                                        size: 20,
                                        color: ColorUtils.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalSpace(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Column(
                                children: [
                                  _threeDotInsideItem(
                                    icon: ImagesUtils.cameraIcon,
                                    title: "Camera",

                                    onTap: () {
                                      /// camera open hoga photo click karne ke liye click kar ke ok karega user tab photo wala section me display hoga
                                      /// multiple kar sakta hai isliye wrap widget use kar lena
                                    },
                                  ),
                                  _threeDotInsideItem(
                                    icon: ImagesUtils.videoIcon,
                                    title: "Video",

                                    onTap: () {
                                      /// camera open hoga video ke liye  ok karega user tab video wala section me display hoga
                                      /// multiple kar sakta hai isliye wrap widget use kar lena
                                    },
                                  ),
                                  _threeDotInsideItem(
                                    icon: ImagesUtils.audioIcon,
                                    title: "Audio",
                                    onTap: () {
                                      /// dialog open hoga
                                      /// title hoga MY recording
                                      /// silder
                                      /// bottom center me record karne ka icon
                                      /// 00:00  se 5:00 min tak kar sakta user record audio
                                      /// icon ke click pe record
                                      /// audio record karega user apna ok ke click pe save hoga audio with kitne min ya sec ka hai audio kistime record kiya gaya tha
                                      /// fir audio wala section me display kar dena user play kar ke sun sakta hai audio
                                    },
                                  ),
                                  _threeDotInsideItem(
                                    icon: ImagesUtils.fileExplorerIcon,
                                    title: "File Explorer",
                                    onTap: () {
                                      /// file open hoga video image dono upload kar sakta hai  user
                                      /// image hai to image wala section me dikhe video hai to video wala section dikhe
                                    },
                                  ),
                                  _threeDotInsideItem(
                                    icon: ImagesUtils.cloudServerIcon,
                                    title: "Server",
                                    onTap: () {
                                      /// is pe kuch nhi karna hai tumhe abhi
                                    },
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  );
                },
                child: Image(image: AssetImage(ImagesUtils.attachmentsIcon),color: ColorUtils.white,height: 20,)),
          )

        ],
      ),
      body: Container(
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
              text: 'You are requested to add your remark with attached files.',
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
            TextWidget(
              text: 'Photos',
              fontSize: 14,
              textAlign: TextAlign.start,
              textColor:ColorUtils.black.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),

            SizedBox(
              height: 70,
              width: 70,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 6,right: 6),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorUtils.black.withOpacity(0.3),
                      image: DecorationImage(image: AssetImage(ImagesUtils.bgSmallCardOne),fit: BoxFit.fill), /// image ko dikhane kiye
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      /// image ko selected image ko remove karne ke liye
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.red,
                        border: Border.all(
                          color: ColorUtils.red.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child:  Icon(
                        Icons.close,
                        size: 20,
                        color: ColorUtils.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpace(height: 12),
            TextWidget(
              text: 'Videos',
              fontSize: 14,
              textAlign: TextAlign.start,
              textColor:ColorUtils.black.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 70,
              width: 70,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 6,right: 6),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorUtils.black.withOpacity(0.3),
                      image: DecorationImage(image: AssetImage(ImagesUtils.bgSmallCardOne),fit: BoxFit.fill), /// image ko dikhane kiye
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      /// image ko selected image ko remove karne ke liye
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 6),
                      height: 23,
                      width: 23,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorUtils.red,
                        border: Border.all(
                          color: ColorUtils.red.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child:  Icon(
                        Icons.close,
                        size: 20,
                        color: ColorUtils.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextWidget(
              text: 'Audios',
              fontSize: 14,
              textAlign: TextAlign.start,
              textColor:ColorUtils.black.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
            Container(
              width: screenWidth(context),
              padding: const EdgeInsets.only(left: 10,right: 10,top: 3,bottom: 3),
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
                  InkWell(
                    onTap: (){
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,

                      ),
                      height: 45,
                      width: 45,
                      child: Center(child: Icon(Icons.person, color: ColorUtils.white,size: 23,),),
                    ),
                  ),

                  HorizontalSpace(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage(ImagesUtils.playAudioIcon),
                              color: ColorUtils.black.withOpacity(0.8),
                              height: 20,
                            ),

                            const SizedBox(width: 10),
                            Expanded(
                              child: SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 3,
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 6,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 12,
                                  ),
                                  activeTrackColor: ColorUtils.primary,
                                  inactiveTrackColor: ColorUtils.primary.withOpacity(0.2),
                                  thumbColor: ColorUtils.primary,
                                  overlayColor: ColorUtils.primary.withOpacity(0.15),
                                ),
                                child: Slider(
                                  min: 0,
                                  max: 1,
                                  value: audioProgress,
                                  onChanged: (value) {
                                    setState(() {
                                      audioProgress = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        VerticalSpace(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: '11:10',
                              fontSize: 10,
                              textAlign: TextAlign.start,
                              textColor:ColorUtils.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                            ),
                            TextWidget(
                              text: '12:40 PM',
                              fontSize: 10,
                              textAlign: TextAlign.start,
                              textColor:ColorUtils.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),

            Spacer(),
            ButtonWidget(
              navigateTo: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MediaScreen(),));
              } ,
              buttonName: 'Upload',
              borderRadius: 30,
              width: screenWidth(context),
              height: 50,
              buttonTextColor: ColorUtils.white,
              buttonColor: ColorUtils.primary,
            ),
            VerticalSpace(height: 10),

          ],
        ),
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
                  color: ColorUtils.secondary
              ),
              child: Image(image: AssetImage(icon),height: 13,color: ColorUtils.white,),
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












