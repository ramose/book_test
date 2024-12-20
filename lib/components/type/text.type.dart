// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextType extends StatelessWidget {
  final String content;
  final double fontSize;

  const TextType({
    super.key,
    required this.content,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        maxLines: 20,
        content,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
