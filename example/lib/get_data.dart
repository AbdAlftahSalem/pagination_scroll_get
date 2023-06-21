import 'package:get/get.dart';
import 'package:pagination_scroll_get_example/post_model.dart';

enum ApiCallStatus {
  loading,
  success,
  error,
  hold,
}

class GetData extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.hold;
  List<PostModel> posts = [];

  changeApiCallStatus(ApiCallStatus apiCallStatus) {
    this.apiCallStatus = apiCallStatus;
    update();
  }

  getData({int length = 10}) async {
    changeApiCallStatus(ApiCallStatus.loading);

    for (int i = 0; i < length; ++i) {
      posts.add(PostModel(
        userId: i,
        id: i,
        title: "Title ${i + 1}",
        body: "Body ${i + 1}",
      ));
    }
    await Future.delayed(const Duration(seconds: 2));
    changeApiCallStatus(ApiCallStatus.success);
    update();
  }

  loadMoreData({int length = 10}) async {
    for (int i = 0; i < length; ++i) {
      posts.add(PostModel(
        userId: i,
        id: i,
        title: "Title ${i + 1}",
        body: "Body ${i + 1}",
      ));
    }
    await Future.delayed(const Duration(seconds: 2));
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
