import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';
import 'package:ubenwa_nkechi/features/records/view/view.dart';

class RecordsView extends StatelessWidget {
  const RecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                IconButton(onPressed: () {  },
                  icon: const Icon(Icons.arrow_back_ios_new,
                    color: Color(0xff292D32),
                    size: 24,),
                ),
                Align(
                  child: Text('Cry Records',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){},
                    child: Stack(
                      children: [
                        SvgPicture.asset(AppImage.notification),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 26, 0, 14),
              child: Text('Today’s Overview',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF686868),
                  fontSize: 13,
                ),),
            ),
            const OverviewWidget(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 26, 0, 14),
              child: Text('Hourly Breakdown',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF686868),
                  fontSize: 13,
                ),),
            ),
            const BarChartWidget(),
          ],
        ),
      ),
    );
  }
}

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(left: 25, right: 28,),
      child: const Row(
          children: [
            OverviewItem(
              imagePath: AppImage.sun,
              title: 'Number \nof Cry Episode',
              duration: '45',
              summary: '20% better than yesterday',
              imgBgColor: Color(0xFFD4E0FD),
              fontColor: Color(0xFF14823D),
            ),
            SizedBox(width: 16,),
            OverviewItem(
              imagePath: AppImage.wifi,
              title: 'Longest \nCry Duration',
              duration: '30mins',
              summary: '20% worst than yesterday',
              imgBgColor: Color(0xFFFDF4D4),
              fontColor: Color(0xFFD50F0F),
            ),
            SizedBox(width: 16,),
            OverviewItem(
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
      child: Container(
        //padding: const EdgeInsets.fromLTRB(14, 19, 14, 15),
        width: 116,
        height: 120,
        decoration: ShapeDecoration(
          color: const Color(0x5EF7F7F7),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 0.50,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFF122B83),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 19,),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(left: 11),
                  width: 24,
                  height: 24,
                  decoration:  ShapeDecoration(
                    color: imgBgColor,
                    shape: const OvalBorder(),
                  ),
                  child: SvgPicture.asset(imagePath),
                ),
                const SizedBox(width: 7,),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 8.11,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14,),
            Text(
              duration,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6,),
            Text(
              summary,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: fontColor,
                fontSize: 6.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
