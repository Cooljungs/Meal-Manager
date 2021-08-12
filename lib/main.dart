import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/config/themes/theme_config.dart';
import 'package:meal_manager/core/auth/auth_service.dart';
import 'package:meal_manager/core/login/sign_in.dart';
import 'package:meal_manager/core/scaffold/app_bar.dart';
import 'package:meal_manager/core/scaffold/bottom_navigation_bar.dart';
import 'package:meal_manager/core/scaffold/drawer.dart';
import 'package:meal_manager/core/scaffold/floating_action_button.dart';
import 'package:meal_manager/utils/providers.dart';

import 'package:meal_manager/screens/main_screens/shopping.dart';
import 'package:meal_manager/screens/main_screens/fridge.dart';
import 'package:meal_manager/screens/main_screens/week.dart';
import 'package:meal_manager/screens/main_screens/home.dart';

Future<void> main() async {
  /// Lässt die App mit Firebase kommunizieren
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// Startet die Anwendung bzw. MyApp()
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Weist der App mehrere Provider zu.
    /// Provider sind Klassen, die sich von quasi überall ausführen lassen.
    /// Sie können Dinge verändern, die sonst nicht in Verbindung stehen.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GroupProvider()),
        ChangeNotifierProvider(create: (_) => IndexProvider()),
        Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null)
      ],

      /// Statt direkt Main() zu starten, wird hier zuerst auf den
      /// themeHandler [.themes.dart] verwiesen, der das Light- und
      /// Dark-Theme regelt. Dieser wiederum startet dann Main().
      child: themeHandler(context),
    );
  }
}

class UserCheck extends StatefulWidget {
  @override
  _UserCheckState createState() => _UserCheckState();
}

class _UserCheckState extends State<UserCheck> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    print(firebaseUser);
    return firebaseUser == null ? SignIn() : Main();
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();

  /// Startet neuen State des Widgets.
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    /// Scaffold = Grundgerüst einer App bzw. App-Seite
    return Scaffold(
      //
      appBar: ScaffoldAppBar(),
      //
      body: [
        Home(),
        Week(),
        Fridge(),
        Shopping(),
      ][Provider.of<IndexProvider>(context).currentIndex],
      //
      drawer: ScaffoldDrawer(),
      //
      bottomNavigationBar: ScaffoldBottomNavigationBar(),
      //
      floatingActionButton: ScaffoldFloatingActionButton(),
    );
  }
}
