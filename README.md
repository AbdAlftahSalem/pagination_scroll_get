# pagination_scroll_get

A Flutter widget for infinite-scroll pagination: calls your load-more function when a list reaches its end, vertical or horizontal, with loading and error states (GetX).

<img src="assets/new.gif" width="200" height="400" alt="pagination_scroll_get demo">
<img src="assets/new2.gif" width="200" height="400" alt="pagination_scroll_get demo">

## usage:

add to your pubspec

```
pagination_scroll_get: ^0.0.1
```

and import:

```
import 'package:pagination_scroll_get/pagination_scroll.dart';
```

```dart
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
                ? const Center(child: CupertinoActivityIndicator()
            )
                : PaginationScrollScreen(
              showWidget: ListView.separated(
                controller: scrollController,
                itemCount: logic.posts.length,
                scrollDirection: Axis.horizontal,
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
              scrollDirection: Axis.horizontal,
            );
          },
        ),
      ),
    );
  }
}

```

