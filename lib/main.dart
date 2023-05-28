import 'package:calendar_app/app/navigation/app_route_factory.dart';
import 'package:calendar_app/core/constants/colors.dart';
import 'package:calendar_app/core/di/di_container.dart';
import 'package:calendar_app/core/di/inject.dart';
import 'package:calendar_app/domain/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc(inject())),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp.router(
          title: "Calendar App",
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.bgColor,
            primaryColor: AppColors.primaryColor,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
    );
  }
}
