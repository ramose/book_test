import 'dart:convert';
import 'dart:developer';

import 'package:book_test/components/type/image.type.dart';
import 'package:book_test/components/type/text.type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookComp extends StatefulWidget {
  const BookComp({super.key});

  @override
  State<BookComp> createState() => _BookCompState();
}

class _BookCompState extends State<BookComp> {
  List<dynamic> pages = [];
  Map<String, dynamic> jsonData = {};
  List<dynamic> chapters = [];
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJsonFromAssets();
  }

  Future<void> loadJsonFromAssets() async {
    try {
      // Load the JSON file
      String jsonString =
          await rootBundle.loadString('assets/data/sections.json');
      // Decode the JSON
      jsonData = jsonDecode(jsonString);

      // Print or use the JSON data
      log('${jsonData['sections'][0]['chapters'][0]['name']}');
      setState(() {
        chapters = jsonData['sections'][0]['chapters'];
      });
    } catch (e) {
      log("Error loading JSON: $e");
    }
  }

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView.builder(
              physics: currentIndex == 1
                  ? const NeverScrollableScrollPhysics()
                  : null,
              onPageChanged: (value) => updateIndex(value),
              itemCount: chapters.length,
              itemBuilder: (context, index) {
                List<dynamic> body = chapters[index]['body'];
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      children: [
                        Text(chapters[index]['name']),
                        ...List.generate(body.length, (index) {
                          if (body[index]['type'] == 'text') {
                            return TextType(content: body[index]['text']);
                          }
                          if (body[index]['type'] == 'image') {
                            return ImageType(imageUrl: body[index]['url']);
                          }
                          return Container();

                          //xt(body[index]);
                        })
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
