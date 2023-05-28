import 'package:calendar_app/app/navigation/arguments/event_details_screen_arguments.dart';
import 'package:calendar_app/app/ui/event_details/widgets/screen_header.dart';
import 'package:calendar_app/app/ui/widgets/calendar_app_button.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _bottomPadding = 28.0;
const _buttonHeight = 56.0;

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);
  final EventDetailsScreenArguments arguments;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late final vm = widget.arguments.vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: AppColorUtils.priorityColorMap[vm.event.priorityColor],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenHeader(
            event: vm.event,
            onEdit: () {},
            onBackTap: () {},
          ),
          const SizedBox(height: 28),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reminder',
                  style: AppTypography.body1Poppins,
                ),
                const SizedBox(height: 10),
                Text(
                  vm.event.reminder == 0
                      ? 'No reminder is set'
                      : '${vm.event.reminder} minute(s) before',
                  style: AppTypography.body1PoppinsCaption,
                ),
                const SizedBox(height: 22),
                Text(
                  'Description',
                  style: AppTypography.body1Poppins,
                ),
                const SizedBox(height: 10),
                Text(
                  AppUtils.emptyField(vm.event.description),
                  style: AppTypography.textRegularSecondary,
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CalendarAppButton(
              title: Text(
                'Delete Event',
                style: AppTypography.captionSemiBold,
              ),
              icon: SvgPicture.asset(AppIcons.delete),
              onPressed: () {},
              backgroundColor: AppColors.deleteBtnBg,
              height: _buttonHeight,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).viewPadding.bottom + _bottomPadding,
          ),
        ],
      ),
    );
  }
}
