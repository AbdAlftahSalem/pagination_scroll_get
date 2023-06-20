import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_scroll_get/controller_pagination.dart';

class PaginationScrollScreen extends StatefulWidget {
  final Widget showWidget;
  final Widget loadingWidget;
  final Widget errorWidget;

  final ScrollController scrollController;
  final Axis scrollDirection;

  final Function loadingFunction;

  const PaginationScrollScreen({
    Key? key,
    required this.showWidget,
    required this.scrollController,
    required this.loadingFunction,
    this.loadingWidget = const CupertinoActivityIndicator(),
    this.errorWidget = const Text("There is an error"),
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);

  @override
  State<PaginationScrollScreen> createState() => _PaginationScrollScreenState();
}

class _PaginationScrollScreenState extends State<PaginationScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerPagination>(
      init: ControllerPagination(
        scrollController: widget.scrollController,
        loadingFunction: widget.loadingFunction,
      ),
      builder: (controller) {
        return Container(
          // color: Colors.red,
          child: Column(
            children: [
              Expanded(child: widget.showWidget),
              // const SizedBox(height: 20),
              if (controller.loadingStatus == LoadingStatus.loading)
                widget.loadingWidget,
              if (controller.loadingStatus == LoadingStatus.error)
                widget.errorWidget,
              // const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

