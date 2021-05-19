import 'package:coupon_flutter/Models/Goods.dart';
import 'package:coupon_flutter/Models/TBKBanner.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'Result.dart';
import '../Models/HomeModel.dart';
import 'package:dio/adapter.dart';

class NetworkManger {
  static NetworkManger shared = NetworkManger._();
  NetworkManger._(){}

  Dio get dio {
    final dio = Dio();
    dio.options = BaseOptions(baseUrl: "https://lvesli.com");

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (Uri) {
        // 用1个开关设置是否开启代理
        return 'PROXY 192.168.220.97:8888';
      };
    };
    return dio;
  }

  // 获取首页 banners
  Future<Result<TBKBannerModels>> getBanners() async {
    var response  = await dio.get("/homebanner");
    if (response.data["errno"] == 0) {
      TBKBannerModels model = TBKBannerModels.fromJson(response.data["rst"]);

      return Result(data: model, status: true, message: "OK");
    } else {
      return Result(data: null, status: false, message: "失败");
    }
  }
  // 首页商品列表
  Future<Result<List<Goods>>> getGoods() async {
    final form = FormData.fromMap({"favoritesId":"2011944265","pageSize":10,"pageNo": 1});
    var response = await dio.post("/tbk_favorite_item", data: form);

    if (response.data["tbk_dg_optimus_material_response"] != null) {

      final datas = response.data["tbk_dg_optimus_material_response"];
      final list = datas["result_list"]["map_data"];

      List<Goods> goods = List<Goods>.from(list.map((e) => Goods.fromJson(e)));
      return Result(data: goods, status: true, message: "OK");
    } else {
      return Result(data: null, status: false, message: "失败");
    }
  }
  // 首页数据
  Future<HomeModel> getHomeDatas() async {
    TBKBannerModels bannerModels;
    List<Goods> goods;
    var array = await Future.wait([
      getBanners().then((value) => bannerModels = value.data),
      getGoods().then((value) => goods = value.data)]);

    if (bannerModels == null && goods == null) {
      return Future.error(Error());
    }

    return Future.value(HomeModel(bannerModels: bannerModels, goods: goods));
  }

  // 搜索和分类
  Future<Result<List<Goods>>> searchGoods() async {
    final form = FormData.fromMap({"hasCoupon":false,"keyword":"001","pageNo": 1});
    var response = await dio.post("/tbk_dg_material", data: form);

    if (response.data["tbk_dg_material_optional_response"] != null) {

      final datas = response.data["tbk_dg_material_optional_response"];
      final list = datas["result_list"]["map_data"];
      List<Goods> goods = List<Goods>.from(list.map((e) => Goods.fromJson(e)));
      return Result(data: goods, status: true, message: "OK");
    } else {
      return Result(data: null, status: false, message: "失败");
    }
  }

}