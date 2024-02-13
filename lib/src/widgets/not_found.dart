import 'package:flutter/material.dart';

import 'label_title.dart';

class TagNotFound extends StatelessWidget {
  final String title;
  final String subTitle;
  final double fontSize;
  final IconData icon;

  const TagNotFound(
      {super.key,
      this.title = 'No se encontraron resultados',
      this.subTitle = 'Expande tus opciones de búsqueda \ne intenta nuevamente',
      this.fontSize = 14,
      this.icon = Icons.search});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: fontSize * 3,
          child: Icon(icon, color: Colors.black, size: fontSize * 2),
        ),
        SizedBox(height: 10),
        LabelTitle(
          title: title,
          alignment: Alignment.center,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          maxLines: 5,
          textColor: Colors.black,
        ),
        LabelTitle(
          title: subTitle,
          alignment: Alignment.center,
          maxLines: 5,
          textAlign: TextAlign.center,
          textColor: Colors.black,
        ),
      ],
    );
  }
}
