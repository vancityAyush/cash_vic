import 'package:json_annotation/json_annotation.dart';

part 'spin_data.g.dart';

@JsonSerializable()
class SpinData {
  String id;
  String spin_values;

  SpinData({required this.id, required this.spin_values});

  factory SpinData.fromJson(Map<String, dynamic> json) =>
      _$SpinDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpinDataToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpinData && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return spin_values;
  }
}
