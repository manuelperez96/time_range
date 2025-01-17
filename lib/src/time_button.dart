import 'package:flutter/material.dart';

typedef TimeTapCallback = void Function(String time);

class TimeButton extends StatelessWidget {
  const TimeButton({
    Key? key,
    required this.time,
    required this.onSelect,
    this.value = false,
    this.borderColor,
    this.activeBorderColor,
    this.backgroundColor,
    this.activeBackgroundColor,
    this.textStyle,
    this.activeTextStyle,
  }) : super(key: key);

  final String time;
  final TimeTapCallback onSelect;
  final bool value;
  final Color? borderColor;
  final Color? activeBorderColor;
  final Color? backgroundColor;
  final Color? activeBackgroundColor;
  final TextStyle? textStyle;
  final TextStyle? activeTextStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(time),
      child: Container(
        decoration: BoxDecoration(
          color: value
              ? activeBackgroundColor ?? Theme.of(context).primaryColor
              : backgroundColor ?? Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: value
                ? activeBorderColor ?? Theme.of(context).primaryColor
                : borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              time,
              style: value ? activeTextStyle : textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
