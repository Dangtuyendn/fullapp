class Subject {
  int? id;
  String? nameSubject;
  String? teacher;
  String? room;
  String? day;
  int? period;
  Subject({this.id, this.nameSubject, this.teacher, this.room, this.day,this.period});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameSubject = json['nameSubject'];
    teacher = json['teacher'];
    room = json['room'];
    day=json['day'];
    period=json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameSubject'] = nameSubject;
    data['teacher'] = teacher;
    data['room'] = room;
    data['day']=day;
    data['period']=period;
    return data;
  }
}
