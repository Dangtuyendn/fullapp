import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:studentapp/screen/asignment_screen.dart';
import 'package:studentapp/screen/courses/courses_screen.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/screen/fee_screen.dart';
import 'package:studentapp/screen/notification/notification_screen.dart';
import 'package:studentapp/screen/result/result_screen.dart';
import 'package:studentapp/screen/schedule/schedule_screen.dart';
import 'package:studentapp/screen/subject/subject_screen.dart';
import 'package:studentapp/screen/tabbarpage/transcript_screen.dart';

class Category {
  int id;
  String thumbnail;
  String name;
  VoidCallback? ontap;
  Category(
      {required this.id,
      required this.thumbnail,
      required this.name,
      this.ontap});
  @override
  String toString() {
    return '${this.name}';
  }
}

List<Category> categoryList = [
  Category(
      id: 1,
      thumbnail: 'assets/images/notification.png',
      name: 'Notification',
      ontap: () {
        // Get.to(NotificationScreen());
        Get.to(() => NotificationScreen());
      }),
  Category(
      id: 2,
      thumbnail: 'assets/images/Calendar.png',
      name: 'Schedule',
      ontap: () {
        Get.to(() => ScheduleScreen());
      }),
  Category(
      id: 3,
      thumbnail: 'assets/images/courses.png',
      name: 'Courses',
      ontap: () {
        Get.to(() => const CoursesScreen());
      }),
  Category(
    id: 4,
    thumbnail: 'assets/images/fee.png',
    name: 'Fee',
    ontap: () {
      Get.to(() => FeeScreen());
    },
  ),
  Category(
    id: 5,
    thumbnail: 'assets/images/study.png',
    name: 'Learn',
    ontap: () {
      Get.to(() => SubjectScreen());
    },
  ),
  Category(
      id: 6,
      thumbnail: 'assets/icons/assignment.png',
      name: 'Assignment',
      ontap: () {
        Get.to(() => const AssignmentScreen());
      }),
  Category(
    id: 7,
    thumbnail: 'assets/icons/transcript.jpg',
    name: 'Transcript',
    ontap: () {
      Get.to(() => TranscriptScreen());
    },
  ),
  Category(
      id: 8,
      thumbnail: 'assets/images/learningresult.jpg',
      name: 'Learning Result',
      ontap: () {
        Get.to(() => ResultScreen());
      }),
];
