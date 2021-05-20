import 'package:coupon_flutter/Models/HomeModel.dart';
import 'package:flutter/material.dart';
import 'Widgets/LLGridView.dart';
import 'Widgets/GoodsGridView.dart';
import 'Network/NetworkManager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      // 滑到了底部，加载更多
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print("加载更多");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: FutureBuilder(
        future: NetworkManger.shared.getHomeDatas(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            HomeModel model = snapshot.data;

            if (model != null) {
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: LLGridView(items: model.bannerModels.functions ?? []),
                  ),
                  GoodsGridView(list: model.goods ?? [])
                ],
              );
            } else {
              return Center(child: Text("Error"));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}