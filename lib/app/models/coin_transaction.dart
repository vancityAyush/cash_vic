import 'package:json_annotation/json_annotation.dart';

part 'coin_transaction.g.dart';

@JsonSerializable()
class CoinTransaction {
  String id;
  String user_id;
  String points;
  String points_used_no;
  String day_no;
  String month_no;
  String year_no;
  String first_not;
  dynamic remarks;
  String created_at;

  CoinTransaction(
      {required this.id,
      required this.user_id,
      required this.points,
      required this.points_used_no,
      required this.day_no,
      required this.month_no,
      required this.year_no,
      required this.first_not,
      this.remarks,
      required this.created_at});

  DateTime get time => DateTime.parse(created_at);

  factory CoinTransaction.fromJson(Map<String, dynamic> json) =>
      _$CoinTransactionFromJson(json);

  Map<String, dynamic> toJson() => _$CoinTransactionToJson(this);
}
