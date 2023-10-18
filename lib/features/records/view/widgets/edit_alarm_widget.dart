import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class EditAlarm extends StatefulWidget {
  const EditAlarm({
    super.key,
  });

  @override
  State<EditAlarm> createState() => _EditAlarmState();
}

class _EditAlarmState extends State<EditAlarm> {
  DateTime dateTime = DateTime.now();
  bool snoozeOn = true;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height - 50,
        padding:  EdgeInsets.only(left: 24.r, right: 24.r),
        decoration: const ShapeDecoration(
          color: Color(0xff121212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
            ),),),
        child: Column(
          children: [
             SizedBox(height: 10.h,),
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                TextButton(
                    onPressed: (){},
                    child: Text(
                      'Cancel',
                      style: Theme.of(context).textTheme
                          .bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16.sp,),
                    ),
                ),
                Align(
                  child: Text('Edit Alarm',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xffe8e1e1),
                        fontSize: 18.sp,),),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: (){},
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme
                          .bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16.sp,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 180.h,
              child: CupertinoTheme(
                data: const CupertinoThemeData(
                  brightness: Brightness.dark,
                ),
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: dateTime,
                  onDateTimeChanged: (DateTime value) {
                    setState(() {
                      dateTime = value;
                    });
                  },
                ),
              ),
            ),
             SizedBox(
              height: 10.h,
            ),
            Container(
              padding:  EdgeInsets.fromLTRB(25.r, 0, 15.r, 0),
              height: 222.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xff212121),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  const OptionsItem(title: 'Repeat', subTitle: 'Never',),
                  const Divider(
                    thickness: 0.1,
                    height: 0.1,
                    color: Color(0xff6b6868),
                  ),
                  const OptionsItem(title: 'Label', subTitle: 'Alarm',),
                  const Divider(
                    thickness: 0.1,
                    height: 0.1,
                    color: Color(0xff6b6868),
                  ),
                  const OptionsItem(title: 'Sound', subTitle: 'Circuit',),
                  const Divider(
                    thickness: 0.1,
                    height: 0.1,
                    color: Color(0xff6b6868),
                  ),
                  OptionsItem(title: 'Snooze', subTitle: '',
                    item: Switch(
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      value: snoozeOn,
                      onChanged: (bool value) {  },),),
                ],
              ),
            ),
             SizedBox(
              height: 35.h,
            ),
            Container(
              alignment: Alignment.center,
              height: 50.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xff212121),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('Delete Alarm', style: Theme.of(context).textTheme
                  .bodyMedium?.copyWith(
                color: const Color(0xffd46e6e),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionsItem extends StatelessWidget {
  const OptionsItem({
    required this.title, required this.subTitle, super.key, this.item,
  });
  final String title;
  final String subTitle;
  final Widget? item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xffe8e1e1),
            fontSize: 13.sp,
          ),
        ),
        item??
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
            onPressed: (){},
          child: Row(
            children: [
              Text(subTitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xff6b6868),
                  fontSize: 13.sp,
                ),
              ),
              const SizedBox(width: 5,),
              const Icon(Icons.arrow_forward_ios,
                color: Color(0xff6b6868),
                size: 18,),
            ],
          ),


        ),
      ],
    );
  }
}
