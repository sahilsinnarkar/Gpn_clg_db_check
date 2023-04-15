import 'package:myapp/constants.dart';
import 'package:myapp/screens/info screen/tabs/executive screen/executive_dummy.dart';
import 'package:myapp/screens/info screen/tabs/executive screen/executive_item.dart';
import 'package:flutter/material.dart';

class Exec extends StatelessWidget {

  static String routeName= 'Exec';

  const Exec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: const Text(
          'EXECUTIVES',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Marcellus',
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

