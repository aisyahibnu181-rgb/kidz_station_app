import 'package:flutter/material.dart';
import 'package:kidz_station_app/screens/splash_screen.dart';
import 'package:kidz_station_app/theme/app_theme.dart';

void main() {
  runApp(const KidzStationApp());
}

class KidzStationApp extends StatelessWidget {
  const KidzStationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kidz Station',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashScreen(),
    );
  }
}
