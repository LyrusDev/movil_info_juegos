import 'package:flutter/material.dart';
import 'package:movil_info_juegos/src/animations/fade_animations.dart';

class RequirementDetails extends StatelessWidget {
  const RequirementDetails({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FadeAnimation(
        intervalStart: 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'CPU',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              Text(
                data['cpu'],
                style: const TextStyle(color: Colors.white54),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'RAM',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              Text(
                data['ram'],
                style: const TextStyle(color: Colors.white54),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'Tarjeta Gráfica',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              Text(
                data['graphics'],
                style: const TextStyle(color: Colors.white54),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'Sistema Operativo',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              Text(
                data['os'],
                style: const TextStyle(color: Colors.white54),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'Almacenamiento',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70),
              ),
              Text(
                data['storage'],
                style: const TextStyle(color: Colors.white54),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
