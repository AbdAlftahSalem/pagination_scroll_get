import 'package:flutter/material.dart';
import 'package:pagination_scroll_get/pagination_scroll.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: PaginationScrollScreen(),
    );
  }
}
