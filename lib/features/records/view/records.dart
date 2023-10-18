import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';
import 'package:ubenwa_nkechi/features/records/view/view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecordsView extends StatefulWidget {
  const RecordsView({super.key});

  @override
  State<RecordsView> createState() => _RecordsViewState();
}

class _RecordsViewState extends State<RecordsView> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime(2023, 6, 16).add(const Duration(days: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: 15.h,
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
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18.sp),),
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
            CalendarTimeline(
              initialDate: _selectedDate,
              firstDate: DateTime(2023, 1, 15),
              lastDate: DateTime(2023, 6, 18).add(const Duration(days: 365 * 4)),
              onDateSelected: (date) => setState(() => _selectedDate = date),
              leftMargin: 20.w,
              monthColor: const Color(0xFF9A9A9A),
              dayColor: Colors.black.withOpacity(0.41),
              dayNameColor: const Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: const Color(0xFF4475F6),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(25.r, 26.r, 0, 8.r),
              child: Text('Today’s Overview',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF686868),
                  fontSize: 13.sp,
                ),),
            ),
            const OverviewWidget(),
            SizedBox(height: 26.h,),
            Padding(
              padding:  EdgeInsets.fromLTRB(25.r, 0, 0, 14.r),
              child: Text('Hourly Breakdown',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF686868),
                  fontSize: 13.sp,
                ),),
            ),
            const Expanded(
              child: BarChartWidget(),
            ),
             SizedBox(height: 27.h,),
            const Expanded(
                child: TrackerWidget(),),
          ],
        ),
      ),
    );
  }
}
