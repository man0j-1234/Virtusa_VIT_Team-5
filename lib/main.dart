import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/reports_screen.dart';

void main() {
  runApp(ESocietyApp());
}

class ESocietyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'eSociety',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (_) => SplashScreen(),
          LoginScreen.routeName: (_) => LoginScreen(),
          SignupScreen.routeName: (_) => SignupScreen(),
          ReportsScreen.routeName: (_) => ReportsScreen(),
        },
      ),
    );
  }
}
