import 'package:calendar_app/app/ui/event_add_or_edit/event_add_or_edit_vm.dart';
import 'package:calendar_app/app/ui/event_add_or_edit/widgets/priority_color_builder.dart';
import 'package:calendar_app/app/ui/widgets/calendar_app_button.dart';
import 'package:calendar_app/app/ui/widgets/calendar_app_text_field.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _buttonHeight = 46.0;
const _bottomPadding = 16.0;

class EventAddOrEditScreen extends StatefulWidget {
  const EventAddOrEditScreen({
    Key? key,
    required this.vm,
    this.eventToEdit,
  }) : super(key: key);

  final EventAddOrEditViewModel vm;
  final EventDetailsEntity? eventToEdit;

  @override
  State<EventAddOrEditScreen> createState() => _EventAddOrEditScreenState();
}

class _EventAddOrEditScreenState extends State<EventAddOrEditScreen> {
  late final vm = widget.vm;

  @override
  void initState() {
    super.initState();
    vm.init(widget.eventToEdit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.contrastWhite,
      appBar: AppBar(
        backgroundColor: AppColors.contrastWhite,
        leadingWidth: 56,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => vm.onBackTap(context),
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.iconGrey,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                CalendarAppTextField(
                  title: 'Event name',
                  controller: vm.nameController,
                ),
                const SizedBox(height: 16),
                CalendarAppTextField(
                  title: 'Event description',
                  controller: vm.descriptionController,
                  minLines: 6,
                ),
                const SizedBox(height: 16),
                CalendarAppTextField(
                  title: 'Event location',
                  controller: vm.locationController,
                  suffixIcon: SvgPicture.asset(
                    AppIcons.location,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                PriorityColorBuilder(
                  onColorPicked: vm.changePriorityColor,
                ),
                const SizedBox(height: 16),
                CalendarAppTextField(
                  title: 'Event reminder',
                  controller: vm.reminderController,
                  readOnly: true,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                CalendarAppTextField(
                  title: 'Event time',
                  controller: vm.timeController,
                  readOnly: true,
                  onTap: () {},
                ),
                //button height and extra 16px from bottom
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom +
                      (_buttonHeight + _bottomPadding) +
                      _bottomPadding,
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewPadding.bottom + _bottomPadding,
            child: CalendarAppButton(
              onPressed: () {},
              height: _buttonHeight,
              title: Text(
                widget.eventToEdit == null ? 'Add' : 'Edit',
                style: AppTypography.body1White,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
