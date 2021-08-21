import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:meal_manager/config/themes/theme_config.dart';
import 'package:meal_manager/core/auth/auth_service.dart';
import 'package:meal_manager/core/login/sign_in.dart';
import 'package:meal_manager/core/login/verify.dart';
import 'package:meal_manager/core/scaffold/app_bar.dart';
import 'package:meal_manager/core/scaffold/bottom_navigation_bar.dart';
import 'package:meal_manager/core/scaffold/drawer.dart';
import 'package:meal_manager/core/scaffold/floating_action_button.dart';
import 'package:meal_manager/utils/.utilities.dart';
import 'package:meal_manager/utils/providers.dart';

import 'package:meal_manager/screens/main_screens/shopping.dart';
import 'package:meal_manager/screens/main_screens/fridge.dart';
import 'package:meal_manager/screens/main_screens/week.dart';
import 'package:meal_manager/screens/main_screens/home.dart';

Future<void> main() async {
  /// Lässt die App mit Firebase kommunizieren
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

  /// Startet die Anwendung bzw. MyApp()
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// Weist der App mehrere Provider zu.
    /// Provider sind Klassen, die sich von quasi überall ausführen lassen.
    /// Das heißt, sie können Elemente auf globaler Ebene beeinflussen.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GroupProvider()),
        ChangeNotifierProvider(create: (_) => IndexProvider()),
        ChangeNotifierProvider(create: (_) => ColorProvider()),
        ChangeNotifierProvider(create: (_) => DisplayProvider()),
        ChangeNotifierProvider(create: (_) => ShoppingProvider()),
        Provider<AuthenticationService>(
            create: (_) =>
                AuthenticationService(FirebaseAuth.instance, context)),
        StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null)
      ],

      /// Statt direkt Main() zu starten, wird hier zuerst auf den
      /// ThemeHandler [theme_config.dart] verwiesen, der das Light- und
      /// Dark-Theme regelt. Dieser wiederum startet den weiteren .
      child: ThemeHandler(),
    );
  }
}

class UserCheck extends StatefulWidget {
  @override
  _UserCheckState createState() => _UserCheckState();
}

class _UserCheckState extends State<UserCheck> {
  checkUser(firebaseUser) {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? user = _firebaseAuth.currentUser;

    if (firebaseUser == null) {
      return SignIn();
    } else {
      user != null ? user.reload() : null;

      if (user != null ? user.emailVerified : false) {
        return Main();
      } else {
        return Verify();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return checkUser(firebaseUser);
  }
}

class Main extends StatefulWidget {
  @override

  /// Startet neuen Widget-State
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  void initState() {
    super.initState();
    Provider.of<GroupProvider>(context, listen: false).initGroup();
    Provider.of<ColorProvider>(context, listen: false).initColors();
    Provider.of<DisplayProvider>(context, listen: false).initDisplay();
  }

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
