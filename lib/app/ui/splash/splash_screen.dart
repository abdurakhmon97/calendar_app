import 'package:calendar_app/app/ui/splash/splash_screen_vm.dart';
import 'package:calendar_app/core/constants/assets.dart';
import 'package:calendar_app/core/constants/typography.dart';
import 'package:flutter/material.dart';

const _appLogoHeight = 120.0;

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    required this.vm,
  }) : super(key: key);

  final SplashScreenViewModel vm;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final vm = widget.vm;

  @override
  void initState() {
    super.initState();
    vm.initController(context, this);
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: vm.getQueryData(context).size.width,
        height: vm.getQueryData(context).size.height,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              padding: const EdgeInsets.all(8),
              duration: vm.duration,
              curve: Curves.fastOutSlowIn,
              child: Image.asset(
                AppImages.splash,
                height: _appLogoHeight,
                fit: BoxFit.fitWidth,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: vm.expanded,
              builder: (_, bool expanded, __) {
                return AnimatedCrossFade(
                  firstCurve: Curves.fastOutSlowIn,
                  crossFadeState: !expanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: vm.duration,
                  firstChild: Container(),
                  secondChild: const Text(
                    "CalendarApp",
                    style: AppTypography.title3,
                  ),
                  alignment: Alignment.centerLeft,
                  sizeCurve: Curves.easeInOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
