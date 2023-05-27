import 'package:calendar_app/app/navigation/app_route_factory.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/di/di_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await disposeDi();
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        title: "Calendar App",
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.bgColor,
          primaryColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
