import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';
import 'package:ubenwa_nkechi/features/onboard/view/view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentIndex = 0;
  bool fading = false;


  @override
  Widget build(BuildContext context) {
    final onboardTextItem = textList[currentIndex];
    final onboardItem = _items[currentIndex];
    return Scaffold(
      body: Column(
        children: [
            SizedBox(
            height: 152.h,
          ),
          SwipeDetector(
            onSwipeRight: (){
              setState(() {
                if(currentIndex <= 0){
                  currentIndex = 0;
                }else{
                  fading = true;
                  currentIndex--;
                }
              });
            },
            onSwipeLeft: (){
              setState(() {
                if(currentIndex >= _items.length -1){
                  currentIndex = _items.length -1;
                }else{
                  fading = true;
                  currentIndex++;
                }
              });
            },
            child: SizedBox(
              height: 324.h,
              width: double.maxFinite,
              child: OnboardBuild(model: onboardItem, page: currentIndex, fading: fading,),
            ),
          ),
           SizedBox(
            height: 43.h,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: _items.length,
            effect:  ExpandingDotsEffect(
              spacing: 2,
              dotColor: const Color(0xFFD3DEFC),
              dotHeight: 6,
              dotWidth: 6,
              activeDotColor: currentIndex.isEven?
              Theme.of(context).colorScheme.secondary:
              Theme.of(context).colorScheme.primary,
            ),
          ),
           SizedBox(
            height: 41.h,
          ),

          SwipeDetector(
            onSwipeRight: (){
              setState(() {
                if(currentIndex <= 0){
                  currentIndex = 0;
                }else{
                  fading = true;
                  currentIndex--;
                }
              });
            },
            onSwipeLeft: (){
              setState(() {
                if(currentIndex >= _items.length -1){
                  currentIndex = _items.length -1;
                }else{
                  fading = true;
                  currentIndex++;
                }
              });
            },
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: fading? 0.5: 1.0,
              curve: Curves.ease,
              onEnd: (){
                setState(() {
                  fading = false;
                });
              },
              child: SizedBox(
                  height: 347.h,
                  width: double.maxFinite,
                  child: OnboardTextBuild(
                    model: onboardTextItem,
                    pressed1: (){
                      setState(() {
                        currentIndex --;
                      });
                    },
                    pressed2: (){
                      setState(() {
                        currentIndex++;
                      });
                    },
                  ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

final List<OnboardModel>_items = [
  const OnboardModel(
    onboardMomPath: AppImage.mom1,
    onboardBabyPath: AppImage.baby1,
    onboardAuxBaby1Path: AppImage.auxBabyPacifier,
    onboardAuxBaby2Path: AppImage.auxBabySmile,
    onboardAuxBaby3Path: AppImage.auxBabyCry,
  ),
  const OnboardModel(
    onboardMomPath: AppImage.mom2,
    onboardBabyPath: AppImage.baby2,
    onboardAuxBaby1Path: AppImage.auxBabyCalm,
    onboardAuxBaby2Path: AppImage.auxBabyPacifier,
    onboardAuxBaby3Path: AppImage.auxBabySmile,
  ),
  const OnboardModel(
    onboardMomPath: AppImage.mom3,
    onboardBabyPath: AppImage.baby3,
    onboardAuxBaby1Path: AppImage.auxBabyCry,
    onboardAuxBaby2Path: AppImage.auxBabyCalm,
    onboardAuxBaby3Path: AppImage.auxBabyPacifier,
  ),
  const OnboardModel(
    onboardMomPath: AppImage.mom4,
    onboardBabyPath: AppImage.baby4,
    onboardAuxBaby1Path: AppImage.auxBabySmile,
    onboardAuxBaby2Path: AppImage.auxBabyCry,
    onboardAuxBaby3Path: AppImage.auxBabyCalm,
  ),
];


final List<OnboardTextModel>textList =[
   OnboardTextModel(title: 'Welcome to a New\n Mothering Experince',
     subTitle: 'Now you can understand a lot about your new born, '
       'bukkle up for an experince you will always long for.',buttonTitle2: 'Show me How',),
   OnboardTextModel(title: 'A Cry with Meaning', subTitle: 'Now with great feedbacks, '
       'you can understand a lot about your new born cry patter '
       'and prepare for common cry peak period.',
     buttonTitle1: 'Previous',
     buttonTitle2: 'Next',
   ),
   OnboardTextModel(title: 'Analytical Insight', subTitle: 'Be your baby’s doctor by viewing '
       'great insight and analysis; you get to see how your baby cry activity varies in terms of '
       'duration and frequency to help you make good dcisions',buttonTitle1: 'Previous',
     buttonTitle2: 'Next',
   ),
   OnboardTextModel(title: 'Happy Mom\n Happy Home',
     subTitle: 'Reduce you baby crying time whilst gettting your schedule '
       'back together by planning for time of cry activity and time of quite.',
     buttonTitle1: 'Previous',
   ),
];
