import 'package:flutter/material.dart';
import '../Models/Goods.dart';
import '../Commons/Tools.dart';

class GoodsCard extends StatelessWidget {
  GoodsCard(this.goods);

  final Goods goods;
  @override
  Widget build(BuildContext context) {
    final price = double.parse(goods.zk_final_price) - double.parse(goods.coupon_start_fee ?? "0");
    return Column(
      children: [
        Image.network(goods.pict_url.appendHttps()),
        Text(goods.title),
        Row(children: [
          Text("原价 ${goods.zk_final_price}"),
          Text("月售 ${goods.volume}")
        ]),
        //TODO：这里需要改
        Text("券后 ￥${price}")
      ],
    );
  }
}