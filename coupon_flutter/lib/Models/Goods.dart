import 'package:json_annotation/json_annotation.dart';

part 'Goods.g.dart';

@JsonSerializable()
class Goods {
  final String title;
  final String pict_url; //商品主图
  final String nick; //卖家昵称
  final String item_url; //商品地址
  final String reserve_price; //商品一口价格
  final String zk_final_price; //商品折扣价格
  final String coupon_start_fee; //满减价格
  final dynamic coupon_amount; //优惠券价格
  final int num_iid; //商品ID
  final int item_id; //商品ID, num_id为空的时候用
  final int seller_id; //卖家id
  final String provcity; //宝贝所在地
  final SmallImages small_images; //商品小图列表
  final int user_type; //卖家类型，0表示集市，1表示商城
  final int volume; //30天销量
  final String coupon_start_time; //优惠券开始时间
  final String coupon_end_time; //优惠券结束时间
  final String info_dxjh; //定向计划信息
  final String tk_total_sales; //淘客30天月推广量
  final String tk_total_commi; //月支出佣金
  final String coupon_id; //优惠券id
  final String include_mkt; //是否包含营销计划
  final String include_dxjh; //是否包含定向计划
  final String commission_rate; //佣金比率  1550表示15.5%
  final int coupon_total_count; //优惠券总量
  final int level_one_category_id; //一级类目ID
  final int coupon_remain_count; //优惠券剩余量
  final double shop_dsr; //店铺dsr评分
  final String coupon_info; //优惠券面额
  final String commission_type; //佣金类型 MKT表示营销计划，SP表示定向计划，COMMON表示通用计划",
  final String shop_title; //商品短标题
  final String coupon_share_url; //券二合一页面链接
  final String url; //商品淘客链接
  final String level_one_category_name; //一级类目名称
  final String category_name; //叶子类目名称
  final int category_id; //叶子类目id
  final String short_title; //商品短标题
  final String white_image; //商品白底图
  final String coupon_click_url; //商品优惠券链接
  final String zk_final_price_wap; //无线折扣价，即宝贝在无线上的实际售卖价格。
  final String tk_rate; //收入比例，举例，取值为20.00，表示比例20.00%,
  final int status; //宝贝状态，0失效，1有效；注：失效可能是宝贝已经下线或者是被处罚不能在进行推广
  final int type; //宝贝类型：1 普通商品； 2 鹊桥高佣金商品；3 定向招商商品；4 营销计划商品;
  final double couponPrice;

  int get goods_id {
    return num_iid ?? item_id;
  }

  Goods(
      {this.title,
      this.pict_url,
      this.nick,
      this.item_url,
      this.reserve_price,
      this.zk_final_price,
      this.coupon_start_fee,
      this.coupon_amount,
      this.num_iid,
      this.item_id,
      this.seller_id,
      this.provcity,
      this.small_images,
      this.user_type,
      this.volume,
      this.coupon_start_time,
      this.coupon_end_time,
      this.info_dxjh,
      this.tk_total_sales,
      this.tk_total_commi,
      this.coupon_id,
      this.include_mkt,
      this.include_dxjh,
      this.commission_rate,
      this.coupon_total_count,
      this.level_one_category_id,
      this.coupon_remain_count,
      this.shop_dsr,
      this.coupon_info,
      this.commission_type,
      this.shop_title,
      this.coupon_share_url,
      this.url,
      this.level_one_category_name,
      this.category_name,
      this.category_id,
      this.short_title,
      this.white_image,
      this.coupon_click_url,
      this.zk_final_price_wap,
      this.tk_rate,
      this.status,
      this.type,
      this.couponPrice});
  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);
  Map<String, dynamic> toJson() => _$GoodsToJson(this);
}

@JsonSerializable()
class SmallImages {
  final List<String> string;
  SmallImages({this.string});

  factory SmallImages.fromJson(Map<String, dynamic> json) =>
      _$SmallImagesFromJson(json);
  Map<String, dynamic> toJson() => _$SmallImagesToJson(this);
}
