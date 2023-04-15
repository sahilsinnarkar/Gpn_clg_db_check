import 'package:myapp/constants.dart';

import 'dummy.dart';
import 'item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses module ',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const CoursesScreen(),
    );
  }
}

class CoursesScreen extends StatelessWidget {

  static String routeName = 'CoursesScreen';

  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          'COURSES',
          style: TextStyle(
            fontFamily: 'Marcellus',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Item(
              post: DUMMY_EVENTS[index].post,
              imageUrl: DUMMY_EVENTS[index].imageUrl,
              name: DUMMY_EVENTS[index].name);
        },
        itemCount: DUMMY_EVENTS.length,
      ),
    );
  }
}
