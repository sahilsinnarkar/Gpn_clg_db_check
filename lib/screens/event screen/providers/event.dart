import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Event with ChangeNotifier {
  final String? id;
  final String name;
  final String imageUrl;
  final String description;
  final String date;

  Event(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.date});

  toJson() {
    return {
      "name": name,
      "description": description,
      "imageUrl": imageUrl,
      "date": date,
    };
  }

  factory Event.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Event(
      id: document.id,
      name: data['name'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      date: data['date'],
    );
  }
}
