
import 'package:json_annotation/json_annotation.dart';

part 'HomeAnimateModel.g.dart';

@JsonSerializable(explicitToJson: true)

class HomeAnimateModel {
  bool? header;
  bool? confirmFooter;
  bool? tripFooter;
  bool? findDriver;

  HomeAnimateModel({
     this.header = true,
    this.confirmFooter = true,
    this.tripFooter = false,
    this.findDriver = false,
});


  factory HomeAnimateModel.fromJson(Map<String, dynamic> json) => _$HomeAnimateModelFromJson(json);

  static List<HomeAnimateModel> toList(dynamic jsonArray) => List<Map<String, dynamic>>.from(jsonArray).map(HomeAnimateModel.fromJson).toList();

  Map<String, dynamic> toJson() => _$HomeAnimateModelToJson(this);


  HomeAnimateModel copyWith({ bool? header, bool? confirmFooter ,
  bool? tripFooter,bool? findDriver}) => HomeAnimateModel(
      header: header ?? this.header,
      confirmFooter: confirmFooter ?? this.confirmFooter,
      tripFooter: tripFooter ?? this.tripFooter,
      findDriver: findDriver ?? this.findDriver
  );
  
  
}