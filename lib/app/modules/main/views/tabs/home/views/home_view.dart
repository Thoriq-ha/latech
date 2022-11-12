// import 'dart:html';

import 'dart:ui';

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

      Widget textSliver = SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 28
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Halal Food", style: textCustom(semiBoldFont, 20)),
              Text("Foods with no pork or alcohol", style: textMediumDefault,),
            ],
          ),
        ),
      );

      Widget body = SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.8,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              // return Container(
              //   color: primary,
              //   child: Text(products[index].nama),
              // );
              return SizedBox(
                height: 500,
                width: 500,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 3.0,
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  child: Stack(
                    children: [

                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: 500,
                          child: Image.network(products[index].gambar,
                            errorBuilder: (context, error, stackTrace) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.warning_outlined, color: Color(0x8F656565), size: 64,),
                                Text(textImageError, textAlign: TextAlign.center, style: textRegularDefault,),
                              ]
                            ),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0, 0),
                                end: Alignment(0, 2),
                                colors: [
                                  Color(0xFFFFFF),
                                  Colors.black,
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              );
            },
            childCount: products.length,
          ),
        ),
      );
      List<Widget> sliver = [];
      sliver.add(apbbar);
      sliver.add(textSliver);
      sliver.add(body);

      return sliver;
    }

    return Scaffold(
        backgroundColor: primaryAccentVariant,
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
      preferredSize: const Size.fromHeight(32.0),
      child: Transform.translate(
          offset: const Offset(0, 24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              style: textRegularDefault,
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
