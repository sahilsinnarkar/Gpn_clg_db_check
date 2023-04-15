import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/events_grid.dart';
import './providers/events.dart';
import '../../constants.dart';

void main() {
  runApp(const NewsfeedScreen());
}

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  static String routeName = 'NewsfeedScreen';

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    Provider.of<Events>(context, listen: false).fetchAndSetEvents();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Events>(context).fetchAndSetEvents().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      _isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text(
          'EVENTS',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Marcellus',
          ),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            )
          : const EventsGrid(),
    );
    // routes: {EventDetailScreen.routeName: (context) => EventDetailScreen()},
  }
}
