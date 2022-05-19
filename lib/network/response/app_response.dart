import 'package:json_annotation/json_annotation.dart';

part 'app_response.g.dart';

@JsonSerializable()
class AppResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final Map<String, dynamic>? data;

  AppResponse({this.message, this.data});

  factory AppResponse.fromJson(Map<String, dynamic> json) =>
      _$AppResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppResponseToJson(this);
}
