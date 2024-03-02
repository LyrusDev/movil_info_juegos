import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movil_info_juegos/src/pages/detail_page.dart';

class ListElements extends StatefulWidget {
  const ListElements({super.key});
  @override
  State<ListElements> createState() => _ListElementsState();
}

class _ListElementsState extends State<ListElements> {
  double _widthScreen = 0;
  final titleStyleText = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    _widthScreen = MediaQuery.of(context).size.width - 50;
    return Expanded(
      child: ListView(padding: const EdgeInsets.all(25), children: [
        Text("Portadas", style: titleStyleText),
        const SizedBox(
          height: 15,
        ),
        Row(children: [
          bloquesPortada("p1.jpg", "titulo", "2021"),
          SizedBox(
            width: _widthScreen * 0.03,
          ),
          bloquesPortada("p2.jpg", "titulo", "2022"),
          SizedBox(
            width: _widthScreen * 0.03,
          ),
          bloquesPortada("p3.jpg", "titulo", "2023"),
        ]),
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 62, 62, 62),
        ),
        const SizedBox(
          height: 20,
        ),
        bloqueElement("Brook", 0xff4913C4, "o1"),
        bloqueElement("Luffy", 0xffF82A2D, "o2"),
        bloqueElement("Portgas D. Ace", 0xffFFCB28, "o3"),
        bloqueElement("Boa Hancock", 0xffFE4649, "o4"),
        bloqueElement("Boa Hancock", 0xffDF1C6A, "o5"),
        bloqueElement("Roronoa Zoro", 0xff21E295, "o6"),
      ]),
    );
  }

  Column bloquesPortada(String image, String title, String subTitle) {
    return Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset("assets/$image",
            width: _widthScreen * 0.31, height: 110, fit: BoxFit.cover),
      ),
      const SizedBox(
        height: 15,
      ),
      RichText(
          text: TextSpan(
              text: title,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              children: [
            TextSpan(
                text: subTitle,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 12))
          ]))
    ]);
  }

  Widget bloqueElement(String name, int color, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => DetailPage(
                  color: color,
                  image: image,
                  name: name,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(66, 56, 55, 55),
        ),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          offset: const Offset(0, 5),
                          spreadRadius: 0.0,
                          blurStyle: BlurStyle.normal,
                          color: Color(color))
                    ], borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(8),
                    child: Hero(
                      tag: color,
                      child: Image.asset("assets/$image.png"),
                    )),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
