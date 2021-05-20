import 'package:flutter/material.dart';
import '../Models/Goods.dart';
import 'GoodsCard.dart';

class GoodsGridView extends StatelessWidget {
  final List<Goods> list;
  GoodsGridView({this.list});

  @override
  Widget build(BuildContext context) {
     return GridView.builder(
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
          childAspectRatio: 0.65,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return GoodsCard(list[index]);
        });
  }
}