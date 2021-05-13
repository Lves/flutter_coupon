import 'package:flutter/material.dart';
import '../Models/Goods.dart';
import 'GoodsCard.dart';

class GoodsGridView extends StatelessWidget {
  final List<Goods> list = [
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),
    Goods("手机便宜了，你买不买", "https://img.alicdn.com/i2/1705248555/O1CN01XnWne72D4EzvKrUF3_!!0-item_pic.jpg", 40, 30, 100002),

  ];

  @override
  Widget build(BuildContext context) {
     return GridView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GoodsCard(list[index]);
        });
  }
}