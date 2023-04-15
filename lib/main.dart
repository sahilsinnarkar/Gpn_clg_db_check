import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/routes/routes.dart';
import 'package:myapp/screens/event%20screen/providers/events.dart';
import 'package:myapp/screens/home%20screen/home_screen.dart';
import 'package:myapp/screens/info%20screen/info_screen.dart';
import 'package:myapp/screens/event%20screen/newsfeed_screen.dart';
import 'package:myapp/screens/settings%20screen/settings_screen.dart';
import 'package:myapp/screens/student%20screen/student_screen.dart';
import 'package:myapp/utils.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 2;
  static const screens = [
    InfoScreen(),
    StudentScreen(),
    HomeScreen(),
    NewsfeedScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Events(),
      child: MaterialApp(
        title: 'Flutter',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: screens[_index],
          backgroundColor: kPrimaryColor,
          bottomNavigationBar: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
              child: GNav(
                style: GnavStyle.google,
                duration: const Duration(milliseconds: 500),
                backgroundColor: Colors.transparent,
                color: kWhite,
                textStyle: const TextStyle(color: kPrimaryColor),
                activeColor: kEventItemCard,
                tabBackgroundColor: kEventItemCard,
                hoverColor: kPrimaryLight,
                gap: 5,
                padding: const EdgeInsets.all(16),
                tabs: const [
                  GButton(
                    iconActiveColor: kPrimaryColor,
                    icon: Icons.info_outline_rounded,
                    text: 'About',
                  ),
                  GButton(
                    iconActiveColor: kPrimaryColor,
                    icon: Icons.school_outlined,
                    text: 'Student',
                  ),
                  GButton(
                    iconActiveColor: kPrimaryColor,
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    iconActiveColor: kPrimaryColor,
                    icon: Icons.newspaper_rounded,
                    text: 'Newsfeed',
                  ),
                  GButton(
                    iconActiveColor: kPrimaryColor,
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: _index,
                onTabChange: (value) {
                  setState(() {
                    _index = value;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
