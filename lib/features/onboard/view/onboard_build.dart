import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardBuild extends StatelessWidget {
  const OnboardBuild({
    required this.onboardMomPath,
    required this.onboardBabyPath,
    required this.onboardAuxBaby1Path,
    required this.onboardAuxBaby2Path,
    required this.onboardAuxBaby3Path, super.key,
  });
  final String onboardMomPath;
  final String onboardBabyPath;
  final String onboardAuxBaby1Path;
  final String onboardAuxBaby2Path;
  final String onboardAuxBaby3Path;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context,
        BoxConstraints constraints,) {
      final width = constraints.maxWidth;
      return Stack(
        children: [
          Positioned(
            top: 50.h,
            left: width - 314.w,
            right: width - 315.w,
            child: Container(
              height: 200.h,
              width: 200.w,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(onboardMomPath),

                ),
              ),
            ),
          ),
          Positioned(
            top: 100.h,
            left: width - 393.w,
            right: width - 92.w,
            child: Container(
              height: 57.w,
              width: 57.w,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(onboardAuxBaby1Path),

                  ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: width - 244.w,
            right: width - 241.w,
            child: Container(
              height: 57.h,
              width: 57.w,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onboardBabyPath),

                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: width - 244.w,
            right: width - 241.w,
            child: Container(
              height: 57.h,
              width: 57.w,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onboardAuxBaby2Path),

                ),
              ),
            ),
          ),
          Positioned(
            top: 100.h,
            left: width - 88.w,
            right: width - 394.w,
            child: Container(
              height: 57.h,
              width: 57.w,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onboardAuxBaby3Path),

                ),
              ),
            ),
          ),
        ],

      );
    },);
  }
}
