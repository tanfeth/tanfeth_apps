import 'package:json_annotation/json_annotation.dart';
import 'package:tanfeth_apps/common/network/network/api/api_response.dart';

part 'BaseModel.g.dart';

@JsonSerializable(explicitToJson: true)
class BaseModel {
  @JsonKey()
  int id = 0;

  bool? isAdded = false;

  @JsonKey(ignore: true)
  ApiResponse apiResponse = ApiResponse();

  String? createdBy;

  String? createdAt;

  String? lastModifiedBy;

  String? lastModifiedAt;
}
