import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:wander_wise_app/core/constants/constants.dart';
import 'package:wander_wise_app/core/network/api_service.dart';
import 'package:wander_wise_app/features/Auth/logic/AuthCubit/auth_cubit.dart';
import 'package:wander_wise_app/features/Tours/logic/TourCubit/tour_cubit.dart';
import 'package:wander_wise_app/routes/app_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiService>(create: (_) => ApiService()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: const WanderWiseApp(),
    ),
  );
}

class WanderWiseApp extends StatelessWidget {
  const WanderWiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> TourCubit(ApiService())..gettours())
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: kprimaryColor4,
            selectionColor: kprimaryColor2.withValues(alpha: 0.4),
            selectionHandleColor: kprimaryColor4,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
