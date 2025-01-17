import 'package:json_annotation/json_annotation.dart';


part 'option.g.dart';

@JsonSerializable()
class Option {
  final String label;
  final String text;

  Option({required this.label, required this.text});

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
