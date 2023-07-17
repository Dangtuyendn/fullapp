import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/data/account/account.dart';
import 'package:studentapp/data/schedule/db_helper.dart';
import 'package:studentapp/data/register/db_register_helper.dart';
import 'package:studentapp/data/register/register.dart';
import 'package:studentapp/data/schedule/schedule.dart';
import 'package:studentapp/data/account/account_db.dart';
import 'package:studentapp/data/subject/subject.dart';
import 'package:studentapp/data/subject/subject_db.dart';
import 'package:studentapp/data/transcript/transcript.dart';
import 'package:studentapp/data/transcript/transcript_db.dart';
import 'package:studentapp/screen/account/login_screen.dart';

class ListController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  final box = GetStorage();

  //select bottom bar
  var index = 0.obs;
  void onchangeBottomBar(var newindex) {
    index.value = newindex;
    update();
  }

  //----------------------------Register---------------------------------------
//add Register
  var listRegister = <Register>[].obs;
  addRegister() async {
    int? newValue = await addNewRegister(
        register: Register(
      name: nameEdittingController.text,
      email: emailEdittingController.text,
      password: passEdittingController.text,
    ));
    print('my id $newValue');
    nameEdittingController.clear();
    emailEdittingController.clear();
    passEdittingController.clear();
  }

  Future<int?> addNewRegister({Register? register}) async {
    return await DBRegister.insert(register);
  }

  // get all data in from table
  void getRegister() async {
    List<Map<String, dynamic>> getRegisters = await DBRegister.querydb();
    listRegister.assignAll(
        getRegisters.map((data) => Register.fromJson(data)).toList());
  }

//----------------------Schedule-------------------------

  TextEditingController tittleEdittingController = TextEditingController();
  TextEditingController noteEdittingController = TextEditingController();
  var selectDateTime = DateTime.now().obs;
  var startTime = DateFormat("hh:mm a").format(DateTime.now()).toString().obs;
  var endTime = '9h00'.obs;
  var selectRemind = 5.obs;
  var selectRepeat = 'None'.obs;
  var selectColor = 0.obs;
  List<int> listRemind = [5, 10, 15, 20].obs;
  List<String> listRepeat = ['None', 'Daily', 'Weekly', 'Monthy'].obs;
  var listSchedule = <Schedule>[].obs;

  void onchangeDate(var date) {
    selectDateTime.value = date;
    update();
    refresh();
  }

//add Schedule
  addSchedule() async {
    int? newValue = await addNewSchedule(
        newSchedule: Schedule(
            title: tittleEdittingController.text,
            note: noteEdittingController.text,
            date: DateFormat.yMd().format(selectDateTime.value),
            isCompleted: 0,
            startTime: startTime.value,
            endTime: endTime.value,
            reMind: selectRemind.value,
            repeat: selectRepeat.value,
            color: selectColor.value));
    print('my id is $newValue');
    tittleEdittingController.clear();
    noteEdittingController.clear();
    getSchedule();
  }

  Future<int?> addNewSchedule({Schedule? newSchedule}) async {
    return await DBHelper.insert(newSchedule);
  }

  // get all data in from table
  void getSchedule() async {
    // List<Map<String, dynamic>> taskSchedules=await DBHelper.query() ;
    List<Map<String, dynamic>> taskSchedules = await DBHelper.query();
    listSchedule.assignAll(
        taskSchedules.map((data) => Schedule.fromJson(data)).toList());
  }

//delete
  void deleteShedule(Schedule newSchedule) {
    DBHelper.deleteSchedule(newSchedule);
    getSchedule();
  }

//edit
  void updateComplete(int id) async {
    await DBHelper.update(id);
    getSchedule();
  }

  //-------------------------account-------------------------
  TextEditingController nameEdittingController = TextEditingController();
  TextEditingController emailEdittingController = TextEditingController();
  TextEditingController passEdittingController = TextEditingController();
  var listAccount = <Account>[].obs;

  void getAccount() async {
    List<Map<String, dynamic>> taskAcounts = await AccountDBHelper.querydtb();
    listAccount
        .assignAll(taskAcounts.map((data) => Account.fromJson(data)).toList());
  }

  //add
  addAcountDB() async {
    int? value = await addAcount(
        account: Account(
            name: nameEdittingController.text,
            email: emailEdittingController.text,
            password: passEdittingController.text));
    print('my id is $value');
    nameEdittingController.clear();
    emailEdittingController.clear();
    passEdittingController.clear();
  }
  //insert

  Future<int?> addAcount({Account? account}) async {
    // return await AccountDBHelper.insert(account);
    return await AccountDBHelper.insert(account).then((userData) {
      Get.snackbar('title', 'succuess');
      Get.to(() => LoginScreen());
    }).catchError((error) {
      print(error);
      Get.snackbar('error', 'Data save Fail');
    });
  }

//show
  void showDataAcount() async {
    List<Map<String, dynamic>> showAccount =
        await AccountDBHelper.showDataAcount("SELECT * FROM 'account' ");
    print(showAccount);
  }

  //------------------------Subject---------------------
  var selectSubject = 'English'.obs;
  List<String> listSubject = [
    'English',
    'Math',
    'History',
    'Biology',
    'Geographic',
    'Physic',
    'Litelature'
  ].obs;
  var selectPeriods = ''.obs;
  var selectTeacher = 'Nguyen Thi A'.obs;
  List<String> listTeacher =
      ['Nguyen Thi A', 'Huynh C', 'Nguyen B', 'Ngo Van D'].obs;
  List<String> listRoom = ['PH1', 'PH2', 'PH3'].obs;
  var selectRoom = 'PH1'.obs;
  var selectWeekDay = 'Monday'.obs;
  List<String> listWeekDay = ['Mon', 'Tueday', 'Wed', 'Thu', 'Fri', 'Sat'].obs;
  var selectNumber = 1.obs;
  List<int> listNumber = [1, 2, 3, 4, 5, 6, 7, 8, 9].obs;
  var listSubjects = [].obs;
  var listOfSubject = [].obs;

  addSubject() async {
    int? newValue = await addNewSubject(
        subject: Subject(
      nameSubject: selectSubject.value,
      teacher: selectTeacher.value,
      room: selectRoom.value,
      day: selectWeekDay.value,
      period: selectNumber.value,
    ));
    print('my id is $newValue');
    getSubject();
  }

  Future<int?> addNewSubject({Subject? subject}) async {
    return await SubjectDB.insert(subject);
  }

  void getSubject() async {
    // List<Map<String, dynamic>> taskSubject = await SubjectDB.query();
    // listSubjects
    //     .assignAll(taskSubject.map((data) => Subject.fromJson(data)).toList());
    List<Map<String, dynamic>> taskSubject = await SubjectDB.query();
    listOfSubject
        .assignAll(taskSubject.map((data) => Subject.fromJson(data)).toList());
  }

  //update
  editSubject(Subject? subject) async {
    //Subject? subject,
    int? newValue = await editNewSubject(
        subject: Subject(
      id: subject!.id,
      nameSubject: selectSubject.value,
      teacher: selectTeacher.value,
      room: selectRoom.value,
      day: selectWeekDay.value,
      period: selectNumber.value,
    ));
    print('my id is $newValue');
    getSubject();
  }

  Future<int?> editNewSubject({Subject? subject}) async {
    return await SubjectDB.updateUser(subject);
  }

  void deleteSubject(Subject subject) {
    SubjectDB.deleteSubjectDB(subject);
    getSubject();
  }

  void showDataSubject() async {
    List<Map<String, dynamic>> showAccount =
        await SubjectDB.showDataSubject("SELECT * FROM 'subjects' ");
    print(showAccount);
  }

//-----------------------------------Transcript------------------------------
  var nameSubject = 'English'.obs;
  var testOne = 1.obs;
  var testTwo = 1.obs;
  var testThree = 1.obs;
  var testFour = 1.obs;
  var list = [].obs;
  var listRow = [].obs;

  addTranscript() async {
    int? newData = await newTranscript(
        transcript: Transcript(
            nameSubject: nameSubject.value,
            testOne: testOne.value,
            testTwo: testTwo.value,
            testThree: testThree.value,
            testFour: testFour.value));
    print('my id ${newData!} ');
    getTranscript();
  }

  Future<int?> newTranscript({Transcript? transcript}) async {
    return await TranscriptDB.insert(transcript);
  }

  void getTranscript() async {
    // List<Map<String, dynamic>> taskSchedules=await DBHelper.query() ;
    List<Map<String, dynamic>> taskTranscript = await TranscriptDB.query();
    listRow.assignAll(
        taskTranscript.map((data) => Transcript.fromJson(data)).toList());
  }

  void showDataTranscript() async {
    List<Map<String, dynamic>> showAccount =
        await TranscriptDB.showDataTranscript("SELECT * FROM 'transcript' ");
    print(showAccount);
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    getSchedule();
    getSubject();
    getTranscript();
    super.onReady();
  }

  @override
  void onclose() {
    super.onClose();
    tittleEdittingController.dispose();
    noteEdittingController.dispose();
    nameEdittingController.dispose();
    emailEdittingController.dispose();
    passEdittingController.dispose();
    tabController.dispose();
    super.dispose();
  }
}
