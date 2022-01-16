import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_bar_common.dart';
import 'common_scaffold.dart';
import 'load_image.dart';


class HomeScreen extends StatelessWidget {

   HomeScreen({Key key}) : super(key: key);
  var imageList=[];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      backgroundColor: Colors.black,
      appBar: AppBarCommon(
        titleString: "Netflix",backgroundColor: Colors.black,

      ),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration:
                const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                viewportFraction: 1,
                pageSnapping: true,
                height: Get.size.width > 450 ? 400 : 280,
                enlargeCenterPage: true),
            items: imageList
                .map(
                  (item) => Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 0),
                width: Get.width,
                child: LoadImage(image: item.imageUrl ?? ""),
              ),
            )
                .toList() ??
                [],
          ),
          Text('Upcoming movies'),

          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding: EdgeInsets.only(left: 20),
              itemBuilder: (context, index) {
                return Container(
                  child:Column(
                    children: [
                      LoadImage(image: imageList[index].imageUrl ?? ""),
                      Text('movie name')
                    ],
                  )
                );

              },

          ),
          Text('Popular'),

          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: EdgeInsets.only(left: 20),
            itemBuilder: (context, index) {
              return Container(
                  child:Column(
                    children: [
                      LoadImage(image: imageList[index].imageUrl ?? ""),
                      Text('movie name')
                    ],
                  )
              );

            },

          ),
          Text('Top Rated'),

          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: EdgeInsets.only(left: 20),
            itemBuilder: (context, index) {
              return Container(
                  child:Column(
                    children: [
                      LoadImage(image: imageList[index].imageUrl ?? ""),
                      Text('movie name')
                    ],
                  )
              );

            },

          )
        ],
      ));

  }

}
