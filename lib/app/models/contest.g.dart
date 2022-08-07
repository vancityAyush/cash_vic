// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contest _$ContestFromJson(Map<String, dynamic> json) => Contest(
      offerid: json['offerid'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      status: json['status'] as String,
      category: json['category'] as String,
      currency: json['currency'] as String,
      price: json['price'] as num,
      model: json['model'] as String,
      date_start: json['date_start'] as String,
      date_end: json['date_end'] as String,
      preview_url: json['preview_url'] as String,
      offer_terms: json['offer_terms'] as String,
      offer_kpi: json['offer_kpi'] as String,
      country_allow: json['country_allow'] as String,
      country_block: json['country_block'] as String,
      city_allow: json['city_allow'] as String,
      city_block: json['city_block'] as String,
      os_allow: json['os_allow'] as String,
      os_block: json['os_block'] as String,
      device_allow: json['device_allow'] as String,
      device_block: json['device_block'] as String,
      isp_allow: json['isp_allow'] as String,
      isp_block: json['isp_block'] as String,
      capping: json['capping'] as String,
      browser_allow: json['browser_allow'] as String,
      browser_block: json['browser_block'] as String,
      impression_url: json['impression_url'] as String,
      click_url: json['click_url'] as String,
      authorized: json['authorized'] as String,
      events: (json['events'] as List<dynamic>?)
          ?.map((e) => EventsBean.fromJson(e as Map<String, dynamic>))
          .toList(),
      creatives: json['creatives'] as String,
      capping_budget_period: json['capping_budget_period'] as String,
      capping_budget: json['capping_budget'] as String,
      capping_conversion_period: json['capping_conversion_period'] as String,
      capping_conversion: json['capping_conversion'] as String,
    );

Map<String, dynamic> _$ContestToJson(Contest instance) => <String, dynamic>{
      'offerid': instance.offerid,
      'name': instance.name,
      'logo': instance.logo,
      'status': instance.status,
      'category': instance.category,
      'currency': instance.currency,
      'price': instance.price,
      'model': instance.model,
      'date_start': instance.date_start,
      'date_end': instance.date_end,
      'preview_url': instance.preview_url,
      'offer_terms': instance.offer_terms,
      'offer_kpi': instance.offer_kpi,
      'country_allow': instance.country_allow,
      'country_block': instance.country_block,
      'city_allow': instance.city_allow,
      'city_block': instance.city_block,
      'os_allow': instance.os_allow,
      'os_block': instance.os_block,
      'device_allow': instance.device_allow,
      'device_block': instance.device_block,
      'isp_allow': instance.isp_allow,
      'isp_block': instance.isp_block,
      'capping': instance.capping,
      'browser_allow': instance.browser_allow,
      'browser_block': instance.browser_block,
      'impression_url': instance.impression_url,
      'click_url': instance.click_url,
      'authorized': instance.authorized,
      'events': instance.events,
      'creatives': instance.creatives,
      'capping_budget_period': instance.capping_budget_period,
      'capping_budget': instance.capping_budget,
      'capping_conversion_period': instance.capping_conversion_period,
      'capping_conversion': instance.capping_conversion,
    };

EventsBean _$EventsBeanFromJson(Map<String, dynamic> json) => EventsBean(
      price: json['price'] as String,
      model: json['model'] as String,
      event_name: json['event_name'] as String,
      event_token: json['event_token'] as String,
    );

Map<String, dynamic> _$EventsBeanToJson(EventsBean instance) =>
    <String, dynamic>{
      'price': instance.price,
      'model': instance.model,
      'event_name': instance.event_name,
      'event_token': instance.event_token,
    };
