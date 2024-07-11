import 'package:json_annotation/json_annotation.dart';
part 'EnumModel.g.dart';


@JsonSerializable(explicitToJson: true)
class EnumModel{

  @JsonKey(name: 'id')
  int ? id;

  @JsonKey(name: 'name')
  String ? name;
  @JsonKey(includeIfNull: false)
  String? code;

  EnumModel();

  factory EnumModel.fromJson(Map<String, dynamic> json) => _$EnumModelFromJson(json);

  static List<EnumModel> toList(dynamic jsonArray) =>
      List<Map<String, dynamic>>.
      from(jsonArray).map(EnumModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$EnumModelToJson(this);

}