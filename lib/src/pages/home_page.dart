import 'package:flutter/material.dart';
import 'package:movil_info_juegos/src/widgets/header_widget.dart';
import 'package:movil_info_juegos/src/widgets/list_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 16, 16, 16),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: statusBarHeight + 6),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: const Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: HeaderWidget()),
              ListElements()
            ],
          ),
        ));
  }
}
