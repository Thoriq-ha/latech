import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final BookmarkController c = Get.put(BookmarkController());

    Get.put(BookmarkController());
    controller.getDataBookmarkProduct();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
        backgroundColor: primary,
        foregroundColor: primaryAccent,
        elevation: 0,
      ),
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListView.builder(
            itemCount: controller.bookmarks.length,
            itemBuilder: (context, index) {
              if ((controller.bookmarks.value[index].is_bookmark == 'true')) {
                return cardView(context, index, c);
              } else {
                return Container();
              }
            },
          ),
        );
      }),
    );
  }

  Widget cardView(BuildContext context, int index, BookmarkController c) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageView(context, index),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: getDeviceWidth(context) * 0.377,
                      height: getDeviceHeight(context) * 0.1,
                      // color: Colors.amber,
                      child: Text(
                        controller.bookmarks.value[index].nama,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textMediumDefault,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (c.bookmarks[index].is_bookmark.toLowerCase() ==
                              'true') {
                            c.bookmarks[index].is_bookmark = 'false';
                            c.products[index].is_bookmark = 'false';
                          } else {
                            c.bookmarks[index].is_bookmark = 'true';
                            c.products[index].is_bookmark = 'true';
                          }

                          c.bookmarks.refresh();
                          c.updateSaveDataBookmarkProduct();

                        },
                        icon: Icon(
                          Icons.bookmark,
                          color: primary,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageView(BuildContext context, int index) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
          width: getDeviceWidth(context) * 0.4,
          padding: EdgeInsets.all(8),
          child: Image.network(
            controller.bookmarks.value[index].gambar,
            errorBuilder: (context, error, stackTrace) => Image.asset(foodIcon),
          )),
    );
  }
}
