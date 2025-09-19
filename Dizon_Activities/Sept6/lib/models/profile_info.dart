class ProfileInfo {
  const ProfileInfo(this.InfoDescription, this.InfoItems);

  final String InfoDescription;
  final List<String> InfoItems;

  List<String> getShuffledList(){
    final List<String> shuffledList = List.of(InfoItems);
    shuffledList.shuffle();
  
  return shuffledList;
  }
}