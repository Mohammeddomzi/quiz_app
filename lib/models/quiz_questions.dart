class QuizQuestions {
  const QuizQuestions(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> shuffleAnswers() {
    final list = List.of(answers);
    list.shuffle();
    return list;
  }
}
