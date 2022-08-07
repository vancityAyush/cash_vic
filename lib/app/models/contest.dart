import 'package:json_annotation/json_annotation.dart';

import '../constants/values.dart';

part 'contest.g.dart';

@JsonSerializable()
class Contest {
  String offerid;
  String name;
  String logo;
  String status;
  String category;
  String currency;
  num price;
  String model;
  String date_start;
  String date_end;
  String preview_url;
  String offer_terms;
  String offer_kpi;
  String country_allow;
  String country_block;
  String city_allow;
  String city_block;
  String os_allow;
  String os_block;
  String device_allow;
  String device_block;
  String isp_allow;
  String isp_block;
  String capping;
  String browser_allow;
  String browser_block;
  String impression_url;
  String click_url;
  String authorized;
  List<EventsBean>? events;
  String creatives;
  String capping_budget_period;
  String capping_budget;
  String capping_conversion_period;
  String capping_conversion;

  String get image {
    switch (contestCategory) {
      case ContestCategory.arcade:
        return HomeImages.arcade;
      case ContestCategory.puzzle:
        return HomeImages.puzzle;
      case ContestCategory.brain:
        return HomeImages.brainGames;
      case ContestCategory.casino:
        return HomeImages.casino;
      case ContestCategory.fantasy:
        return HomeImages.fantasy;
      case ContestCategory.electronics:
        return HomeImages.electronics;
      case ContestCategory.educational:
        return HomeImages.educational;
      case ContestCategory.bogo:
        return HomeImages.bogo;
      case ContestCategory.health:
        return HomeImages.health;
      case ContestCategory.beauty:
        return HomeImages.beauty;
      case ContestCategory.footwear:
        return HomeImages.footwear;
      case ContestCategory.jewellery:
        return HomeImages.jewellery;
      case ContestCategory.clothing:
        return HomeImages.clothing;
      default:
        return HomeImages.games;
    }
  }

  ContestCategory get contestCategory {
    switch (category) {
      case 'Gaming_Arcade':
        return ContestCategory.arcade;
      case 'Gaming_Puzzle':
        return ContestCategory.puzzle;
      case 'Gaming_Brain':
        return ContestCategory.brain;
      case 'Gaming_Educational':
        return ContestCategory.educational;
      case 'Brain_Frantic':
        return ContestCategory.brain;
      case 'Gaming_Casino':
        return ContestCategory.casino;
      case 'Gaming_Fantasy':
        return ContestCategory.fantasy;
      case 'Electronics':
        return ContestCategory.electronics;
      case 'Beauty':
        return ContestCategory.beauty;
      case 'Health ':
        return ContestCategory.health;
      case 'Footwear':
        return ContestCategory.footwear;
      case 'Clothing':
        return ContestCategory.clothing;
      case 'Jewellery':
        return ContestCategory.jewellery;
      case 'Buy 1 Get 1':
        return ContestCategory.bogo;
      default:
        return ContestCategory.other;
    }
    ;
  }

  Contest(
      {required this.offerid,
      required this.name,
      required this.logo,
      required this.status,
      required this.category,
      required this.currency,
      required this.price,
      required this.model,
      required this.date_start,
      required this.date_end,
      required this.preview_url,
      required this.offer_terms,
      required this.offer_kpi,
      required this.country_allow,
      required this.country_block,
      required this.city_allow,
      required this.city_block,
      required this.os_allow,
      required this.os_block,
      required this.device_allow,
      required this.device_block,
      required this.isp_allow,
      required this.isp_block,
      required this.capping,
      required this.browser_allow,
      required this.browser_block,
      required this.impression_url,
      required this.click_url,
      required this.authorized,
      this.events,
      required this.creatives,
      required this.capping_budget_period,
      required this.capping_budget,
      required this.capping_conversion_period,
      required this.capping_conversion});

  factory Contest.fromJson(Map<String, dynamic> json) =>
      _$ContestFromJson(json);

  Map<String, dynamic> toJson() => _$ContestToJson(this);
}

@JsonSerializable()
class EventsBean {
  String price;
  String model;
  String event_name;
  String event_token;

  EventsBean(
      {required this.price,
      required this.model,
      required this.event_name,
      required this.event_token});

  factory EventsBean.fromJson(Map<String, dynamic> json) =>
      _$EventsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$EventsBeanToJson(this);
}
