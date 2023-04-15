import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../event screen/newsfeed_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SizedBox(
          width: double.infinity,
          height: 926 * fem,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.2,
                child: Image.asset(
                  'assets/images/clgMainBuild.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 360,
                child: Align(
                  child: ClipPath(
                    clipper: CustomClipPath(),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(30),
                          color: kPrimaryColor,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _launchURL("https://gpnashik.ac.in/");
                                    },
                                    child: SizedBox(
                                      child: Image.asset(
                                        'assets/images/global-1.png',
                                        color: kTextWhiteColor,
                                        width: 35,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      const phoneNo = '+912532461221';
                                      const url = 'tel:$phoneNo';
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      }
                                    },
                                    child: SizedBox(
                                      child: Image.asset(
                                        'assets/images/phone-1.png',
                                        color: kTextWhiteColor,
                                        width: 35,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _launchURL(
                                          "https://goo.gl/maps/PRa9tu6oE5oyEsZJ9");
                                    },
                                    child: SizedBox(
                                      child: Image.asset(
                                        'assets/images/mapSym.png',
                                        color: kTextWhiteColor,
                                        width: 35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: MediaQuery.of(context).size.width,
                                    height: 320,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        EventCard(
                                          onPress: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewsfeedScreen()),
                                            );
                                          },
                                          img: 'assets/images/ellipse-2-bg.png',
                                          eventTitle: 'Event 1',
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        EventCard(
                                          onPress: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewsfeedScreen()),
                                            );
                                          },
                                          img: 'assets/images/ellipse-2-bg.png',
                                          eventTitle: 'Event 2',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0.5,
                right: 0.5,
                top: 330,
                child: Center(
                  child: Material(
                    elevation: 4,
                    color: kTextBlackColor,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'GPN',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Marcellus',
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          height: 1.3 * ffem / fem,
                          color: kTextWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(
        urlString,
        forceWebView: true,
        forceSafariVC: true,
        enableJavaScript: true,
      );
    } else {
      print("Can't launch url");
    }
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.3543147);
    path.quadraticBezierTo(size.width * -0.0050000, size.height * 0.1180203, 0,
        size.height * 0.0540609);
    path.quadraticBezierTo(size.width * -0.0050000, size.height * 0.2825279, 0,
        size.height * 1.0123350);
    path.lineTo(size.width, size.height * 1.0033604);
    path.quadraticBezierTo(size.width * 1.0250000, size.height * 0.2053299,
        size.width, size.height * 0.0271574);
    path.quadraticBezierTo(size.width * 0.5190000, size.height * -0.0220812, 0,
        size.height * 0.0241117);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.onPress,
    required this.img,
    required this.eventTitle,
  }) : super(key: key);

  final VoidCallback onPress;
  final String img;
  final String eventTitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Material(
        elevation: 4,
        color: kTextBlackColor,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 80,
          width: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: kEventItemCard,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  img,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 180,
                //width : 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      eventTitle,
                      style: const TextStyle(
                        fontSize: 19,
                        color: kPrimaryColor,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              const Icon(
                Icons.navigate_next,
                size: 35,
                color: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
