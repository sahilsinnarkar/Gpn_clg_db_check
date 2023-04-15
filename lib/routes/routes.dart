import 'package:flutter/material.dart';
import 'package:myapp/screens/home screen/home_screen.dart';
import 'package:myapp/screens/info%20screen/tabs/courses/courses_screen.dart';
import '../screens/event screen/event_detail_screen.dart';
import '../screens/event screen/newsfeed_screen.dart';
import '../screens/info screen/info_screen.dart';
import '../screens/info screen/tabs/executive screen/executive_screen.dart';
import '../screens/info screen/tabs/gallery/detailspage.dart';
import '../screens/info screen/tabs/gallery/gallery_screen.dart';
import '../screens/info screen/tabs/history/history_screen.dart';
import '../screens/settings screen/Team/about_team.dart';
import '../screens/settings screen/settings_screen.dart';
import '../screens/student screen/other screens/calender_screen.dart';
import '../screens/student screen/other screens/curriculum_screen.dart';
import '../screens/student screen/student_screen.dart';

Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  StudentScreen.routeName: (context) => StudentScreen(),
  InfoScreen.routeName: (context) => InfoScreen(),
  NewsfeedScreen.routeName: (context) => NewsfeedScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
 // EventDetailScreen.routeName: (context) => EventDetailScreen(),
  CurriculumScreen.routeName: (context) => CurriculumScreen(),
  CalendarScreen.routeName: (context) => CalendarScreen(),
  Exec.routeName: (context) => Exec(),
  CoursesScreen.routeName: (context) => CoursesScreen(),
  HistoryScreen.routeName: (context) => HistoryScreen(),
  GalleryScreen.routeName: (context) => GalleryScreen(),
  AboutTeam.routeName: (context) => AboutTeam(),
  DetailsPage.routeName: (context) => DetailsPage(
    imagePath: '',
  ),
};

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch (settings.name) {
      case eventDetailScreen:
        return MaterialPageRoute(builder: (context) => EventDetailScreen());
    }

    return MaterialPageRoute(
      builder: (context) => const Scaffold(body: Text('no route defined!'),),
    );
  }
}

const String eventDetailScreen = '/EventDetailScreen';
