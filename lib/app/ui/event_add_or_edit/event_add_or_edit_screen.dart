import 'package:calendar_app/app/navigation/arguments/event_add_or_edit_arguments.dart';
import 'package:calendar_app/app/ui/event_add_or_edit/widgets/priority_color_builder.dart';
import 'package:calendar_app/app/ui/widgets/calendar_app_button.dart';
import 'package:calendar_app/app/ui/widgets/calendar_app_text_field.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:calendar_app/domain/bloc/edit_or_add_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _buttonHeight = 46.0;
const _bottomPadding = 16.0;

class EventAddOrEditScreen extends StatefulWidget {
  const EventAddOrEditScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final EventAddOrEditArguments arguments;

  @override
  State<EventAddOrEditScreen> createState() => _EventAddOrEditScreenState();
}

class _EventAddOrEditScreenState extends State<EventAddOrEditScreen> {
  late final vm = widget.arguments.vm;
  late final bool isEdit = widget.arguments.eventToEdit != null;
  late final DateTime selectedDay = widget.arguments.chosenDay;

  @override
  void initState() {
    super.initState();
    vm.init(widget.arguments.eventToEdit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditOrAddBloc(),
      child: Scaffold(
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
        body: SingleChildScrollView(
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
                predefinedColorIndex: vm.priorityColor,
              ),
              const SizedBox(height: 16),
              CalendarAppTextField(
                title: 'Event reminder',
                controller: vm.reminderController,
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CalendarAppTextField(
                title: 'Event time',
                controller: vm.timeController,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 24),
              BlocBuilder<EditOrAddBloc, EditOrAddState>(
                builder: (context, _) {
                  return SizedBox(
                    width: double.infinity,
                    child: CalendarAppButton(
                      onPressed: () => isEdit
                          ? vm.updateEvent(
                              context: context,
                              selectedDay: selectedDay,
                              eventId: widget.arguments.eventToEdit!.id!,
                            )
                          : vm.createEvent(
                              context: context,
                              selectedDay: selectedDay,
                            ),
                      height: _buttonHeight,
                      title: Text(
                        isEdit ? 'Update' : 'Add',
                        style: AppTypography.body1White,
                      ),
                    ),
                  );
                },
              ),
              //button height and extra 16px from bottom
              SizedBox(
                height:
                    MediaQuery.of(context).viewPadding.bottom + _bottomPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
