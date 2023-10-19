import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ubenwa_nkechi/app/app.dart';

class AnimatedLoaderView extends StatefulWidget {
  const AnimatedLoaderView({super.key});

  @override
  State<AnimatedLoaderView> createState() => _AnimatedLoaderViewState();
}

class _AnimatedLoaderViewState extends State<AnimatedLoaderView> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _secondController;
  late Animation<double> _secondAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 780.h,
    ).animate(_controller);
    _secondController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _secondAnimation = Tween<double>(
      begin: 0,
      end: -926.h,
    ).animate(_secondController);

    _controller..forward()
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed){
        Future.delayed(const Duration(seconds: 3), () {
          context.goNamed(AppRoute.records.name);
        });

        _secondAnimation = Tween<double>(
          begin: 0,
          end: -926.h,
        ).animate(_secondController);

        _secondController.forward();
      }
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: LayoutBuilder(builder: (BuildContext context,
          BoxConstraints constraints,) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return Stack(
          children: [
            Positioned(
              top: 120,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child){
                  return Transform.translate(
                    offset: Offset(208.w, _animation.value),
                    child: Image.asset(AppImage.milkDrop,scale: 2.w,),
                  );
                },
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: SizedBox(
                height: 205.h,
                child: Image.asset(AppImage.babyBottle),),
            ),
            Positioned(
              top: height/2,
              left: 107.w,
              child: Text(
                'Please wait while we\ngather your Baby’s data...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme
                    .bodyMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 18.sp,

                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 820.h,
              child: SizedBox(
                height: 110,
                width: double.maxFinite,
                child: Image.asset(AppImage.milkSea),),
            ),
            Positioned(
              top: 926.h,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _secondController,
                builder: (context, child){
                  return Transform.translate(
                    offset: Offset(0, _secondAnimation.value),
                    child: Image.asset(AppImage.milkSeaCover,),
                  );
                },
              ),
            ),

          ],
        );
      },

      ),
    );
  }
}
