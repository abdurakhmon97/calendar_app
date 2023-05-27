import 'package:calendar_app/app/navigation/app_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashScreenViewModel {
  late AnimationController lottieAnimation;

  ValueNotifier<bool> expanded = ValueNotifier(false);

  final duration = const Duration(seconds: 1);

  void initController(
    BuildContext context,
    TickerProvider provider,
  ) async {
    lottieAnimation = AnimationController(
      vsync: provider,
      duration: const Duration(seconds: 2),
    );

    await Future.delayed(duration);
    expanded.value = true;

    lottieAnimation.forward().then((value) => context.go(AppRoute.home));
  }

  MediaQueryData getQueryData(BuildContext context) => MediaQuery.of(context);
}
