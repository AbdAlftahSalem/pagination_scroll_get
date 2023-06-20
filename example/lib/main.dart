import 'package:flutter/material.dart';
import 'package:pagination_scroll_get/pagination_scroll.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(),
        body: PaginationScrollScreen(
          showWidget: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                50,
                    (index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 30,
                  color: Colors.teal,
                  child: Text("$index"),
                ),
              ),
            ),
          ),
          scrollController: scrollController,
          loadingFunction: () => print("Load more"),
        ),
      ),
    );
  }
}
