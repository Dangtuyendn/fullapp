class Courses {
  String thumbnail;
  String name;
  Courses({
    required this.thumbnail,
    required this.name,
  });
}

// list of courses/ danh sách có sẵn
List<Courses> coursesList = [
  Courses(
    thumbnail: 'assets/images/flutter.png',
    name: 'Flutter',
  ),
  Courses(
    thumbnail: 'assets/images/Reactnative.png',
    name: 'React Native',
  ),
  Courses(
    thumbnail: 'assets/images/cplus.png',
    name: 'C++',
  ),
  Courses(
    thumbnail: 'assets/images/java.png',
    name: 'Java',
  ),
  Courses(
    thumbnail: 'assets/images/javascript.png',
    name: 'Java Script',
  ),
  Courses(
    thumbnail: 'assets/images/flutter.png',
    name: 'Flutter',
  ),
  Courses(
    thumbnail: 'assets/images/Python.png',
    name: 'Python',
  ),
  Courses(
    thumbnail: 'assets/images/swift.png',
    name: 'Swift',
  )
];
