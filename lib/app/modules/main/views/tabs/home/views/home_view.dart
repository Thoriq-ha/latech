// import 'dart:html';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    List<Widget> sliverList(RxList<Product> products) {
      Widget apbbar = SliverAppBar(
          backgroundColor: primary,
          pinned: true,
          floating: false,
          snap: false,
          shape: appBarShape(),
          flexibleSpace: appBarBackground(),
          bottom: appBarBottom(),
          expandedHeight: getDeviceHeight(context) * 0.26);

      Widget body = SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: primary,
                child: Text(products[index].nama),
              );
            },
            childCount: products.length,
          ),
        ),
      );
      List<Widget> sliver = [];
      sliver.add(apbbar);
      sliver.add(body);

      return sliver;
    }

    return Scaffold(
        backgroundColor: primaryAccent,
        body: Obx(() {
          return CustomScrollView(slivers: sliverList(controller.products));
        }));
  }

  ShapeBorder appBarShape() {
    return ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)));
  }

  Widget appBarBackground() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: Image.asset(
          headline,
          scale: 3.8,
        )),
        // Align(alignment: Alignment.center, child: Image.asset(headline, scale: 4,),),
        Align(
          alignment: Alignment.bottomLeft,
          child: Image.asset(
            ornamentAppbarLeft,
            scale: 1.2,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(ornamentAppbarRight),
        ),
      ],
    );
  }

  PreferredSize appBarBottom() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(3.0),
      child: Transform.translate(
          offset: const Offset(0, 24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              maxLines: 1,
              maxLength: 40,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: primaryAccent,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none),
                hintText: searchHintText,
                counterText: "",
              ),
            ),
          )),
    );
  }
}
