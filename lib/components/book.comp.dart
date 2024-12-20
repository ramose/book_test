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

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await loadJsonFromAssets();
    extractChapters();
  }

  Future<void> loadJsonFromAssets() async {
    try {
      String jsonString =
          await rootBundle.loadString('assets/data/sections.json');
      jsonData = jsonDecode(jsonString);

      //* Adding cover page and section title */
      pages.add({'type': 'cover', 'text': 'Cover'});
      pages.add({'type': 'section', 'text': jsonData['sections'][0]['name']});

      chapters = jsonData['sections'][0]['chapters'];

      setState(() {});
    } catch (e) {
      log("Error loading JSON: $e");
    }
  }

  //* Add chapters to pages list */
  void extractChapters() {
    for (var chapter in chapters) {
      pages.add(chapter);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: pages.length == 2
              ? const Center(child: CircularProgressIndicator())
              : PageView.builder(
                  itemCount: pages.length,
                  itemBuilder: (context, index) {
                    if (index <= 1) {
                      return TextType(content: pages[index]['text']);
                    }
                    List<dynamic> body = pages[index]['body'];
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            TextType(
                              content: pages[index]['name'],
                              fontSize: 25,
                            ),
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
