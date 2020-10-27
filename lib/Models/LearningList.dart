class LearningList {
  String lang1;
  String lang2;
  String title;
  Map<dynamic, dynamic> words;

  LearningList({this.lang1, this.lang2, this.title, this.words});

  factory LearningList.fromJson(Map<String, dynamic> json) {
    return LearningList(
        lang1: json["lang1"],
        lang2: json["lang2"],
        title: json["title"],
        words: json["words"]);
  }
}
