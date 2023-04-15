import '../../../constants.dart';
import '../event_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../providers/event.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  // final String id;
  // final String name;
  // final String imageUrl;
  // final String date;

  // EventItem(
  //     {required this.id,
  //     required this.name,
  //     required this.imageUrl,
  //     required this.date});

  // void selectEvent(BuildContext context) {
  //   final event = Provider.of<Event>(context, listen: false);
  //
  //   // Navigator.push(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //       builder: (_) => EventDetailScreen()),
  //   // );
  //
  //   Navigator.of(context).pushNamed(EventDetailScreen.routeName,
  //   arguments: event.id,
  //   );



  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    return InkWell(
        onTap: (){},
        child: Card(
          color: kPrimaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                event.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: kWhite,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    event.date,
                    style: const TextStyle(
                        color: kWhite,
                        fontSize: 15,
                      fontFamily: 'Marcellus',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                event.name,
                style: GoogleFonts.libreBaskerville(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: kWhite,
                    fontFamily: 'Marcellus',
                  ),
                ),
              ),
            ),
            Container(
              width: 500,
              height: 145,
              margin:
              EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Scrollbar(
                thumbVisibility: false, //always show scrollbar
                thickness: 5, //width of scrollbar
                radius:
                Radius.circular(20), //corner radius of scrollbar
                scrollbarOrientation: ScrollbarOrientation.right,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          event.description,
                          style: const TextStyle(
                            fontSize: 15,
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
  }
}
