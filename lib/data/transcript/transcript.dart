class Transcript {
  int? id;
  String? nameSubject;
  int? testOne;
  int? testTwo;
  int? testThree;
  int? testFour;
  Transcript({
    this.id,
    this.nameSubject,
    this.testOne,
    this.testTwo,
    this.testThree,
    this.testFour,
  });
  Transcript.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSubject = json['nameSubject'];
    testOne = json['testOne'];
    testTwo = json['testTwo'];
    testThree = json['testThree'];
    testFour = json['testFour'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameSubject'] = nameSubject;
    data['testOne'] = testOne;
    data['testTwo'] = testTwo;
    data['testThree'] = testThree;
    data['testFour'] = testFour;
    return data;
  }
}
