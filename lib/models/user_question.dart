import 'package:json_annotation/json_annotation.dart';
import 'package:testapp/models/option.dart';


part 'user_question.g.dart';


@JsonSerializable()
class UserQuestion {
  final String userId;
  final String questionId;
  final String question;
  final String userHint;
  final List<Option> options;


  UserQuestion({required this.userId, required this.questionId, required this.question, required this.userHint, required this.options});
  factory UserQuestion.fromJson(Map<String, dynamic> json) => _$UserQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$UserQuestionToJson(this);
  }