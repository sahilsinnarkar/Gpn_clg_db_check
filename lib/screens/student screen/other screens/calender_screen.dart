import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  static String routeName = 'CalendarScreen';

  @override
  Widget build(BuildContext context) {
    //edit code from here
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Academic Calender 2021-22'),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Academic calender 2021-22',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                IconButton(
                    icon: Icon(Icons.calendar_today,),
                    iconSize: 70,
                    onPressed: () async {
                      const url = "https://gpnashik.ac.in/assets/img/academic/Academic_calendar.pdf";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                )
              ],
            ),
        ),
        );
    }
}