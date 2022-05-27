import 'package:flutter/material.dart';
import 'package:sprinkler_system/firebase_options.dart';
import 'package:sprinkler_system/screens/create_user_screen/create_user_screen.dart';
import 'package:sprinkler_system/screens/home_screen/home_screen.dart';
import 'package:sprinkler_system/screens/land_screen/land_screen.dart';
import 'package:sprinkler_system/screens/login_screen/login_screen.dart';
import 'package:sprinkler_system/screens/main_screen/main_screen.dart';
import 'package:sprinkler_system/screens/profile_screen/profile_screen.dart';
import 'package:sprinkler_system/screens/report_screen/report_screen.dart';
import 'package:sprinkler_system/screens/splash_screen/splash_screen.dart';
import 'package:sprinkler_system/screens/users_screen/users_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'utils/colors_palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sprinkler System',
      theme: ThemeData(
        primarySwatch: ColorsPalette.primarySwatch,
        canvasColor: ColorsPalette.lightBackgroundColor,
        backgroundColor: ColorsPalette.lightBackgroundColor,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        MainScreen.routeName: (_) => const MainScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        LandScreen.routeName: (_) => const LandScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        ReportScreen.routeName: (_) => const ReportScreen(),
        UsersScreen.routeName: (_) => const UsersScreen(),
        CreateUserScreen.routeName: (_) => const CreateUserScreen(),
      },
    );
  }
}
