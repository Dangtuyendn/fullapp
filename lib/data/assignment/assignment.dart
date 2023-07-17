class Assignment {
  String? subjectName;
  String? title;
  String? startDate;
  String? endDate;
  String? status;
  Assignment(
      {this.subjectName,
      this.title,
      this.startDate,
      this.endDate,
      this.status});
}

//list assignment
List<Assignment> assignmentList = <Assignment>[
  Assignment(
      subjectName: 'Biology',
      title: "red blood cells",
      startDate: '1 jul 2023',
      endDate: '10 jul 2023',
      status: 'Pending'),
  Assignment(
      subjectName: 'Physics',
      title: "Bhor theory",
      startDate: '1 aug 2023',
      endDate: '10 aug 2023',
      status: 'Submitted'),
  Assignment(
      subjectName: 'Mathematics',
      title: "Algebra ",
      startDate: '1 oct 2023',
      endDate: '12 oct 2023',
      status: 'Pending'),
];
