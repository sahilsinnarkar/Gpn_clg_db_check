import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';

class Members extends StatelessWidget {
  final String imageUrl;
  final String name;

  const Members(
      {super.key,
        required this.imageUrl,
        required this.name}
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color:  kPrimaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    imageUrl,
                  ),
                ),
                const SizedBox(width: 10,),
                SizedBox(
                  height : MediaQuery.of(context).size.height/5.6,
                  width : MediaQuery.of(context).size.width/2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: kWhite,
                          fontSize: 20,
                          fontFamily: 'Marcellus',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        thickness: 3,
                        indent: 0,
                        color: kWhite,
                      ),
                      const Text(
                        'Computer Technology 2023',
                        style: TextStyle(
                          fontFamily: 'Marcellus',
                          fontSize: 15,
                          color: kWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
