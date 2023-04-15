import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/info%20screen/tabs/executive%20screen/executive_screen.dart';
import 'package:myapp/screens/info%20screen/tabs/gallery/gallery_screen.dart';
import 'package:myapp/screens/info%20screen/tabs/history/history_screen.dart';
import 'component.dart';
import 'tabs/courses/courses_screen.dart';

class InfoScreen extends StatefulWidget {
  static String routeName = 'InfoScreen';

  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          //upper part
          Stack(
            children: [
              Image.asset(
                'assets/images/clgAbout.jpg',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                opacity: const AlwaysStoppedAnimation(.4),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.7,
                //color: kPrimaryColor,
                child: const Center(
                  child: Text(
                    "'QUOTE'",
                    style: TextStyle(
                      fontFamily: 'Montessart',
                      decoration: TextDecoration.none,
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: kTextWhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //lower part
          Expanded(
            child: Container(
              color: kPrimaryColor,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kEventItemCard,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Material(
                        elevation: 4,
                        color: kTextBlackColor,
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          alignment: Alignment.center,
                          width: 200,
                          height: 70,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Text(
                            "ABOUT GPN",
                            style: TextStyle(
                              fontFamily: 'Marcellus',
                              fontSize: 25,
                              color: kTextWhiteColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Tabs(
                                  imagePath: 'assets/images/executive.png',
                                  title: 'EXECUTIVE',
                                  onPress: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Exec()),
                                    );
                                  },
                                ),
                                Tabs(
                                  imagePath: 'assets/images/courses.png',
                                  title: 'COURSES',
                                  onPress: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CoursesScreen()),
                                    );
                                  },
                                ),
                                Tabs(
                                  imagePath: 'assets/images/history.png',
                                  title: 'HISTORY',
                                  onPress: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HistoryScreen()),
                                    );
                                  },
                                ),
                                Tabs(
                                  imagePath: 'assets/images/gallery.png',
                                  title: 'GALLERY',
                                  onPress: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GalleryScreen()),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
