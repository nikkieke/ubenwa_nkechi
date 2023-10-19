import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';


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


class OnboardTextBuild extends StatelessWidget {
  const OnboardTextBuild({
    required this.model,
    required this.pressed1,
    required this.pressed2,
    super.key,
  });

  final OnboardTextModel model;
  final VoidCallback pressed1;
  final VoidCallback pressed2;


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
                onPressed: pressed1,
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
                onPressed: pressed2,
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
