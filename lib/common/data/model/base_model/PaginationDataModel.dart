import 'package:json_annotation/json_annotation.dart';

part 'PaginationDataModel.g.dart';

@JsonSerializable(explicitToJson: true)
class PaginationDataModel {
  int? total;
  int? lastPage;
  int? perPage;
  int? currentPage;

  PaginationDataModel();

  factory PaginationDataModel.fromJson(Map<String, dynamic> json) => _$PaginationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationDataModelToJson(this);
}
