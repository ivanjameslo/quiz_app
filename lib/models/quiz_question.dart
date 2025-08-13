// domain class
// if it is a domain class, it works on the background and thus does not need to be extended
class QuizQuestion {

  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}