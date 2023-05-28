import 'package:calendar_app/app/navigation/app_route.dart';
import 'package:calendar_app/app/ui/event_add_or_edit/event_add_or_edit_screen.dart';
import 'package:calendar_app/app/ui/event_add_or_edit/event_add_or_edit_vm.dart';
import 'package:calendar_app/app/ui/home/home_screen.dart';
import 'package:calendar_app/app/ui/home/home_screen_vm.dart';
import 'package:calendar_app/app/ui/splash/splash_screen.dart';
import 'package:calendar_app/app/ui/splash/splash_screen_vm.dart';
import 'package:calendar_app/domain/entities/event_details_entity.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: AppRoute.splash,
  routes: [
    GoRoute(
      path: AppRoute.splash,
      builder: (_, __) => SplashScreen(
        vm: SplashScreenViewModel(),
      ),
    ),
    GoRoute(
      path: AppRoute.home,
      builder: (_, state) {
        return HomeScreen(
          vm: HomeScreenViewModel(),
        );
      },
      routes: [
        GoRoute(
          path: AppRoute.eventAddOrEdit,
          builder: (_, state) {
            return EventAddOrEditScreen(
              vm: EventAddOrEditViewModel(),
              eventToEdit: state.extra as EventDetailsEntity?,
            );
          },
        ),
      ],
    ),
  ],
);
