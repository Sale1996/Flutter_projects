import 'QuizzlerQuestion.dart';

class QuizzlerBrain {
  int _currentQuestionNumber = 0;
  List<QuizzlerQuestion> _questions = [
    QuizzlerQuestion(
        question: 'You can lead a cow down stairs but not up '
            'stairs.',
        answer: false),
    QuizzlerQuestion(
        question: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    QuizzlerQuestion(
        question: 'A slug\'s blood is green.'
            'stairs.',
        answer: true)
  ];
  bool isFinished = false;

  void goToNextQuestion() {
    if (_currentQuestionNumber < _questions.length - 1) {
      _currentQuestionNumber++;
    } else {
      isFinished = true;
    }
  }

  bool isFinishedGame() {
    return isFinished;
  }

  void resetGame() {
    _currentQuestionNumber = 0;
    isFinished = false;
  }

  String getQuizzlerQuestion() {
    return _questions[_currentQuestionNumber].question;
  }

  bool getQuizzlerQuestionAnswer() {
    return _questions[_currentQuestionNumber].answer;
  }
}
