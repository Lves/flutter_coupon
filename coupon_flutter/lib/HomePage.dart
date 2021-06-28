import 'package:coupon_flutter/Pages/WebViewPage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'Widgets/LLGridView.dart';
import 'Widgets/GoodsGridView.dart';
import 'Network/NetworkManager.dart';
import 'Models/Goods.dart';
import 'Models/TBKBanner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EasyRefreshController _controller = EasyRefreshController();
  List<Goods> goods;
  List<TBKBanner> functions;
  List<TBKBanner> banners;

  @override
  void initState() {
    _onRefresh();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        controller: _controller,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(child: _buildList()));
  }

  Widget _buildList() {
    return Column(
      children: [
        SizedBox(
            height: 200,
            child: Swiper(
              itemBuilder: (context, index) {
                return Image.network(banners[index].iconUrl, fit: BoxFit.fill);
              },
              onTap: _bannerTapped,
              pagination: new SwiperPagination(),
              itemCount: banners != null ? banners.length : 0,
            )),
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: LLGridView(items: functions ?? []),
        ),
        GoodsGridView(list: goods ?? [])
      ],
    );
  }

  Future<Null> _onRefresh() async {
    if (goods != null && goods.length > 0) {
      goods.clear();
    }
    _getMoreData();
  }

  void _getMoreData() async {
    await NetworkManger.shared.getHomeDatas().then(
      (homeModels) {
        this.setState(() {
          this.functions = homeModels.bannerModels.functions;
          this.goods = homeModels.goods;
          this.banners = homeModels.bannerModels.banners;
        });
      },
    ).catchError((e) {
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: "加载失败");
    });
  }

  // 点击banner
  void _bannerTapped(int index) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return WebViewPage(title: "Demo", url: banners[index].address ?? "");
    }));
  }
}
