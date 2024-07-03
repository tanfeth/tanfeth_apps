
import 'package:json_annotation/json_annotation.dart';

part 'HomeAnimateModel.g.dart';

@JsonSerializable(explicitToJson: true)

class HomeAnimateModel {
  bool? header;
  bool? confirmFooter;
  bool? tripFooter;

  HomeAnimateModel({
     this.header = true,
    this.confirmFooter = false,
    this.tripFooter = false
});


  factory HomeAnimateModel.fromJson(Map<String, dynamic> json) => _$HomeAnimateModelFromJson(json);

  static List<HomeAnimateModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(HomeAnimateModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$HomeAnimateModelToJson(this);


  HomeAnimateModel copyWith({ bool? header, bool? confirmFooter ,
  bool? tripFooter}) => HomeAnimateModel(
      header: header ?? this.header,
      confirmFooter: confirmFooter ?? this.confirmFooter,
      tripFooter: tripFooter ?? this.tripFooter
  );
  
  
}