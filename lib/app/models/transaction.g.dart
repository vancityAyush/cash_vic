// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String,
      user_id: json['user_id'] as String,
      trans_type: json['trans_type'] as String,
      amount: json['amount'] as String,
      remarks: json['remarks'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      deleted_at: json['deleted_at'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'trans_type': instance.trans_type,
      'amount': instance.amount,
      'remarks': instance.remarks,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
    };
