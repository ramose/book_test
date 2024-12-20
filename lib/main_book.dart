import 'package:book_test/components/book.comp.dart';
import 'package:flutter/material.dart';

class MainBook extends StatefulWidget {
  const MainBook({super.key});

  @override
  State<MainBook> createState() => _MainBookState();
}

class _MainBookState extends State<MainBook> {
  List<Widget> bookPages = [const Placeholder(), const BookComp()];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemBuilder: (context, index) => bookPages[index],
        itemCount: bookPages.length);
  }
}
