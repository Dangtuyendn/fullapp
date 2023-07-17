import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications {
  Image image;
  String title;
  String description;
  String time;
  Notifications(
      {required this.image,
      required this.title,
      required this.description,
      required this.time});
}

List<Notifications> listNotification = [
  Notifications(
      image: const Image(image: AssetImage('assets/images/teacher.png')),
      title: "Cô abc",
      description: 'Chiều nay kiểm tra giữa kỳ',
      time: '7:00-am'),
  Notifications(
      image: const Image(image: AssetImage('assets/images/teacher2.jpg')),
      title: "Đoàn trường",
      description: 'Chủ nhật tổng dọn vệ sinh',
      time: '9:00 am'),
  Notifications(
      image: const Image(image: AssetImage('assets/images/notification2.jpg')),
      title: "Đào tạo",
      description: 'Cuộc thi robocon',
      time: '9:30 am'),
];
