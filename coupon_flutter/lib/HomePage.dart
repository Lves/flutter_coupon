import 'package:coupon_flutter/Models/TBKBanner.dart';
import 'package:flutter/material.dart';
import 'Widgets/LLGridView.dart';
import 'Widgets/GoodsGridView.dart';
import 'Network/NetworkManager.dart';
import 'Network/Result.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: NetworkManger.shared.getBanners(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Result<TBKBannerModels> result = snapshot.data;
            if (result.status == true) {

              return Column(
                children: [
                  LLGridView(items: result.data.functions),
                  GoodsGridView()
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