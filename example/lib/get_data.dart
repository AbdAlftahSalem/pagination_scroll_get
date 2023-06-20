import 'package:get/get.dart';
import 'package:pagination_scroll_get_example/dio_manger.dart';

enum ApiCallStatus {
  loading,
  success,
  error,
  hold,
}

class GetData extends GetxController {
  ApiCallStatus apiCallStatus = ApiCallStatus.hold;

  changeApiCallStatus(ApiCallStatus apiCallStatus) {
    this.apiCallStatus = apiCallStatus;
    update();
  }

  getData() async {
    final response =
        await DioManagerClass.getInstance.dioGetMethod(url: '/posts');

    print(response.data);
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
