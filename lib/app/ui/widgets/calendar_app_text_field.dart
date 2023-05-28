import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:flutter/material.dart';

class CalendarAppTextField extends StatelessWidget {
  const CalendarAppTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.minLines = 1,
    this.onTap,
  }) : super(key: key);

  final String title;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final int minLines;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.body2,
        ),
        const SizedBox(height: 4),
        TextField(
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          style: AppTypography.body2,
          minLines: minLines,
          maxLines: minLines,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 13,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: suffixIcon,
            ),
            suffixIconConstraints: const BoxConstraints(
              maxWidth: 34,
              maxHeight: 34,
            ),
            filled: true,
            fillColor: AppColors.textFieldBg,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
