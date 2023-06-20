import 'package:get/get.dart';
import 'package:pagination_scroll_get_example/dio_manger.dart';
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

  getData() async {
    changeApiCallStatus(ApiCallStatus.loading);
    final response =
        await DioManagerClass.getInstance.dioGetMethod(url: '/posts');

    for (var i in response.data) {
      posts.add(PostModel.fromMap(i));
    }
    changeApiCallStatus(ApiCallStatus.success);
    update();
  }

  loadMoreData() async {
    await Future.delayed(const Duration(seconds: 4));
    posts.add(PostModel(
      userId: 0,
      id: 0,
      title: "title",
      body: "body",
    ));
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
