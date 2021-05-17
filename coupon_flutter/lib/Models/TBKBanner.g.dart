// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TBKBanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TBKBanner _$TBKBannerFromJson(Map<String, dynamic> json) {
  return TBKBanner(
    name: json['name'] as String,
    iconUrl: json['iconUrl'] as String,
    address: json['address'] as String,
    favoritesId: json['favoritesId'] as String,
    type: json['type'] as String,
    hasShake: json['hasShake'] as bool,
  );
}

Map<String, dynamic> _$TBKBannerToJson(TBKBanner instance) => <String, dynamic>{
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'address': instance.address,
      'favoritesId': instance.favoritesId,
      'type': instance.type,
      'hasShake': instance.hasShake,
    };

TBKBannerModels _$TBKBannerModelsFromJson(Map<String, dynamic> json) {
  return TBKBannerModels(
    banners: (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : TBKBanner.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    functions: (json['functions'] as List)
        ?.map((e) =>
            e == null ? null : TBKBanner.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TBKBannerModelsToJson(TBKBannerModels instance) =>
    <String, dynamic>{
      'banners': instance.banners,
      'functions': instance.functions,
    };
