import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class CurriculumScreen extends StatefulWidget {

  static String routeName= 'CurriculumScreen';

  const CurriculumScreen({super.key});

  @override
  State<CurriculumScreen> createState() => _CurriculumScreenState();
}

class _CurriculumScreenState extends State<CurriculumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text(
            'CURRICULUM',
          style: TextStyle(
            fontFamily: 'Marcellus',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            //for padding
            physics: const BouncingScrollPhysics(),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HomeCard(
                  onPress: () async {
                    String url =
                        "https://gpnashik.ac.in/assets/pdf/curriculum/21/CM21.pdf";
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Computer\nEngineering',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/IF21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Information\nTechnology',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/CE21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Civil\n Engineering',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/EE21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Electrical\n Engineering',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        "https://gpnashik.ac.in/assets/pdf/curriculum/21/EL21.pdf";
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Electronics &\nTelecommunication',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/AE21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Automobile\n Engineering',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/PO21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Polymer\n Engineering',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/DD21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Dress Designing &\nGarments Manf.',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/ME21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Mechanical \nEngineering',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/ID21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Interior Design &\nDecoration',
                ),
                HomeCard(
                  onPress: () async {
                    String url =
                        'https://gpnashik.ac.in/assets/pdf/curriculum/21/MK21.pdf';
                    Uri uri = Uri.parse(url);

                    if (await canLaunch(uri.toString())) {
                      await launch(uri.toString());
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  title: 'Mechatronics\nEngineering',
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
        required this.onPress,
        required this.title
      })
      : super(key: key);
  final VoidCallback onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(top: 35),
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 9,
        decoration: BoxDecoration(
          color: kEventItemCard,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
            ), //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.file_copy,
              size: 40,
              color: kPrimaryColor,
            ),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
              ),
            ),

            const Icon(
              Icons.navigate_next,
              size: 30,
              color: kPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
