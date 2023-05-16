class Quiz {
  int id;
  String title;
  List<Question> questions;

  Quiz({this.id = 0, required this.title, required this.questions});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    final questions = <Question>[];
    return Quiz(
      id: map['id'] as int,
      title: map['title'] as String,
      questions: questions,
    );
  }
}

class Question {
  int id;
  int quizId;
  String questionText;
  List<Option> options;

  Question(
      {this.id = 0,
      this.quizId = 0,
      required this.questionText,
      required this.options});

  Map<String, dynamic> toMap() {
    return {
      'quiz_id': quizId,
      'question_text': questionText,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    final options = <Option>[];
    return Question(
      id: map['id'] as int,
      quizId: map['quiz_id'] as int,
      questionText: map['question_text'] as String,
      options: options,
    );
  }
}

class Option {
  int id;
  int questionId;
  String optionText;
  bool isCorrect;

  Option(
      {this.id = 0,
      this.questionId = 0,
      required this.optionText,
      required this.isCorrect});

  Map<String, dynamic> toMap() {
    return {
      'question_id': questionId,
      'option_text': optionText,
      'is_correct': isCorrect ? 1 : 0,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      id: map['id'] as int,
      questionId: map['question_id'] as int,
      optionText: map['option_text'] as String,
      isCorrect: map['is_correct'] == 1,
    );
  }
}