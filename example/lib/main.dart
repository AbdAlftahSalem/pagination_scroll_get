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
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                20,
                (index) => Container(
                  width: 200,
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  height: 30,
                  color: Colors.teal,
                  child: Center(child: Text("$index")),
                ),
              ),
            ),
          ),
          scrollController: scrollController,
          loadingFunction: () => print("Load more"),
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
