class LessonData {
  String title = "";
  String introText = "";
  String studyText = "";
  List<Test1Data> test1 = [];
  dynamic test2;
  dynamic test3;

  LessonData(
      {this.title,
      this.introText,
      this.studyText,
      this.test1,
      this.test2,
      this.test3});

  factory LessonData.fromJSON(Map<String, dynamic> jsonData) {
    List<Test1Data> test1DataList = [];
    for (var x in jsonData['test1']) {
      test1DataList.add(Test1Data.fromJSON(x));
    }
    return LessonData(
      title: jsonData['title'],
      introText: jsonData['intro_text'],
      studyText: jsonData['study_text'],
      test1: test1DataList,
      test2: jsonData['test2'],
      test3: jsonData['test3'],
    );
  }
}

class ChoiceData {
  String text;
  bool correct;

  ChoiceData({this.text, this.correct});

  factory ChoiceData.fromJson(Map<String, dynamic> jsonData) {
    return ChoiceData(text: jsonData['text'], correct: jsonData['correct']);
  }
}

class QuestionData {
  String text;
  List<ChoiceData> options;

  QuestionData({this.text, this.options});

  factory QuestionData.fromJSON(Map<String, dynamic> jsonData) {
    List<ChoiceData> opts = [];
    for (var x in jsonData['options']) {
      opts.add(ChoiceData.fromJson(x));
    }
    return QuestionData(text: jsonData['text'], options: opts);
  }
}

class Test1Data {
  String name;
  List<QuestionData> questions;

  Test1Data({this.name, this.questions});

  factory Test1Data.fromJSON(Map<String, dynamic> jsonData) {
    List<QuestionData> ques = [];
    for (var q in jsonData['questions']) {
      ques.add(QuestionData.fromJSON(q));
    }
    return Test1Data(name: jsonData['name'], questions: ques);
  }
}

class PicturePairData {
  String picture;
  String description;

  PicturePairData({this.picture, this.description});

  factory PicturePairData.fromJSON(Map<String, dynamic> jsonData) {
    return PicturePairData(
        picture: jsonData['picture'], description: jsonData['description']);
  }
}

class Test2Data {
  String name;
  List<PicturePairData> pictures;

  Test2Data({this.name, this.pictures});

  factory Test2Data.fromJSON(Map<String, dynamic> jsonData) {
    List<PicturePairData> pics = [];
    for (var x in jsonData['pictures']) {
      pics.add(PicturePairData.fromJSON(x));
    }
    return Test2Data(name: jsonData['name'], pictures: pics);
  }
}

class NumberList{
  List<int> numbers;

  NumberList({this.numbers});

  factory NumberList.fromJSON(List<dynamic> jsonData){
    List<int> nums = [];
    for (var x in jsonData){
      nums.add(x);
    }
    return NumberList(numbers: nums);
  }
}

class Test3Data{
  String name;
  List<NumberList> numberLists;

  Test3Data({this.name, this.numberLists});

  factory Test3Data.fromJSON(Map<String, dynamic> jsonData){
    List<NumberList> numbersList =[];
    for (var x in jsonData['number_lists']){
      numbersList.add(NumberList.fromJSON(x));
    }
    return Test3Data(name: jsonData['name'], numberLists: numbersList);
  }
}

class AudioPairData {
  String audio;
  String description;

  AudioPairData({this.audio, this.description});

  factory AudioPairData.fromJSON(Map<String, dynamic> jsonData) {
    return AudioPairData(
        audio: jsonData['audio'], description: jsonData['description']);
  }
}

class Test4Data {
  String name;
  List<AudioPairData> audios;

  Test4Data({this.name, this.audios});

  factory Test4Data.fromJSON(Map<String, dynamic> jsonData) {
    List<AudioPairData> pics = [];
    for (var x in jsonData['audios']) {
      pics.add(AudioPairData.fromJSON(x));
    }
    return Test4Data(name: jsonData['name'], audios: pics);
  }
}


