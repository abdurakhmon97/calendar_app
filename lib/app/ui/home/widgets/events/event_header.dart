import 'package:calendar_app/app/ui/widgets/calendar_app_button.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:flutter/material.dart';

class EventHeader extends StatelessWidget {
  const EventHeader({
    Key? key,
    required this.onAddEvent,
  }) : super(key: key);
  final VoidCallback onAddEvent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Schedule',
          style: AppTypography.captionSemiBold,
        ),
        CalendarAppButton(
          title: Text(
            '+ Add Event',
            style: AppTypography.textSemiBoldWhite,
          ),
          borderRadius: 10,
          onPressed: () {},
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 22),
        ),
      ],
    );
  }
}
