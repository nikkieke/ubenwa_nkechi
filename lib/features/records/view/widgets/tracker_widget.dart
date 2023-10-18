import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ubenwa_nkechi/app/utils/helpers/app_bottomsheet/app_bottomsheet.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';
import 'package:ubenwa_nkechi/features/records/view/widgets/widgets.dart';

class TrackerWidget extends StatelessWidget {
  const TrackerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(25.r,0,28.r,31.r),
      child: Row(
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Container(
                width: 194.w,
                //width: 171.w,
                height: 194.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.60,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFFB6B6B6),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                     SizedBox(height: 22.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding:  EdgeInsets.all(5.r),
                          width: 24.r,
                          height: 24.r,
                          decoration:  const ShapeDecoration(
                            color: Color(0xFFFAE6B4),
                            shape: OvalBorder(),
                          ),
                          child: SvgPicture.asset(AppImage.star,),
                        ),
                         SizedBox(width: 7.w,),
                        Text(
                          'Daily Challenge',
                          style: Theme.of(context).textTheme
                              .bodyMedium?.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: CircularPercentIndicator(
                        backgroundColor: const Color(0xFFE9E9E9),
                        linearGradient:  const LinearGradient(
                          end: Alignment(0.96, -0.29),
                          begin: Alignment(-4, 0.37),
                          colors: [
                            Color(0xffFCE1A2),
                            Color(0xffDEA00F),
                          ],
                        ),
                        radius: 54,
                        lineWidth: 16,
                        percent: 0.57,
                        center: Container(
                          width: 76,
                          height: 76,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x38000000),
                                blurRadius: 16,
                                offset: Offset(0, 4),
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                               SizedBox(height: 18.h,),
                              Text(
                                '8',
                                style: Theme.of(context).textTheme
                                    .bodyMedium?.copyWith(
                                  fontSize: 20.09,
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'out of 12',
                                style: Theme.of(context).textTheme
                                    .bodyMedium?.copyWith(
                                  fontSize: 6.40,
                                ),
                              ),
                              Text(
                                'hours of silence',
                                style: Theme.of(context).textTheme
                                    .bodyMedium?.copyWith(
                                  fontSize: 6.40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
           SizedBox(width: 15.w,),
          Expanded(
            child: FittedBox(
              fit: BoxFit.cover,
              child: Container(
                width: 194.w,
                height: 194.h,
                decoration: ShapeDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 90.38.w,
                      height: 86.49.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImage.baby),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                     //SizedBox(height: 2.h,),
                    Text(
                      'Next Predicted Cry',
                      style: Theme.of(context).textTheme.
                      bodyMedium?.copyWith(
                        color: const Color(0xFFF8F8F8),
                        fontSize: 11.66.sp,
                      ),
                    ),
                     SizedBox(height: 2.49.h,),
                    Text(
                      '12:40 - 14:30',
                      style: Theme.of(context).textTheme
                          .bodyMedium?.copyWith(
                        color: const Color(0xFFFFBA18),
                        fontSize: 21.38.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: (){
                        AppBottomSheet
                            .showBottomSheet(
                            context,
                            widget: const EditAlarm(),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 99.13.w,
                        height: 23.32.h,
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.71),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.86.r),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 3.89,
                              offset: Offset(0, 3.89),
                            ),
                          ],
                        ),
                        child: Text(
                          'Set Alarm',
                          style: Theme.of(context).textTheme
                              .bodyMedium?.copyWith(
                            color: const Color(0xFF224FC4),
                            fontSize: 9.72.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
