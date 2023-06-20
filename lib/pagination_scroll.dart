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

  final double paddingTop, paddingBottom, paddingStart, paddingEnd;

  const PaginationScrollScreen({
    Key? key,
    required this.showWidget,
    required this.scrollController,
    required this.loadingFunction,
    this.loadingWidget = const CupertinoActivityIndicator(),
    this.errorWidget = const Text("There is an error"),
    this.scrollDirection = Axis.vertical,
    this.paddingTop = 20,
    this.paddingBottom = 20,
    this.paddingStart = 16,
    this.paddingEnd = 16,
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
        // return widget.showWidget;
        return widget.scrollDirection == Axis.vertical
            ? Column(
                children: [
                  Expanded(
                    child: widget.showWidget,
                  ),
                  widgetShow(controller),
                ],
              )
            : Row(
                children: [
                  Expanded(child: widget.showWidget),
                  if (controller.loadingStatus == LoadingStatus.loading)
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: widget.paddingStart,
                        end: widget.paddingEnd,
                      ),
                      child: widget.loadingWidget,
                    ),
                ],
              );
      },
    );
  }

  Widget widgetShow(ControllerPagination controller) {
    return Column(
      children: [
        if (controller.loadingStatus == LoadingStatus.loading)
          Padding(
            padding: EdgeInsets.only(
              top: widget.paddingTop,
              bottom: widget.paddingBottom,
            ),
            child: widget.loadingWidget,
          ),
        if (controller.loadingStatus == LoadingStatus.error)
          Padding(
            padding: EdgeInsets.only(
              top: widget.paddingTop,
              bottom: widget.paddingBottom,
            ),
            child: widget.errorWidget,
          ),
      ],
    );
  }
}
