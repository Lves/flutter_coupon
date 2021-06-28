import 'package:coupon_flutter/Models/Goods.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../Commons/Tools.dart';

class GoodsDetailPage extends StatefulWidget {
  final Goods goods;
  GoodsDetailPage({this.goods});

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState(goods: goods);
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  final Goods goods;
  double contentHeight = 800.0;
  _GoodsDetailPageState({this.goods});


  @override
  Widget build(BuildContext context) {
    final couponAmount =
        (goods.coupon_amount as int) ?? double.parse(goods.coupon_amount);
    final price = double.parse(goods.zk_final_price) - couponAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
              height: 300,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Image.network(
                      goods.small_images.string[index].appendHttps(),
                      fit: BoxFit.fill);
                },
                pagination: new SwiperPagination(),
                itemCount: goods.small_images.string != null
                    ? goods.small_images.string.length
                    : 0,
              )),
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
                      Text("原价 ${goods.zk_final_price}"),
                      Text("月售 ${goods.volume}")
                    ]),
              )),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.deepOrange, fontSize: 15),
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
              )),
          Container(
            // margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Text(
              goods.title,
              maxLines: 3,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          _webview()
        ]),
      ),
    );
  }

  Widget _webview(){
    String url = "https://mdetail.tmall.com/templates/pages/desc?id=${goods.goods_id}";
    print("DetailUrl:$url");
    return SizedBox(
      height: contentHeight,
     child: WebView(
       // onPageFinished: (url) {
       //
       // },
       javascriptMode: JavascriptMode.unrestricted,
       navigationDelegate: (request) {
         //TODO: 对比ios的请求
         print("Requst:${request.url}");
         return NavigationDecision.navigate;
       },
       // javascriptChannels: Set.from([
       //   JavascriptChannel(
       //     name: 'extents',
       //     onMessageReceived: (JavascriptMessage message) {
       //       print('[webView/javascriptChannels] ${message.message}');
       //       setState(() {
       //         contentHeight = double.parse(message.message);
       //       });
       //     },
       //   )
       // ]),
       initialUrl: url,
     ),
    );
  }

}
