import 'package:calendar_app/app/ui/home/home_screen_vm.dart';
import 'package:calendar_app/app/ui/home/widgets/calendar/calendar_header.dart';
import 'package:calendar_app/app/ui/home/widgets/calendar/calendar_page_view.dart';
import 'package:calendar_app/app/ui/home/widgets/chosen_day_header.dart';
import 'package:calendar_app/app/ui/home/widgets/events/events_list.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 28),
                ChosenDayHeader(day: DateTime.now()),
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
              currentMonth: DateTime.now(),
              onPreviousPage: () {},
              onNextPage: () {},
            ),
            const SizedBox(height: 19),
            CalendarPageView(
              pageController: vm.pageController,
              chosenDay: vm.currentDay,
              dateRange: vm.pageViewLength,
            ),
            EventsList(),
          ],
        ),
      ),
    );
  }
}
