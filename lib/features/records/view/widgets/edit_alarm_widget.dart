import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        padding: const EdgeInsets.only(left: 24, right: 24),
        decoration: const ShapeDecoration(
          color: Color(0xff121212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(9),
              topRight: Radius.circular(9),
            ),),),
        child: Column(
          children: [
            const SizedBox(height: 10,),
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
                          fontSize: 16,),
                    ),
                ),
                Align(
                  child: Text('Edit Alarm',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xffe8e1e1),
                        fontSize: 18,),),
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
                        fontSize: 16,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 160,
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
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 15, 0),
              height: 195,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xff212121),
                borderRadius: BorderRadius.circular(10),
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
            const SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.center,
              height: 40,
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
            fontSize: 13,
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
                  fontSize: 13,
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
