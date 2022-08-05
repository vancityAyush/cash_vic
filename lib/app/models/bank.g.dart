// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      id: json['id'] as String,
      user_id: json['user_id'] as String,
      bank_name: json['bank_name'] as String,
      account_number: json['account_number'] as String,
      ifsc_code: json['ifsc_code'] as String,
      account_name: json['account_name'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      deleted_at: json['deleted_at'],
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'bank_name': instance.bank_name,
      'account_number': instance.account_number,
      'ifsc_code': instance.ifsc_code,
      'account_name': instance.account_name,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
