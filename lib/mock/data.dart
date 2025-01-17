import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/models/option.dart';
import 'package:testapp/models/user_question.dart';

class UserOptions extends Notifier<UserQuestion> {
  @override
  UserQuestion build() {
    return UserQuestion(
        userId: 'user1',
        questionId: 'question1',
        question: 'What is your favorite time of the day?',
        userHint: 'Mine is definitely the peace in the morning.',
        options: <Option>[
          Option(label: 'A', text: 'The peace in the early mornings'),
          Option(label: 'B', text: 'The magical golden hours'),
          Option(label: 'C', text: 'Wind-down time after dinners'),
          Option(label: 'D', text: 'The serenity past midnight'),
        ]);
  }
}
