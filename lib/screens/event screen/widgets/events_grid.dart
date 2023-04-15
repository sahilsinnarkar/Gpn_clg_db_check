import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/events.dart';
import './event_item.dart';

class EventsGrid extends StatelessWidget {
  const EventsGrid({super.key});

  Future<void> _refreshEvents(BuildContext context) async {
    await Provider.of<Events>(context, listen: false).fetchAndSetEvents();
  }

  @override
  Widget build(BuildContext context) {
    final eventsData = Provider.of<Events>(context);
    final events = eventsData.items;

    return RefreshIndicator(
      onRefresh: () => _refreshEvents(context),
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          // create: (c) => events[index],
          value: events[index],
          child: const EventItem(
              // id: events[index].id,
              // name: events[index].name,
              // imageUrl: events[index].imageUrl,
              // date: events[index].date,
              ),
        ),
      ),
    );
  }
}
