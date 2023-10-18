import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';
import 'package:ubenwa_nkechi/features/onboard/view/view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentPage = 0;
  int currentPage2 = 0;
  late final PageController _pageController;
  late final PageController _pageController2;
  late final List<OnboardBuild> _items;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController2 = PageController();
    _items = [
      const OnboardBuild(
        onboardMomPath: AppImage.mom1,
        onboardBabyPath: AppImage.baby1,
        onboardAuxBaby1Path: AppImage.auxBabyPacifier,
        onboardAuxBaby2Path: AppImage.auxBabySmile,
        onboardAuxBaby3Path: AppImage.auxBabyCry,
      ),
      const OnboardBuild(
        onboardMomPath: AppImage.mom2,
        onboardBabyPath: AppImage.baby2,
        onboardAuxBaby1Path: AppImage.auxBabyCalm,
        onboardAuxBaby2Path: AppImage.auxBabyPacifier,
        onboardAuxBaby3Path: AppImage.auxBabySmile,
      ),
      const OnboardBuild(
        onboardMomPath: AppImage.mom3,
        onboardBabyPath: AppImage.baby3,
        onboardAuxBaby1Path: AppImage.auxBabyCry,
        onboardAuxBaby2Path: AppImage.auxBabyCalm,
        onboardAuxBaby3Path: AppImage.auxBabyPacifier,
      ),
      const OnboardBuild(
        onboardMomPath: AppImage.mom4,
        onboardBabyPath: AppImage.baby4,
        onboardAuxBaby1Path: AppImage.auxBabySmile,
        onboardAuxBaby2Path: AppImage.auxBabyCry,
        onboardAuxBaby3Path: AppImage.auxBabyCalm,
      ),
    ];
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
      // if(_pageController.page!.round() != currentPage){
      //   setState(() {
      //     currentPage = _pageController.page!.round();
      //     _pageController2.jumpToPage(currentPage);
      //   });
      // }
    });
    // _pageController2.addListener(() {
    //   if(_pageController2.page!.round() != currentPage2){
    //     setState(() {
    //       currentPage2 = _pageController2.page!.round();
    //       _pageController.jumpToPage(currentPage2);
    //     });
    //   }
    // });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
            SizedBox(
            height: 152.h,
          ),
          Container(
            //color: Colors.teal,
            height: 324.h,
            width: double.maxFinite,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _items.length,
              itemBuilder: (context, index) => _items[index],
            ),
          ),
           SizedBox(
            height: 43.h,
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: _items.length,
            effect:  ExpandingDotsEffect(
              spacing: 2,
              dotColor: const Color(0xFFD3DEFC),
              dotHeight: 6,
              dotWidth: 6,
              activeDotColor: currentPage.isEven?
              Theme.of(context).colorScheme.secondary:
              Theme.of(context).colorScheme.primary,
            ),
          ),
           SizedBox(
            height: 41.h,
          ),
          Container(
            //color: Colors.cyan,
            height: 347.h,
            width: double.maxFinite,
            child:  PageView.builder(
              controller: _pageController2,
              onPageChanged: (index){
                setState(() {
                  index = currentPage;
                });
              },
              itemCount: textList.length,
              itemBuilder: (context, index){
                final onboardTextItem = textList[index];
                return OnboardTextBuild(model: onboardTextItem);
              },
            ),

          ),

        ],
      ),
    );
  }
}

class OnboardTextModel{
  OnboardTextModel({
    required this.title,
    required this.subTitle,
    this.buttonTitle1,
    this.buttonTitle2,
  });
  final String title;
  final String subTitle;
  final String? buttonTitle1;
  final String? buttonTitle2;
}

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

class OnboardTextBuild extends StatelessWidget {
  const OnboardTextBuild({
    required this.model, super.key,
  });

  final OnboardTextModel model;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme.bodyMedium?.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
             SizedBox(height: 13.h,),
            SizedBox(
              width: 302.w,
              height: 62.h,
              child: Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),

        if(model.title == 'Happy Mom\n Happy Home')...[
          CupertinoButton(
              child: Container(
                alignment: Alignment.center,
                width: 380.w,
                height: 58.h,
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme
                      .bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: (){
                context.goNamed(AppRoute.animatedLoader.name);
              },),

        ]else...[
          Container(),
        ],

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(model.buttonTitle1 == null)...[
              Container(),
            ]else...[
              TextButton(
                onPressed: (){},
                child: Text(
                  '${model.buttonTitle1}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme
                      .bodyMedium?.copyWith(
                    color: const Color(0xFF848484),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],

            if(model.buttonTitle2 == null)...[
              Container(),
            ]else...[
              TextButton(
                onPressed: (){},
                child: Text(
                  '${model.buttonTitle2}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme
                      .bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),

      ],
    );
  }
}
