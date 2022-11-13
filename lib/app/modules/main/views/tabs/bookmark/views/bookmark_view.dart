import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(BookmarkController());
    controller.getDataBookmarkProduct();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.bookmarks.length,
          itemBuilder: (context, index) {
            return Text(controller.bookmarks.value[index].nama);
          },
        );
      }),
    );
  }
}
