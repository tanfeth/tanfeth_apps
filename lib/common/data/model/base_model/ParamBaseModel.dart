import 'package:json_annotation/json_annotation.dart';

part 'ParamBaseModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ParamBaseModel {
  String? pageNumber = "1";

  String? pageSize = "10";

  @JsonKey(includeIfNull: false)
  String? name;

  @JsonKey(includeIfNull: false)
  String? orderBy;

  ParamBaseModel();

  factory ParamBaseModel.fromJson(Map<String, dynamic> json) =>
      _$ParamBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ParamBaseModelToJson(this);

  void parseList(Map<String, dynamic> queryParamters,
      {required List<dynamic> list, required String key}) {
    for (int i = 0; i < list.length; i++) {
      queryParamters["$key[$i]"] = list[i].toString();
    }
  }
}
