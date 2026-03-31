import 'package:flutter/material.dart';
import 'screens/alerts_screen.dart';
import 'screens/appointments_screen.dart';
import 'screens/biomarkers_screen.dart';
import 'screens/care_plan_screen.dart';
import 'screens/ecg_screen.dart';
import 'screens/home_screen.dart';
import 'screens/patient_profile_screen.dart';
import 'screens/predictions_screen.dart';
import 'screens/share_screen.dart';

void main() {
  runApp(const NfcHealthPatchApp());
}

class NfcHealthPatchApp extends StatelessWidget {
  const NfcHealthPatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0E7490)),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'NFC Health Patch',
      theme: base.copyWith(
        scaffoldBackgroundColor: const Color(0xFFF4F8FB),
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18)),
          ),
        ),
      ),
      routes: {
        '/profile': (_) => const PatientProfileScreen(),
        '/care-plan': (_) => const CarePlanScreen(),
        '/alerts': (_) => const AlertsScreen(),
        '/appointments': (_) => const AppointmentsScreen(),
      },
      home: const AppShell(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    EcgScreen(),
    BiomarkersScreen(),
    PredictionsScreen(),
    ShareScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite_border), label: 'ECG'),
          NavigationDestination(
            icon: Icon(Icons.science_outlined),
            label: 'Biomarkers',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            label: 'Predictions',
          ),
          NavigationDestination(icon: Icon(Icons.share_outlined), label: 'Share'),
        ],
      ),
    );
  }
}
