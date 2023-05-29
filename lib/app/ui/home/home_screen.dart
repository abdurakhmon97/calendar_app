import 'package:calendar_app/app/ui/home/home_screen_vm.dart';
import 'package:calendar_app/app/ui/home/widgets/calendar/calendar_body.dart';
import 'package:calendar_app/app/ui/home/widgets/calendar/calendar_header.dart';
import 'package:calendar_app/app/ui/home/widgets/chosen_day_header.dart';
import 'package:calendar_app/app/ui/home/widgets/events/events_list.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/domain/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _bottomPadding = 16.0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.vm,
  }) : super(key: key);
  final HomeScreenViewModel vm;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final vm = widget.vm;

  @override
  void initState() {
    super.initState();
    vm.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //no app bar in design, so decided to include it inside the body
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (_, __) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 28),
                        ChosenDayHeader(day: vm.selectedDay),
                        Material(
                          child: InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(AppIcons.notification),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    CalendarHeader(
                      currentMonth: vm.focusedDay,
                      onPreviousPage: vm.previousMonth,
                      onNextPage: vm.nextMonth,
                    ),
                    const SizedBox(height: 16),
                    CalendarBody(
                      focusedMonthDays: vm.focusedMonthDays,
                      selectedDay: vm.selectedDay,
                      onSelectDay: (ctx, day) => vm.selectDay(
                        context: ctx,
                        chosenDay: day,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 28),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (_, newState) {
                  return newState is HomeSelectDayState;
                },
                builder: (_, state) {
                  if (state is HomeInitialState) {
                    return const SizedBox.shrink();
                  }
                  final events = (state as HomeSelectDayState).events;
                  return EventsList(
                    events: events,
                    onAddEvent: vm.onAddEvent,
                    onEditEvent: (context, event) => vm.onEditEvent(
                      context: context,
                      event: event,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).viewPadding.bottom + _bottomPadding,
            ),
          ],
        ),
      ),
    );
  }
}
