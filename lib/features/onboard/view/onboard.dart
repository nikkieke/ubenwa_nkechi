import 'package:flutter/material.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';
import 'package:ubenwa_nkechi/features/onboard/view/view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentPage = 0;
  late final PageController _pageController;
  late final List<OnboardBuild> _items;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
    });
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
          const SizedBox(
            height: 152,
          ),
          Container(
            color: Colors.teal,
            height: MediaQuery.of(context).size.height - 602,
            width: double.maxFinite,

            child: PageView.builder(
              controller: _pageController,
              itemCount: _items.length,
              itemBuilder: (context, index) => _items[index],
            ),
          ),
          const SizedBox(
            height: 43,
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
          const SizedBox(
            height: 41,
          ),
          Column(
            children: [
              Text(
                'Welcome to a New\n Mothering Experince',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme.titleLarge?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 13,),
              SizedBox(
                width: 302,
                height: 62,
                child: Text(
                  'Now you can understand a lot about your new born, bukkle up for an experince you will always long for.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (){},
                    child: Text(
                      '',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme
                          .bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text(
                        'Show me How',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme
                            .bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}


