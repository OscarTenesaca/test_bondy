import 'package:flutter/material.dart';
import 'package:test_bondy/src/widgets/label_title.dart';

class InformationIcons extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icons;
  final Color textColor;
  const InformationIcons(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.icons,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icons,
          size: 30,
        ),
        LabelTitle(
          title: title,
          fontSize: 14,
          textColor: textColor,
        ),
        LabelTitle(
          title: subTitle,
          fontSize: 14,
          textColor: textColor,
        ),
      ],
    );
  }
}
