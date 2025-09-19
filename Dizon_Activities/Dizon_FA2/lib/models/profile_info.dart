class ProfileInfo {
  final String infoDescription;
  final List<String> infoItems;
  final String correctAnswer;

  const ProfileInfo(this.infoDescription, this.infoItems, {required this.correctAnswer});

  List<String> getShuffledList() {
    final list = List<String>.from(infoItems);
    list.shuffle();
    return list;
  }
}
