import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardModel{
  const OnboardModel({
    required this.onboardMomPath,
    required this.onboardBabyPath,
    required this.onboardAuxBaby1Path,
    required this.onboardAuxBaby2Path,
    required this.onboardAuxBaby3Path,
  });
  final String onboardMomPath;
  final String onboardBabyPath;
  final String onboardAuxBaby1Path;
  final String onboardAuxBaby2Path;
  final String onboardAuxBaby3Path;



}
class OnboardBuild extends StatefulWidget {
  const OnboardBuild({
    required this.model,
    required this.page,
     required this.fading, super.key,
  });
  final OnboardModel model;
  final int page;
   final bool fading;

  @override
  State<OnboardBuild> createState() => _OnboardBuildState();
}

class _OnboardBuildState extends State<OnboardBuild> with TickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void didUpdateWidget(covariant OnboardBuild oldWidget) {
    super.didUpdateWidget(oldWidget);
    animationController.reset();

    if (oldWidget.page != widget.page) {
      animationController.forward();
    }
  }
  @override
  Widget build(BuildContext context) {
    final faces = <Widget>[
      Container(
        height: 57.w,
        width: 57.w,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.model.onboardBabyPath),

          ),
        ),
      ),
      Container(
              height: 57.w,
              width: 57.w,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.model.onboardAuxBaby1Path),

                ),
              ),
            ),
      Container(
        height: 57.w,
        width: 57.w,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.model.onboardAuxBaby2Path),

          ),
        ),
      ),
      Container(
        height: 57.w,
        width: 57.w,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.model.onboardAuxBaby3Path),

          ),
        ),
      ),
    ];
    final tweens = <int, List<Tween<Alignment>>>{
      0: [
        Tween(begin: const Alignment(0, -1), end: const Alignment(1, 0)),
        Tween(begin: const Alignment(0.8, 0), end: const Alignment(0, 1)),
        Tween(begin: const Alignment(0, 1), end: const Alignment(-1, 0)),
        Tween(begin: const Alignment(-0.8, 0), end: const Alignment(0, -1)),
      ],
      1: [
        Tween(begin: const Alignment(0.8, 0), end: const Alignment(0, 1)),
        Tween(begin: const Alignment(0, 1), end: const Alignment(-1, 0)),
        Tween(begin: const Alignment(-0.8, 0), end: const Alignment(0, -1)),
        Tween(begin: const Alignment(0, -1), end: const Alignment(1, 0)),
      ],
      2: [
        Tween(begin:  const Alignment(0, 1), end: const Alignment(-1, 0)),
        Tween(begin: const Alignment(-0.8, 0), end: const Alignment(0, -1)),
        Tween(begin: const Alignment(0, -1), end: const Alignment(1, 0)),
        Tween(begin: const Alignment(0.8, 0), end: const Alignment(0, 1)),
      ],
      3: [
        Tween(begin: const Alignment(-0.8, 0), end: const Alignment(0, -1)),
        Tween(begin: const Alignment(0, -1), end: const Alignment(1, 0)),
        Tween(begin: const Alignment(0.8, 0), end: const Alignment(0, 1)),
        Tween(begin: const Alignment(0, 1), end: const Alignment(-1, 0)),
      ],
    };

    return LayoutBuilder(builder: (BuildContext context,
        BoxConstraints constraints,) {
      final width = constraints.maxWidth;
      return Stack(
        children: [
          Positioned(
            top: 50.h,
            left: width - 314.w,
            right: width - 315.w,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: widget.fading? 0.5: 1.0,
              curve: Curves.ease,
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.model.onboardMomPath),

                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
              animation: animationController,
              builder: (context,_){
                return Stack(
                  children: [
                    ...List.generate(faces.length, (index) {
                    return Align(
                      alignment: tweens[widget.page]![index].animate(animationController).value,
                      child: faces[index],
                    );
                }),
                  ],
                );
              },
          ),

        ],
      );
    },);
  }
}
