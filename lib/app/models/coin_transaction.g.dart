// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinTransaction _$CoinTransactionFromJson(Map<String, dynamic> json) =>
    CoinTransaction(
      id: json['id'] as String,
      user_id: json['user_id'] as String,
      points: json['points'] as String,
      points_used_no: json['points_used_no'] as String,
      day_no: json['day_no'] as String,
      month_no: json['month_no'] as String,
      year_no: json['year_no'] as String,
      first_not: json['first_not'] as String,
      remarks: json['remarks'],
      created_at: json['created_at'] as String,
    );

Map<String, dynamic> _$CoinTransactionToJson(CoinTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'points': instance.points,
      'points_used_no': instance.points_used_no,
      'day_no': instance.day_no,
      'month_no': instance.month_no,
      'year_no': instance.year_no,
      'first_not': instance.first_not,
      'remarks': instance.remarks,
      'created_at': instance.created_at,
    };
