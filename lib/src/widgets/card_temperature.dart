import 'package:flutter/material.dart';
import 'package:test_bondy/src/utils/utils_background.dart';
import 'package:test_bondy/src/utils/utils_colors.dart';
import 'package:test_bondy/src/utils/utils_validations.dart';
import 'package:test_bondy/src/widgets/label_title.dart';

class CardTemperature extends StatelessWidget {
  final String address;
  final double temp;
  final String description;
  final double maxTemp;
  final double minTemp;

  const CardTemperature({
    super.key,
    required this.address,
    required this.temp,
    required this.description,
    required this.maxTemp,
    required this.minTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        color: primaryColor(),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 80),
          const LabelTitle(
            fontSize: 18,
            title: 'Mi Ubicación',
            fontWeight: FontWeight.bold,
            alignment: Alignment.center,
          ),
          LabelTitle(
            title: '${address}'.toUpperCase(),
            alignment: Alignment.center,
            fontWeight: FontWeight.bold,
          ),
          LabelTitle(
            title: '${farToCel(temp)}°',
            fontSize: 80,
            alignment: Alignment.center,
          ),
          LabelTitle(
            title: description,
            alignment: Alignment.center,
            fontWeight: FontWeight.bold,
          ),
          LabelTitle(
            title:
                'Maxima: ${farToCel(maxTemp)}°  Minima: ${farToCel(minTemp)}°',
            alignment: Alignment.center,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
