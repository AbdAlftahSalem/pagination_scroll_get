import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_scroll_get/pagination_scroll.dart';
import 'package:pagination_scroll_get_example/get_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(),
        body: GetBuilder<GetData>(
          init: GetData(),
          builder: (logic) {
            return logic.apiCallStatus == ApiCallStatus.loading
                ? const Center(child: CupertinoActivityIndicator())
                : PaginationScrollScreen(
                    showWidget: ListView.separated(
                      controller: scrollController,
                      itemCount: logic.posts.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.2)),
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              logic.posts[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              logic.posts[index].body,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                    ),
                    scrollController: scrollController,
                    loadingFunction: () => logic.loadMoreData(),
                    scrollDirection: Axis.vertical,
                  );
          },
        ),
      ),
    );
  }
}
