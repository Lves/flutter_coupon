import 'package:flutter/material.dart';
import '../Models/TBKBanner.dart';

// 网格view

class LLGridView extends StatelessWidget {
  final List<TBKBanner> items;

  LLGridView({this.items});

  // List<TBKBanner> items = [
  //   TBKBanner(name: "拼多多", iconUrl: "https://coupon.lvesli.com/pdd.png"),
  //   TBKBanner(name: "母婴精选", iconUrl: "https://img.alicdn.com/imgextra/i1/2053469401/TB2G1wjoBnTBKNjSZPfXXbf1XXa-2053469401.png"),
  //   TBKBanner(name: "20元封顶", iconUrl: "https://img.alicdn.com/imgextra/i2/2053469401/TB2Z1Qso7UmBKNjSZFOXXab2XXa-2053469401.png"),
  //   TBKBanner(name: "饿了么红包", iconUrl: "https://coupon.lvesli.com/eleme.png")
  // ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GridViewCell(
              title: items[index].name,
              imageUrl: items[index].iconUrl
          );
        });
  }
}

class GridViewCell extends StatelessWidget {
  GridViewCell({this.title,this.imageUrl});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        new Expanded(
            child: Image.network(imageUrl)
        ),
        new Text(title)
      ],
    );
  }
}