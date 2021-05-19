import 'package:coupon_flutter/Models/HomeModel.dart';
import 'package:coupon_flutter/Models/TBKBanner.dart';
import 'package:flutter/material.dart';
import 'Widgets/LLGridView.dart';
import 'Widgets/GoodsGridView.dart';
import 'Network/NetworkManager.dart';
import 'Network/Result.dart';
import 'Models/Goods.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NetworkManger.shared.searchGoods();

    return SingleChildScrollView(
      child: FutureBuilder(
        future: NetworkManger.shared.getHomeDatas(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            HomeModel model = snapshot.data;

            if (model != null) {
              return Column(
                children: [
                  LLGridView(items: model.bannerModels.functions ?? []),
                  GoodsGridView(list: model.goods ?? [])
                ],
              );
            } else {
              return Text("Error");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      )
    );
  }
}