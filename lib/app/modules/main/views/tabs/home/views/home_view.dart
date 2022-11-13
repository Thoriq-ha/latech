import 'package:akar_icons_flutter/akar_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:halalin/app/constant/theme.dart';
import 'package:halalin/app/constant/values.dart';
import 'package:halalin/app/data/models/product.dart';
import 'package:halalin/app/routes/app_pages.dart';
import 'package:iconsax/iconsax.dart';

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
          actions: [
            InkWell(
                child: IconButton(
                    onPressed: (){
                      Get.toNamed(Routes.ABOUT);
                    }, icon: const Icon(Iconsax.info_circle)))
          ],
          flexibleSpace: appBarBackground(),
          bottom: appBarBottom(context),
          expandedHeight: getDeviceHeight(context) * 0.3);

      Widget textSliver = SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Halal Food",
                  style: textCustom(semiBoldFont, 20, Colors.black)),
              Text(
                "Foods with no pork or alcohol",
                style: textMediumDefault,
              ),
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
            childAspectRatio: 0.7,
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
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark_border,
                                size: 24,
                              )),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Expanded(
                                child: Text(
                              products[index].nama,
                              maxLines: 1,
                              style: textMediumDefault,
                            )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            height: 500,
                            child: Image.network(
                              products[index].gambar,
                              errorBuilder: (context, error, stackTrace) =>
                                  Center(
                                    child: Image.asset(foodIcon, fit: BoxFit.fitWidth,),
                                  )
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment(0, 0),
                              end: Alignment(0, 2),
                              colors: [
                                Color(0x00ffffff),
                                Colors.black,
                              ],
                            )),
                          ),
                        ),
                      ],
                    )),
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
    return const ContinuousRectangleBorder(
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

  PreferredSize appBarBottom(context) {
    double height  = getDeviceHeight(context) * 0.02;
    return PreferredSize(
    preferredSize: Size.fromHeight(height),
      child: Transform.translate(
          offset: const Offset(0, 24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (value) {
                controller.searchProduct(query: value);
              },
              cursorColor: primary,
              style: textRegularDefault,
              maxLines: 1,
              maxLength: 40,
              decoration: InputDecoration(
                prefixIcon: Icon(AkarIcons.search, color: primary,),
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
