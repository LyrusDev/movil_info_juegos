import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movil_info_juegos/src/pages/detail_page.dart';
import 'package:palette_generator/palette_generator.dart';

class ListElements extends StatefulWidget {
  const ListElements({super.key});
  @override
  State<ListElements> createState() => _ListElementsState();
}

class _ListElementsState extends State<ListElements> {
  double _widthScreen = 0;
  final titleStyleText = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  List<Map<String, dynamic>> gameList = [];

  @override
  void initState() {
    super.initState();
    cargarArchivoJson();
  }

  Future<void> cargarArchivoJson() async {
    try {
      final String data = await rootBundle.loadString('assets/games.json');
      final List<dynamic> parsedData = json.decode(data);
      setState(() {
        gameList = parsedData.cast<Map<String, dynamic>>();
      });
    } catch (error) {
      print('Error al cargar el archivo JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    _widthScreen = MediaQuery.of(context).size.width - 50;
    return Expanded(
      child: ListView(padding: const EdgeInsets.all(25), children: [
        Text("Populares", style: titleStyleText),
        const SizedBox(
          height: 15,
        ),
        Row(children: [
          BloquesPortada(data: gameList[3]),
          SizedBox(
            width: _widthScreen * 0.03,
          ),
          BloquesPortada(data: gameList[2]),
          SizedBox(
            width: _widthScreen * 0.03,
          ),
          BloquesPortada(data: gameList[1]),
        ]),
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 62, 62, 62),
        ),
        const SizedBox(
          height: 20,
        ),
        Text("Nuevos", style: titleStyleText),
        const SizedBox(
          height: 15,
        ),
        ...(gameList.map((e) => BloqueElement(data: e)).toList())
      ]),
    );
  }
}

class BloquesPortada extends StatefulWidget {
  const BloquesPortada({
    super.key,
    required this.data,
  });
  final Map<String, dynamic> data;

  @override
  State<BloquesPortada> createState() => _BloquesPortadaState();
}

class _BloquesPortadaState extends State<BloquesPortada> {
  late Future<PaletteGenerator> _paletteGeneratorFuture;
  double _widthScreen = 0;

  @override
  void initState() {
    super.initState();
    _paletteGeneratorFuture = _updatePaletteGenerator(widget.data['cover']);
  }

  @override
  Widget build(BuildContext context) {
    _widthScreen = MediaQuery.of(context).size.width - 50;
    return FutureBuilder<PaletteGenerator>(
        future: _paletteGeneratorFuture,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => DetailPage(
                        color: snapshot.data!.colors.first,
                        data: widget.data,
                      )));
            },
            child: Column(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(widget.data['icon'],
                    width: _widthScreen * 0.31, height: 110, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.data['name'],
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              )
            ]),
          );
        });
  }
}

Future<PaletteGenerator> _updatePaletteGenerator(String image) async {
  AssetImage assetImage = AssetImage(image);
  return await PaletteGenerator.fromImageProvider(
    assetImage,
    size: const Size(65, 65),
    maximumColorCount: 20,
  );
}

class BloqueElement extends StatefulWidget {
  const BloqueElement({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<BloqueElement> createState() => _BloqueElementState();
}

class _BloqueElementState extends State<BloqueElement> {
  final titleTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26);

  final subTitleTextStyle = const TextStyle(color: Colors.white, fontSize: 17);

  late Future<PaletteGenerator> _paletteGeneratorFuture;

  @override
  void initState() {
    super.initState();
    _paletteGeneratorFuture = _updatePaletteGenerator(widget.data['cover']);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PaletteGenerator>(
        future: _paletteGeneratorFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                height: 80,
                child: Text(
                  'Cargando...',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => DetailPage(
                          color: snapshot.data!.colors.first,
                          data: widget.data,
                        )));
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(66, 56, 55, 55),
                ),
                height: 68,
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
                                  color: snapshot.data!.colors.first)
                            ], borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(8),
                            child: Hero(
                              tag: snapshot.data!.paletteColors.first,
                              child: Image.asset(widget.data['cover']),
                            )),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.data['name'],
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
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
          } else {
            return Container();
          }
        });
  }
}
