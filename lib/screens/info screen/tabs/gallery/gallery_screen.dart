import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../constants.dart';
import 'detailspage.dart';


List<ImageDetails> _images = [
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i6.jpg'),

  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba1.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba3.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba2.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba4.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba5.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba6.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba7.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/nba8.JPG'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i2.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i3.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i4.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i5.jpg'),

  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i7.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i8.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i9.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i10.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i11.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i12.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i13.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i20.jpg'),
  ImageDetails(
      imagePath: 'https://gpnashik.ac.in/assets/img/gallery/i1.jpg'),




];



class ImageDetails {
  final String imagePath;

  ImageDetails({
    required this.imagePath,

  });
}


class GalleryScreen extends StatefulWidget {

  static String routeName ='GalleryScreen';

  const GalleryScreen({super.key});

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;




  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity(){
    subscription =Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if(!isDeviceConnected && isAlertSet ==false){
        showDialogBox();
        setState(() {
          isAlertSet=true;
        });
      }},);
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  showDialogBox(){
    showCupertinoDialog(context: context, builder: (BuildContext context)=>CupertinoAlertDialog(
      title: const Text('No Connection'),
      content : const Text('Please Check your Internet connectivity'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context,'Cancel');
            setState(() {
              isAlertSet = false;});
            isDeviceConnected = await  InternetConnectionChecker().hasConnection;
            if(!isDeviceConnected){
              showDialogBox();
              setState(() {
                isAlertSet = true;
              });
            }

          }, child: const Text('OK'),)
      ],
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Gallery',
          style: TextStyle(
            fontFamily: 'Marcellus',
            fontSize: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                imagePath: _images[index].imagePath,                      ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: Colors.black,
                            ), //Border
                          ),
                        ),
                      );
                    },
                    itemCount: _images.length,
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
