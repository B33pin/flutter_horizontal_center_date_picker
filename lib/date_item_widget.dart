import 'package:flutter/material.dart';
import 'date_item_state.dart';
import 'package:intl/intl.dart';

import 'date_item.dart';

class DateItemWidget extends StatelessWidget {
  ///display [DateTime]
  final DateTime dateTime;

  ///State of the date
  final DateItemState dateItemState;

  final String locale;

  ///padding of the item widget
  final double padding;

  final double width;
  final double height;

  final double? monthFontSize;
  final double? dayFontSize;
  final double? weekDayFontSize;
  final Color? normalColor;
  final Color? selectedColor;
  final Color? disabledColor;
  final Color? normalTextColor;
  final Color? selectedTextColor;
  final Color? disabledTextColor;

  final List<DateItem> dateItemComponentList;

  DateItemWidget({
    required this.dateTime,
    required this.dateItemState,
    required this.width,
    required this.height,
    required this.dateItemComponentList,
    required this.locale,
    this.padding = 0.0,
    this.normalColor,
    this.selectedColor,
    this.disabledColor,
    this.normalTextColor,
    this.selectedTextColor,
    this.disabledTextColor,
    this.monthFontSize,
    this.dayFontSize,
    this.weekDayFontSize,
  }) : assert(dateItemComponentList.isNotEmpty,
            'dateItemComponentList cannot be empty');

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat.d(this.locale).format(this.dateTime),
              style: TextStyle(
                  color: _getTextColorByState(dateItemState),
                  fontSize: 28,
                  height: 32 / 28,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 1),
            Text(
              DateFormat.MMM(this.locale).format(this.dateTime).toUpperCase(),
              style: TextStyle(
                  color: _getTextColorByState(dateItemState),
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  height: 16.5 / 14,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  Color? _getTextColorByState(DateItemState state) {
    switch (state) {
      case DateItemState.ACTIVE:
        return Color(0xff6F7985);
      case DateItemState.SELECTED:
        return Color(0xff393939);
      default:
        return Color(0xff6F7985);
    }
  }
}
