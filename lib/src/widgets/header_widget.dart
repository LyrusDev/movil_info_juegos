import 'package:flutter/material.dart';
import 'package:movil_info_juegos/src/widgets/blur_container.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});
  final titleTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26);
  final subTitleTextStyle = const TextStyle(color: Colors.white, fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return BlurContainer(
      child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(25),
          height: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Juegos PC", style: titleTextStyle),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.1)),
                    child: IconButton(
                      icon: const Icon(Icons.search,
                          size: 28, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black.withOpacity(.1)),
                      child: IconButton(
                        icon: const Icon(Icons.notifications,
                            size: 28, color: Colors.white),
                        onPressed: () {},
                      ))
                ],
              ),
            ],
          )),
    );
  }
}
