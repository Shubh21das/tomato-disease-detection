import 'package:flutter/material.dart';
import 'package:tomato_disease_app/screens/splash_screen.dart';
import 'package:tomato_disease_app/screens/login_screen.dart';
import 'package:tomato_disease_app/screens/register_screen.dart';
import 'package:tomato_disease_app/screens/home_screen.dart';
import 'package:tomato_disease_app/screens/predict_screen.dart';
import 'package:tomato_disease_app/screens/result_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TomatoDoctorApp());
}

class TomatoDoctorApp extends StatelessWidget {
  const TomatoDoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tomato Doctor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B5E20),
          primary: const Color(0xFF1B5E20),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/predict': (context) => const PredictScreen(),
        '/result': (context) => const ResultScreen(),
      },
    );
  }
}
