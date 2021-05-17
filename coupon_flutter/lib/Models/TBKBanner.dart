// Models
import 'package:json_annotation/json_annotation.dart';

part 'TBKBanner.g.dart';

@JsonSerializable()
class TBKBanner {
  TBKBanner({this.name, this.iconUrl, this.address, this.favoritesId, this.type, this.hasShake});
  final String name;
  final String iconUrl;
  final String address;
  final String favoritesId;
  final String type;
  final bool hasShake;

  factory TBKBanner.fromJson(Map<String, dynamic> json) => _$TBKBannerFromJson(json);
  Map<String, dynamic> toJson() => _$TBKBannerToJson(this);
}

@JsonSerializable()
class TBKBannerModels {
  final List<TBKBanner> banners;
  final List<TBKBanner> functions;
  TBKBannerModels({this.banners, this.functions});

  factory TBKBannerModels.fromJson(Map<String, dynamic> json) => _$TBKBannerModelsFromJson(json);
  Map<String, dynamic> toJson() => _$TBKBannerModelsToJson(this);
}