import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubenwa_nkechi/app/utils/utils.dart';
import 'package:ubenwa_nkechi/features/records/view/view.dart';

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
            CalendarTimeline(
              initialDate: _selectedDate,
              firstDate: DateTime(2023, 1, 15),
              lastDate: DateTime(2023, 6, 18).add(const Duration(days: 365 * 4)),
              onDateSelected: (date) => setState(() => _selectedDate = date),
              leftMargin: 20,
              monthColor: const Color(0xFF9A9A9A),
              dayColor: Colors.black.withOpacity(0.41),
              dayNameColor: const Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: const Color(0xFF4475F6),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 26, 0, 8),
              child: Text('Today’s Overview',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF686868),
                  fontSize: 13,
                ),),
            ),
            const OverviewWidget(),
            const SizedBox(height: 26,),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 14),
              child: Text('Hourly Breakdown',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF686868),
                  fontSize: 13,
                ),),
            ),
            const Expanded(
              child: BarChartWidget(),
            ),
            const SizedBox(height: 27,),
            const Expanded(
                child: TrackerWidget(),),
          ],
        ),
      ),
    );
  }
}
