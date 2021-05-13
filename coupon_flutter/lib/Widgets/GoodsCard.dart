import 'package:flutter/material.dart';
import '../Models/Goods.dart';
class GoodsCard extends StatelessWidget {
  GoodsCard(this.goods);

  final Goods goods;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(goods.icon),
        Text(goods.title),
        Row(children: [
          Text("原价 ${goods.origanlPirce}"),
          Text("月售 ${goods.saledNumber}")
        ]),
        Text("券后 ￥${goods.price}")
      ],
    );
  }
}