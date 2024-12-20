// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ImageType extends StatelessWidget {
  final String imageUrl;

  const ImageType({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
