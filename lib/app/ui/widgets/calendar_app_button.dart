import 'package:calendar_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CalendarAppButton extends StatelessWidget {
  const CalendarAppButton({
    Key? key,
    required this.title,
    this.height,
    this.icon,
    this.onPressed,
    this.borderRadius = 8,
    this.backgroundColor = AppColors.primaryColor,
    this.padding,
  }) : super(key: key);

  final Widget title;
  final Widget? icon;
  final double? height;
  final Function()? onPressed;
  final double borderRadius;
  final Color backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(Colors.black12),
            padding: MaterialStateProperty.all(padding),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(borderRadius),
                ),
              ),
            ),
          ),
          onPressed: onPressed,
          child: icon != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                    const SizedBox(width: 2),
                    title,
                  ],
                )
              : title,
        ),
      );
}
