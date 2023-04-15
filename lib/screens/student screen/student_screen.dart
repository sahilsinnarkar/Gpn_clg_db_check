import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import 'other screens/curriculum_screen.dart';

class StudentScreen extends StatelessWidget {
  const StudentScreen({Key? key}) : super(key: key);
  static String routeName = 'StudentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          //upper part
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            color: kPrimaryColor,
            child: const Center(
              child: Text(
                "STUDENT DESK",
                style: TextStyle(
                  fontFamily: 'Marcellus',
                  decoration: TextDecoration.none,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: kTextWhiteColor,
                ),
              ),
            ),
          ),
          //lower part
          Expanded(
            child: Container(
              color: kPrimaryColor,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: kEventItemCard,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          title: "Result",
                          img: "assets/icons/result.png",
                          onPress: () {
                            _launchURL("https://gpnashik.ac.in/result.php");
                          },
                        ),
                        HomeCard(
                            title: "Calendar",
                            img: "assets/icons/calendar.png",
                            onPress: () async {
                              const url =
                                  "https://gpnashik.ac.in/assets/img/academic/Academic_calendar.pdf";
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CurriculumScreen()),
                            );
                          },
                          title: "Curriculum",
                          img: "assets/icons/documents.png",
                        ),
                        HomeCard(
                          title: "Admission",
                          img: "assets/icons/student.png",
                          onPress: () {
                            _launchURL(
                                'https://poly22.dte.maharashtra.gov.in/diploma22/');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(
        urlString,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      print("Can't launch url");
    }
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key, required this.onPress, required this.title, required this.img})
      : super(key: key);
  final VoidCallback onPress;
  final String img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Material(
        elevation: 4,
        color: kTextBlackColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
            //border: ,
            color: kWhite,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  img,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
