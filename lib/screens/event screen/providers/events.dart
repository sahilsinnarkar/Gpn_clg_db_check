import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'event.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_database/firebase_database.dart';

class Events with ChangeNotifier {
  List<Event> _items = [
    // Event(
    //     id: '1',
    //     name: 'SPANDAN',
    //     description:
    //         'Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu dolor eu nisi ornare vestibulum. Integer ac mollis risus. Curabitur enim odio, consectetur a orci laoreet, tempus vulputate dui. Nullam ut enim a felis ornare sagittis. Aliquam faucibus venenatis euismod. Fusce sed risus eget purus egestas lacinia ut eget dolor. Praesent justo ipsum, sagittis et venenatis volutpat, aliquet eget nulla. Nam commodo ante lorem, non pulvinar est accumsan in.',
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2018/05/10/11/34/concert-3387324_960_720.jpg',
    //     date: '19/03/2023'),
    // Event(
    //     id: '2',
    //     name: 'CMSA',
    //     description:
    //         'Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu dolor eu nisi ornare vestibulum. Integer ac mollis risus. Curabitur enim odio, consectetur a orci laoreet, tempus vulputate dui. Nullam ut enim a felis ornare sagittis. Aliquam faucibus venenatis euismod. Fusce sed risus eget purus egestas lacinia ut eget dolor. Praesent justo ipsum, sagittis et venenatis volutpat, aliquet eget nulla. Nam commodo ante lorem, non pulvinar est accumsan in.',
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2020/04/11/18/05/red-matrix-5031496_960_720.jpg',
    //     date: '27/07/2003'),
    // Event(
    //     id: '3',
    //     name: 'Sport events inter college',
    //     description:
    //         'Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu dolor eu nisi ornare vestibulum. Integer ac mollis risus. Curabitur enim odio, consectetur a orci laoreet, tempus vulputate dui. Nullam ut enim a felis ornare sagittis. Aliquam faucibus venenatis euismod. Fusce sed risus eget purus egestas lacinia ut eget dolor. Praesent justo ipsum, sagittis et venenatis volutpat, aliquet eget nulla. Nam commodo ante lorem, non pulvinar est accumsan in.',
    //     imageUrl:
    //         'https://cdn.pixabay.com/photo/2020/01/12/16/57/stadium-4760441_960_720.jpg',
    //     date: '07/17/2003'),
  ];

  List<Event> get items {
    return [..._items];
  }

  final _db = FirebaseFirestore.instance;
  Future fetchAndSetEvents() async {
    final snapshot = await _db.collection('Events').get();
    final extractedData =
        snapshot.docs.map((e) => Event.fromSnapshot(e)).toList();
    // return extractedData;
    _items = extractedData;
    notifyListeners();

    // final url = Uri.parse(
    //     ' https://events-9f8e0-default-rtdb.firebaseio.com/events.json');
    // try {
    //   final response = await http.get(url);
    //   final extractedData = json.decode(response.body) as Map<String, dynamic>;
    //   final List<Event> loadedEvents = [];
    //   extractedData.forEach((eventId, eventData) {
    //     loadedEvents.insert(
    //       0,
    //       Event(
    //           id: eventId,
    //           name: eventData['name'],
    //           description: eventData['description'],
    //           imageUrl: eventData['imageUrl'],
    //           date: eventData['date']),
    //     );
    //   });
    //   _items = loadedEvents;
    //   notifyListeners();
    // catch (error) {
    //   throw (error);
    // }
  }

  Event findById(String id) {
    return _items.firstWhere((event) => event.id == id);
  }
}
