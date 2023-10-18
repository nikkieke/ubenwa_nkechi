import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ubenwa_nkechi/app/app.dart';

class AnimatedLoaderView extends StatefulWidget {
  const AnimatedLoaderView({super.key});

  @override
  State<AnimatedLoaderView> createState() => _AnimatedLoaderViewState();
}

class _AnimatedLoaderViewState extends State<AnimatedLoaderView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(AppRoute.records.name);
    });
    super.initState();
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
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: SizedBox(
                height: 205.h,
                child: Image.asset(AppImage.babyBottle),),
            ),
            Positioned(
              top: height/2,
              left: width/5,
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

          ],
        );
      },

      ),
    );
  }
}
