import 'package:dnafit_flutter/models/session.dart';
import 'package:dnafit_flutter/utils/storageUtils.dart';
import 'package:dnafit_flutter/widgets/cross_selling_info.dart';
import 'package:flutter/material.dart';
import '../widgets/cross_selling_info.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, this.name = ''});

  final String title;
  final String name;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title
        ),
      ),
      body: Consumer<Session>(
        builder: (context, session, child){
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(session.sessionId)
                ],
              ),
            ),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
