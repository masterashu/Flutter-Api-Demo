class LessonData {
  String title = "";
  String introText = "";
  String studyText = "";
  List<Test1Data> test1 = [];
  List<Test2Data> test2 = [];
  List<Test3Data> test3 = [];
  List<Test4Data> test4 = [];
  List<Test6Data> test6 = [];  

  LessonData(
      {this.title,
      this.introText,
      this.studyText,
      this.test1,
      this.test2,
      this.test3,
      this.test4,
      this.test6});

  factory LessonData.fromJSON(Map<String, dynamic> jsonData) {
    List<Test1Data> test1DataList = [];
    for (var x in jsonData['test1']) {
      test1DataList.add(Test1Data.fromJSON(x));
    }
    List<Test2Data> test2DataList = [];
    for (var x in jsonData['test2']) {
      test2DataList.add(Test2Data.fromJSON(x));
    }
    List<Test3Data> test3DataList = [];
    for (var x in jsonData['test3']) {
      test3DataList.add(Test3Data.fromJSON(x));
    }
    List<Test4Data> test4DataList = [];
    for (var x in jsonData['test4']) {
      test4DataList.add(Test4Data.fromJSON(x));
    }
    List<Test6Data> test6DataList = [];
    for (var x in jsonData['test6']) {
      test6DataList.add(Test6Data.fromJSON(x));
    }
    return LessonData(
      title: jsonData['title'],
      introText: jsonData['intro_text'],
      studyText: jsonData['study_text'],
      test1: test1DataList,
      test2: test2DataList,
      test3: test3DataList,
      test4: test4DataList,
      test6: test6DataList,
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



class PicturePairChoice {
  String picture;
  String description;
  bool correct;

  PicturePairChoice({this.picture, this.description, this.correct});

  factory PicturePairChoice.fromJSON(Map<String, dynamic> jsonData) {
    return PicturePairChoice(
        picture: jsonData['picture'], description: jsonData['description'], correct: jsonData['correct']);
  }
}


class Test6Data {
  String name;
  List<PicturePairChoice> choices;

  Test6Data({this.name, this.choices});

  factory Test6Data.fromJSON(Map<String, dynamic> jsonData) {
    List<PicturePairChoice> pics = [];
    for (var x in jsonData['choices']){
      pics.add(PicturePairChoice.fromJSON(x));
    }
    return Test6Data(name: jsonData['name'], choices: pics);
  }
}

