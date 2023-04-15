import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Team/about_team.dart';

class SettingsScreen extends StatelessWidget {
  static String routeName = 'SettingsScreen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 20,
          ),
          headingTile(),
          divider(),
          colorTiles(context),
        ],
      ),
    );
  }

  Widget headingTile() {
    return const ListTile(
      minLeadingWidth: 100,
      title: Text(
        "SETTINGS",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontFamily: 'Marcellus',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget colorTiles(BuildContext context) {
    return Column(
      children: [
        colorTile(
          Icons.privacy_tip_outlined,
          kSecondaryColor,
          "Privacy Policy",
          () {
            _launchURL('https://gpnashikapp.github.io/gpn-app-privacy-policy/');
          },
        ),
        colorTile(
          Icons.report_problem,
          kSecondaryColor,
          "Complaint",
          () {
              _launchURL('https://forms.gle/xiJDJgMGpKx7yPXm9');
          },
        ),
        colorTile(
          Icons.feedback,
          kSecondaryColor,
          "Feedback/ Suggestion",
          () {
            _launchURL('https://forms.gle/sZP7Wbkx6j2tw9Hg8');
          },
        ),
        colorTile(
          Icons.people_alt_outlined,
          kSecondaryColor,
          "About Team",
          () {
            HapticFeedback.heavyImpact();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutTeam()),
            );
          },
        ),
      ],
    );
  }

  Widget colorTile(
      IconData icon, Color color, String text, VoidCallback onPress) {
    return SizedBox(
      height: 70,
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color.withOpacity(0.9),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            icon,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: kWhite,
            fontFamily: 'Marcellus',
          ),
        ),
        trailing: GestureDetector(
          onTap: onPress,
          child: const Icon(
            Icons.arrow_forward_ios,
            color: kTextWhiteColor,
            size: 24,
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String urlString) async {
    if (await canLaunch(urlString)) {
      await launch(
        urlString,
      );
    } else {
      print("Can't launch url");
    }
  }

}
