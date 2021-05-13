import 'package:flutter/material.dart';
import '../Models/MenuItem.dart';

// 网格view

class LLGridView extends StatefulWidget {
  @override
  _LLGridViewState createState() => _LLGridViewState();
}

class _LLGridViewState extends State<LLGridView> {

  List<MenuItem> items = [
    MenuItem(title: "拼多多", imageUrl: "https://coupon.lvesli.com/pdd.png"),
    MenuItem(title: "母婴精选", imageUrl: "https://img.alicdn.com/imgextra/i1/2053469401/TB2G1wjoBnTBKNjSZPfXXbf1XXa-2053469401.png"),
    MenuItem(title: "20元封顶", imageUrl: "https://img.alicdn.com/imgextra/i2/2053469401/TB2Z1Qso7UmBKNjSZFOXXab2XXa-2053469401.png"),
    MenuItem(title: "饿了么红包", imageUrl: "https://coupon.lvesli.com/eleme.png")
  ];
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
              title: items[index].title,
              imageUrl: items[index].imageUrl
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