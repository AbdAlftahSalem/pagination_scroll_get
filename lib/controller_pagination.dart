import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum LoadingStatus { loading, success, error }

class ControllerPagination extends GetxController {
  late ScrollController scrollController;
  final Function loadingFunction;
  LoadingStatus loadingStatus = LoadingStatus.success;

  ControllerPagination({
    required this.scrollController,
    required this.loadingFunction,
  });

  void changeLoadingStatus(LoadingStatus loadingStatus) {
    this.loadingStatus = loadingStatus;
    update();
  }

  void addListenerToScrollController() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          loadingStatus != LoadingStatus.loading) {
        try {
          changeLoadingStatus(LoadingStatus.loading);
          await loadingFunction();
          await Future.delayed(const Duration(seconds: 3));
          changeLoadingStatus(LoadingStatus.success);
        } catch (e) {
          changeLoadingStatus(LoadingStatus.error);
          throw Exception(e);
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    addListenerToScrollController();
  }
}
