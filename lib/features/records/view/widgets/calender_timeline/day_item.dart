import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.shrink = false,
  }) : super(key: key);
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;
  final bool shrink;

  GestureDetector _buildDay(BuildContext context) {
    final textStyle = TextStyle(
      color: available
          ? dayColor ?? Theme.of(context).colorScheme.secondary
          : dayColor?.withOpacity(0.5) ??
          Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      fontSize: shrink ? 14 : 17.29,
      fontWeight: FontWeight.normal,
    );
    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontSize: shrink ? 14 : 17.29,
      //fontWeight: FontWeight.bold,
      //height: 0.8,
    );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 19),
            padding: const EdgeInsets.only(top: 17),
            decoration: BoxDecoration(
              color: isSelected? activeDayBackgroundColor ??
                  Theme.of(context).colorScheme.secondary: const Color(0xFFEAEAEA),
              borderRadius:BorderRadius.circular(43),
            ),
            height: shrink ? 30 : 85,
            width: shrink ? 23 : 37,
            child: Column(
              children: <Widget>[
                // if (isSelected) ...[
                //   SizedBox(height: shrink ? 6 : 7),
                //   if (!shrink) _buildDots(),
                //   SizedBox(height: shrink ? 9 : 12),
                // ] else
                //   SizedBox(height: shrink ? 10 : 14),
                Text(
                  shortName,
                  style: TextStyle(
                    color: isSelected? Colors.white : dayNameColor,
                    fontSize: 10,
                  ),
                ),
                Text(
                  dayNumber.toString(),
                  style: isSelected ? selectedStyle : textStyle,
                ),


              ],
            ),
          ),
          if (isSelected) ...[
            if (!shrink) Positioned(
                left: MediaQuery.of(context).size.width/12,
                child: _buildDots(),),
            SizedBox(height: shrink ? 9 : 12),
          ] else
            SizedBox(height: shrink ? 10 : 14),


        ],
      ),
    );
  }

  Widget _buildDots() {
    return Container(
      width: 12,
      height: 12,
      decoration: const ShapeDecoration(
        color: Color(0xFFFFB300),
        shape: OvalBorder(),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}