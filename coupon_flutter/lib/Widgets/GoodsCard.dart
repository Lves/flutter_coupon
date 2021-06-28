import 'package:flutter/material.dart';
import '../Models/Goods.dart';
import '../Commons/Tools.dart';

class GoodsCard extends StatelessWidget {
  GoodsCard(this.goods);

  final Goods goods;
  @override
  Widget build(BuildContext context) {
    final couponAmount =
        (goods.coupon_amount as int) ?? double.parse(goods.coupon_amount);
    if (goods.zk_final_price == null) {
      print("goods.reserve_price:${goods.reserve_price}");
    }
    final oPrice = goods.zk_final_price != null ? double.parse(goods.zk_final_price) : 0;
    final price =  oPrice - couponAmount;
    return Column(
      children: [
        Image.network(goods.pict_url.appendHttps()),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          child: Text(
            goods.title ?? "",
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("原价 ${goods.zk_final_price ?? 0}"),
                    Text("月售 ${goods.volume ?? 0}")
                  ]),
            )),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.deepOrange, fontSize: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("券后 ￥${price.toStringAsFixed(1)}"),
                  Visibility(
                      visible: couponAmount != 0,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            border: new Border.all(
                                width: 1, color: Colors.deepOrange)),
                        child: Text("${couponAmount} 元券"),
                      ))
                ],
              ),
            ))
      ],
    );
  }
}
