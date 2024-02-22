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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      body: Column(
        children: <Widget>[HeaderWidget(), ListElements()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 95, 25, 208),
      ),
    );
  }
}
