import 'package:flutter/material.dart';
import 'package:test_bondy/src/utils/utils_colors.dart';
import 'package:test_bondy/src/widgets/label_title.dart';

import '../utils/utils_validations.dart';

class CardDesTime extends StatelessWidget {
  final String title;
  final double subTitle;
  final String icons;
  final String windgust;
  final Color textColor;
  final Color backgroundColor;
  const CardDesTime({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icons,
    required this.windgust,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    IconData _statusIcon = Icons.ac_unit;

    switch (icons) {
      case 'rain':
        _statusIcon = Icons.cloudy_snowing;
        break;
      case 'cloudy':
        _statusIcon = Icons.cloud;
        break;
      case 'partly-cloudy-night':
        _statusIcon = Icons.nights_stay_rounded;
        break;
      case 'partly-cloudy-day':
        _statusIcon = Icons.sunny_snowing;
        break;
      case 'clear-day':
        _statusIcon = Icons.sunny;
        break;
      case 'clear-night':
        _statusIcon = Icons.nightlight_rounded;
        break;

      default:
    }
    return Container(
      padding: EdgeInsets.all(8),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LabelTitle(
            title: title,
            fontSize: 14,
            textColor: textColor,
            fontWeight: FontWeight.bold,
          ),
          Icon(
            _statusIcon,
            size: 30,
          ),
          LabelTitle(
            title: ' ${farToCel(subTitle)}° C',
            fontSize: 10,
            textColor: textColor,
            fontWeight: FontWeight.bold,
          ),
          Icon(
            Icons.air,
            size: 30,
          ),
          LabelTitle(
            title: '$windgust',
            fontSize: 10,
            textColor: textColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
