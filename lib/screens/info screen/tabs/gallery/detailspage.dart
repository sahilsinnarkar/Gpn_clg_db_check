import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {

  static String routeName = 'DetailsPage';
  final String imagePath;

  const DetailsPage(
      {super.key,
        required this.imagePath
      });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

          backgroundColor: Colors.white10

      ),

      body: Center(
        child: Container(

          height:MediaQuery.of(context).size.height/2,
          width: double.infinity,
          child: Column(

            children: <Widget>[
              Expanded(


                child: InteractiveViewer(
                  panEnabled: false, // Set it to false
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 0.5,
                  maxScale: 2,
                  child: Container(

                    decoration: BoxDecoration(


                      image: DecorationImage(

                        image: NetworkImage(imagePath),
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
}