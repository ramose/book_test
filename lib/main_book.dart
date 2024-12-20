import 'package:book_test/components/book.comp.dart';
import 'package:flutter/material.dart';

class MainBook extends StatefulWidget {
  const MainBook({super.key});

  @override
  State<MainBook> createState() => _MainBookState();
}

class _MainBookState extends State<MainBook> {
  // List<Widget> bookPages = [const Placeholder(), const BookComp()];

  final PageController _outerController = PageController();
  final PageController _innerController = PageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.primaryDelta! > 0) {
            // Swiping to the left (next page)
            _outerController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          } else if (details.primaryDelta! < 0) {
            // Swiping to the right (previous page)
            _outerController.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn);
          }
        },
        child: PageView(
          controller: _outerController,
          children: const [
            Placeholder(),
            BookComp(),
          ],
        ));
  }
}
