import 'package:coupon_flutter/Models/TBKBanner.dart';
import 'package:dio/dio.dart';
import 'Result.dart';

class NetworkManger {
  static NetworkManger shared = NetworkManger._();
  NetworkManger._(){}

  Dio get dio {
    final dio = Dio();
    dio.options = BaseOptions(baseUrl: "https://lvesli.com");
    return dio;
  }

  // 获取首页 banners
  Future<Result<TBKBannerModels>> getBanners() async {
    var response  = await dio.get("/homebanner");
    if (response.data["errno"] == 0) {
      TBKBannerModels model = TBKBannerModels.fromJson(response.data["rst"]);
      // List<TBKBanner> bannerItems = List<TBKBanner>.from(bannerJson.map((e) => TBKBanner.fromJson(e)));
      return Result(data: model, status: true, message: "请求成功");
    } else {
      return Result(data: null, status: false, message: "失败");
    }
  }

  Future getGoods() async {
    var response  = await dio.post("/homebanner", queryParameters: {"favoritesId":"2011944265","pageSize":10,"pageNo": 0});


  }



}