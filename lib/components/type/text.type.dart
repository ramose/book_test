// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextType extends StatelessWidget {
  final String content;

  const TextType({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 15,
      content,
      overflow: TextOverflow.ellipsis,
    );
  }
}
