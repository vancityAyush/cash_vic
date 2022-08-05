import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable()
class Bank {
  String id;
  String user_id;
  String bank_name;
  String account_number;
  String ifsc_code;
  String account_name;
  String created_at;
  String updated_at;
  dynamic deleted_at;

  Bank(
      {required this.id,
      required this.user_id,
      required this.bank_name,
      required this.account_number,
      required this.ifsc_code,
      required this.account_name,
      required this.created_at,
      required this.updated_at,
      this.deleted_at});

  String get header => '$account_name - $bank_name';

  String get subtitle => 'A/C : $account_number\nIFSC : $ifsc_code';

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}
