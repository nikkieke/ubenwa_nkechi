import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';


class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.maxFinite,
      height: 120.h,
      padding:  EdgeInsets.only(left: 25.r, right: 28.r,),
      child:  Row(
        children: [
          const OverviewItem(
            imagePath: AppImage.sun,
            title: 'Number \nof Cry Episode',
            duration: '45',
            summary: '20% better than yesterday',
            imgBgColor: Color(0xFFD4E0FD),
            fontColor: Color(0xFF14823D),
          ),
          SizedBox(width: 16.w,),
          const OverviewItem(
            imagePath: AppImage.wifi,
            title: 'Longest \nCry Duration',
            duration: '30mins',
            summary: '20% worst than yesterday',
            imgBgColor: Color(0xFFFDF4D4),
            fontColor: Color(0xFFD50F0F),
          ),
          SizedBox(width: 16.w,),
          const OverviewItem(
            imagePath: AppImage.chart,
            title: 'Cumulative \nCry Duration',
            duration: '4hours',
            summary: '20% better than yesterday',
            imgBgColor: Color(0xFFEBD4FD),
            fontColor: Color(0xFF14823D),
          ),
        ],
      ),
    );
  }
}

class OverviewItem extends StatelessWidget {
  const OverviewItem({
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.summary, required this.imgBgColor,
    required this.fontColor, super.key,
  });

  final String imagePath;
  final  String title;
  final String duration;
  final String summary;
  final Color imgBgColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: AspectRatio(
        aspectRatio: 0.96,
        child: Container(
          padding:  EdgeInsets.fromLTRB(0, 19.r, 14.r, 15.r),
          width: 116.w,
          height: 120.h,
          decoration: ShapeDecoration(
            color: const Color(0x5EF7F7F7),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFF122B83),
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: FittedBox(
            child: Column(
              children: [
                Row(
                  children: [
                     SizedBox(width: 11.w,),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: 24.w,
                      height: 24.h,
                      decoration:  ShapeDecoration(
                        color: imgBgColor,
                        shape: const OvalBorder(),
                      ),
                      child: SvgPicture.asset(imagePath,),
                    ),
                     SizedBox(width: 7.w,),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 8.11.sp,
                        height: 1.2.h,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 14.h,),
                Text(
                  duration,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                 SizedBox(height: 6.h),
                Padding(
                  padding:  EdgeInsets.only(left: 14.r),
                  child: Text(
                    summary,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: fontColor,
                      fontSize: 6.5.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
