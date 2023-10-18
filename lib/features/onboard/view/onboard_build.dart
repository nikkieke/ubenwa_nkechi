import 'package:flutter/material.dart';

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
            top: 50,
            left: width - 314,
            right: width - 315,
            child: Container(
              height: 200,
              width: 200,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(onboardMomPath),

                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: width - 393,
            right: width - 92,
            child: Container(
              height: 57,
              width: 57,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(onboardAuxBaby1Path),

                  ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: width - 244,
            right: width - 241,
            child: Container(
              height: 57,
              width: 57,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onboardBabyPath),

                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: width - 244,
            right: width - 241,
            child: Container(
              height: 57,
              width: 57,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(onboardAuxBaby2Path),

                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: width - 88,
            right: width - 394,
            child: Container(
              height: 57,
              width: 57,
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
