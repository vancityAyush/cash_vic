import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

enum TransactionType {
  CREDIT,
  DEBIT,
}

@JsonSerializable()
class Transaction {
  String id;
  String user_id;
  String trans_type;
  String amount;
  String remarks;
  String created_at;
  String updated_at;
  String? deleted_at;

  Transaction(
      {required this.id,
      required this.user_id,
      required this.trans_type,
      required this.amount,
      required this.remarks,
      required this.created_at,
      required this.updated_at,
      this.deleted_at});

  DateTime get time => DateTime.parse(updated_at);

  String get value => type == TransactionType.CREDIT ? '+$amount' : '-$amount';

  TransactionType get type =>
      trans_type == "CREDIT" ? TransactionType.CREDIT : TransactionType.DEBIT;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
