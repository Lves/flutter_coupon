// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goods _$GoodsFromJson(Map<String, dynamic> json) {
  return Goods(
    title: json['title'] as String,
    pict_url: json['pict_url'] as String,
    nick: json['nick'] as String,
    item_url: json['item_url'] as String,
    reserve_price: json['reserve_price'] as String,
    zk_final_price: json['zk_final_price'] as String,
    coupon_start_fee: json['coupon_start_fee'] as String,
    coupon_amount: json['coupon_amount'],
    num_iid: json['num_iid'] as int,
    item_id: json['item_id'] as int,
    seller_id: json['seller_id'] as int,
    provcity: json['provcity'] as String,
    small_images: json['small_images'] == null
        ? null
        : SmallImages.fromJson(json['small_images'] as Map<String, dynamic>),
    user_type: json['user_type'] as int,
    volume: json['volume'] as int,
    coupon_start_time: json['coupon_start_time'] as String,
    coupon_end_time: json['coupon_end_time'] as String,
    info_dxjh: json['info_dxjh'] as String,
    tk_total_sales: json['tk_total_sales'] as String,
    tk_total_commi: json['tk_total_commi'] as String,
    coupon_id: json['coupon_id'] as String,
    include_mkt: json['include_mkt'] as String,
    include_dxjh: json['include_dxjh'] as String,
    commission_rate: json['commission_rate'] as String,
    coupon_total_count: json['coupon_total_count'] as int,
    level_one_category_id: json['level_one_category_id'] as int,
    coupon_remain_count: json['coupon_remain_count'] as int,
    shop_dsr: (json['shop_dsr'] as num)?.toDouble(),
    coupon_info: json['coupon_info'] as String,
    commission_type: json['commission_type'] as String,
    shop_title: json['shop_title'] as String,
    coupon_share_url: json['coupon_share_url'] as String,
    url: json['url'] as String,
    level_one_category_name: json['level_one_category_name'] as String,
    category_name: json['category_name'] as String,
    category_id: json['category_id'] as int,
    short_title: json['short_title'] as String,
    white_image: json['white_image'] as String,
    coupon_click_url: json['coupon_click_url'] as String,
    zk_final_price_wap: json['zk_final_price_wap'] as String,
    tk_rate: json['tk_rate'] as String,
    status: json['status'] as int,
    type: json['type'] as int,
    couponPrice: (json['couponPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'title': instance.title,
      'pict_url': instance.pict_url,
      'nick': instance.nick,
      'item_url': instance.item_url,
      'reserve_price': instance.reserve_price,
      'zk_final_price': instance.zk_final_price,
      'coupon_start_fee': instance.coupon_start_fee,
      'coupon_amount': instance.coupon_amount,
      'num_iid': instance.num_iid,
      'item_id': instance.item_id,
      'seller_id': instance.seller_id,
      'provcity': instance.provcity,
      'small_images': instance.small_images,
      'user_type': instance.user_type,
      'volume': instance.volume,
      'coupon_start_time': instance.coupon_start_time,
      'coupon_end_time': instance.coupon_end_time,
      'info_dxjh': instance.info_dxjh,
      'tk_total_sales': instance.tk_total_sales,
      'tk_total_commi': instance.tk_total_commi,
      'coupon_id': instance.coupon_id,
      'include_mkt': instance.include_mkt,
      'include_dxjh': instance.include_dxjh,
      'commission_rate': instance.commission_rate,
      'coupon_total_count': instance.coupon_total_count,
      'level_one_category_id': instance.level_one_category_id,
      'coupon_remain_count': instance.coupon_remain_count,
      'shop_dsr': instance.shop_dsr,
      'coupon_info': instance.coupon_info,
      'commission_type': instance.commission_type,
      'shop_title': instance.shop_title,
      'coupon_share_url': instance.coupon_share_url,
      'url': instance.url,
      'level_one_category_name': instance.level_one_category_name,
      'category_name': instance.category_name,
      'category_id': instance.category_id,
      'short_title': instance.short_title,
      'white_image': instance.white_image,
      'coupon_click_url': instance.coupon_click_url,
      'zk_final_price_wap': instance.zk_final_price_wap,
      'tk_rate': instance.tk_rate,
      'status': instance.status,
      'type': instance.type,
      'couponPrice': instance.couponPrice,
    };

SmallImages _$SmallImagesFromJson(Map<String, dynamic> json) {
  return SmallImages(
    string: (json['string'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SmallImagesToJson(SmallImages instance) =>
    <String, dynamic>{
      'string': instance.string,
    };
