import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginationScrollScreen extends StatefulWidget {
  final Widget showWidget;
  final Widget? loadingWidget;

  final ScrollController scrollController;
  final Axis scrollDirection;

  final Function loadingFunction;

  const PaginationScrollScreen({
    Key? key,
    required this.showWidget,
    required this.scrollController,
    required this.loadingFunction,
    this.loadingWidget = const CupertinoActivityIndicator(),
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  State<PaginationScrollScreen> createState() => _PaginationScrollScreenState();
}

class _PaginationScrollScreenState extends State<PaginationScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
