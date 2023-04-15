import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/settings%20screen/Team/member_info.dart';
import 'package:myapp/screens/settings%20screen/Team/team_item.dart';

class AboutTeam extends StatelessWidget {
  const AboutTeam({Key? key}) : super(key: key);

  static String routeName = 'AboutTeam';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Center(
          child: Text(
            "ABOUT TEAM     ",
            style: TextStyle(
              fontFamily: 'Marcellus',
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Container(
        color: kPrimaryColor,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context,index) {
            return Members(
                name: Mem_Info[index].name,
                imageUrl: Mem_Info[index].imageUrl,
            );
          }
        ),
      )
    );
  }
}
