import 'dart:developer';
import 'dart:math' as math;

import 'package:card_craft/src/core/drop_down/drop_list_model.dart';
import 'package:flutter/foundation.dart';

List<DropListModel> getDesignationsList() {
  return [
    DropListModel(name: "MANAGER", id: "manager"),
    DropListModel(name: "PRINCIPAL", id: "principal"),
    DropListModel(name: "SENIOR CLERK", id: "senior-clerk"),
    DropListModel(name: "JUNIOR CLERK", id: "junior-clerk"),
    DropListModel(name: "CLERK", id: "clerk"),
    DropListModel(name: "EXAM INCHARGE", id: "exam-incharge"),
    DropListModel(name: "SPORTS INCHARGE", id: "sports-incharge"),
    DropListModel(name: "NCC INCHARGE", id: "ncc-incharge"),
    DropListModel(name: "SCOUT INCHARGE", id: "scout-incharge"),
    DropListModel(name: "LIBRARY INCHARGE", id: "library-incharge"),
    DropListModel(name: "HOSTEL INCHARGE", id: "hostel-incharge"),
    DropListModel(name: "CLASS TEACHER", id: "class-teacher"),
    DropListModel(name: "ASST. TEACHER", id: "asst-teacher"),
    DropListModel(name: "DRIVER", id: "driver"),
    DropListModel(name: "SUB DRIVER", id: "sub-driver"),
    DropListModel(name: "PEON", id: "peon"),
  ];
}

List<DropListModel> getCasteList() {
  return [
    DropListModel(name: "General", id: "1"),
    DropListModel(name: "SC", id: "2"),
    DropListModel(name: "OBC", id: "3"),
  ];
}

List<DropListModel> getSubCasteList() {
  return [
    DropListModel(name: "General", id: "1"),
    DropListModel(name: "SC", id: "2"),
    DropListModel(name: "OBC", id: "3"),
  ];
}

List<DropListModel> getReligionList() {
  return [
    DropListModel(name: "Hinduism", id: "1"),
    DropListModel(name: "Sikhism", id: "2"),
    DropListModel(name: "Jainism", id: "3"),
    DropListModel(name: "Christianity", id: "4"),
    DropListModel(name: "Islam", id: " 5"),
  ];
}

List<DropListModel> getQualificationList() {
  List<DropListModel> list = [];

  list.add(DropListModel(name: "High School Diploma", id: "1"));
  list.add(DropListModel(name: "Associate Degree", id: "2"));
  list.add(DropListModel(name: "Bachelor's Degree", id: "3"));
  list.add(DropListModel(name: "Master's Degree", id: "4"));
  list.add(DropListModel(name: "Doctorate Degree", id: "5"));
  list.add(DropListModel(name: "Professional Degree", id: "6"));
  list.add(DropListModel(name: "Vocational Training Certificate", id: "7"));
  list.add(DropListModel(name: "Technical Certification", id: "8"));
  list.add(DropListModel(name: "Trade School Diploma", id: "9"));
  list.add(DropListModel(name: "Apprenticeship", id: "10"));
  list.add(DropListModel(name: "Postdoctoral Training", id: "11"));
  list.add(DropListModel(name: "MBA", id: "12"));
  list.add(DropListModel(name: "Law Degree", id: "13"));
  list.add(DropListModel(name: "Medical Degree", id: "14"));
  list.add(DropListModel(name: "Nursing Degree", id: "15"));
  list.add(DropListModel(name: "Pharmacy Degree", id: "16"));
  list.add(DropListModel(name: "Engineering Degree", id: "17"));
  list.add(DropListModel(name: "Accounting Certification", id: "18"));
  list.add(DropListModel(name: "Project Management Certification", id: "19"));
  list.add(
      DropListModel(name: "Information Technology Certification", id: "20"));
  list.add(DropListModel(name: "Teaching Certification", id: "21"));
  list.add(DropListModel(name: "Real Estate License", id: "22"));
  list.add(DropListModel(name: "Commercial Driver's License", id: "23"));
  list.add(DropListModel(name: "First Aid Certification", id: "24"));
  list.add(DropListModel(name: "Fitness Certification", id: "25"));
  list.add(DropListModel(name: "Piloting License", id: "26"));
  list.add(DropListModel(name: "Cosmetology License", id: "27"));
  list.add(DropListModel(name: "Electrician License", id: "28"));
  list.add(DropListModel(name: "Plumbing License", id: "29"));
  list.add(DropListModel(name: "Welding Certification", id: "30"));
  list.add(DropListModel(name: "Culinary Arts Degree/Certification", id: "31"));
  list.add(DropListModel(name: "Graphic Design Certification", id: "32"));
  list.add(DropListModel(name: "Web Development Certification", id: "33"));
  list.add(DropListModel(
      name: "Foreign Language Proficiency Certification", id: "34"));
  list.add(DropListModel(name: "Public Speaking Certification", id: "35"));
  list.add(DropListModel(name: "Human Resources Certification", id: "36"));
  list.add(DropListModel(name: "Marketing Certification", id: "37"));
  list.add(
      DropListModel(name: "Supply Chain Management Certification", id: "38"));
  list.add(DropListModel(name: "Data Science Certification", id: "39"));
  list.add(DropListModel(name: "Cybersecurity Certification", id: "40"));

  return list;
}

List<DropListModel> getBloodGroupList() {
  List<DropListModel> list = [];
  list.add(DropListModel(name: "A+", id: "1"));
  list.add(DropListModel(name: "A-", id: "2"));
  list.add(DropListModel(name: "B+", id: "3"));
  list.add(DropListModel(name: "B-", id: "4"));
  list.add(DropListModel(name: "AB+", id: "5"));
  list.add(DropListModel(name: "AB-", id: "6"));
  list.add(DropListModel(name: "O+", id: "7"));
  list.add(DropListModel(name: "O-", id: "8"));
  return list;
}

List<DropListModel> getDisabilityTypeList() {
  List<DropListModel> list = [];
  list.add(DropListModel(name: "Physical Disability", id: "1"));
  list.add(DropListModel(name: "Hearing Disability", id: "2"));
  list.add(DropListModel(name: "Visual Disability", id: "3"));
  list.add(DropListModel(name: "Speech Disability", id: "4"));
  list.add(DropListModel(name: "Intellectual Disability", id: "5"));
  list.add(DropListModel(name: "Learning Disability", id: "6"));
  list.add(DropListModel(name: "Mental Illness", id: "7"));
  list.add(DropListModel(name: "Multiple Disabilities", id: "8"));
  return list;
}

List<DropListModel> getOccupationList() {
  List<DropListModel> list = [];
  list.add(DropListModel(name: "Doctor", id: "1"));
  list.add(DropListModel(name: "Nurse", id: "2"));
  list.add(DropListModel(name: "Pharmacist", id: "3"));
  list.add(DropListModel(name: "Dentist", id: "4"));
  list.add(DropListModel(name: "Physical Therapist", id: "5"));
  list.add(DropListModel(name: "Medical Technician", id: "6"));
  list.add(DropListModel(name: "Paramedic", id: "7"));
  list.add(DropListModel(name: "Veterinarian", id: "8"));
  list.add(DropListModel(name: "Psychologist", id: "9"));
  list.add(DropListModel(name: "Surgeon", id: "10"));
  list.add(DropListModel(name: "Teacher", id: "11"));
  list.add(DropListModel(name: "Professor", id: "12"));
  list.add(DropListModel(name: "Educational Administrator", id: "13"));
  list.add(DropListModel(name: "Trainer", id: "14"));
  list.add(DropListModel(name: "Tutor", id: "15"));
  list.add(DropListModel(name: "School Counselor", id: "16"));
  list.add(DropListModel(name: "Librarian", id: "17"));
  list.add(DropListModel(name: "Instructional Coordinator", id: "18"));
  list.add(DropListModel(name: "Special Education Teacher", id: "19"));
  list.add(DropListModel(name: "Accountant", id: "20"));
  list.add(DropListModel(name: "Financial Analyst", id: "21"));
  list.add(DropListModel(name: "Banker", id: "22"));
  list.add(DropListModel(name: "Business Consultant", id: "23"));
  list.add(DropListModel(name: "Human Resources Manager", id: "24"));
  list.add(DropListModel(name: "Marketing Manager", id: "25"));
  list.add(DropListModel(name: "Sales Representative", id: "26"));
  list.add(DropListModel(name: "Insurance Agent", id: "27"));
  list.add(DropListModel(name: "Project Manager", id: "28"));
  list.add(DropListModel(name: "Entrepreneur", id: "29"));
  list.add(DropListModel(name: "Software Developer", id: "30"));
  list.add(DropListModel(name: "Systems Analyst", id: "31"));
  list.add(DropListModel(name: "IT Support Specialist", id: "32"));
  list.add(DropListModel(name: "Network Administrator", id: "33"));
  list.add(DropListModel(name: "Data Scientist", id: "34"));
  list.add(DropListModel(name: "Cybersecurity Analyst", id: "35"));
  list.add(DropListModel(name: "Mechanical Engineer", id: "36"));
  list.add(DropListModel(name: "Electrical Engineer", id: "37"));
  list.add(DropListModel(name: "Civil Engineer", id: "38"));
  list.add(DropListModel(name: "Aerospace Engineer", id: "39"));
  list.add(DropListModel(name: "Graphic Designer", id: "40"));
  list.add(DropListModel(name: "Photographer", id: "41"));
  list.add(DropListModel(name: "Musician", id: "42"));
  list.add(DropListModel(name: "Actor", id: "43"));
  list.add(DropListModel(name: "Writer", id: "44"));
  list.add(DropListModel(name: "Artist", id: "45"));
  list.add(DropListModel(name: "Fashion Designer", id: "46"));
  list.add(DropListModel(name: "Film Director", id: "47"));
  list.add(DropListModel(name: "Producer", id: "48"));
  list.add(DropListModel(name: "Choreographer", id: "49"));
  list.add(DropListModel(name: "Biologist", id: "50"));
  list.add(DropListModel(name: "Chemist", id: "51"));
  list.add(DropListModel(name: "Physicist", id: "52"));
  list.add(DropListModel(name: "Environmental Scientist", id: "53"));
  list.add(DropListModel(name: "Research Scientist", id: "54"));
  list.add(DropListModel(name: "Geologist", id: "55"));
  list.add(DropListModel(name: "Astronomer", id: "56"));
  list.add(DropListModel(name: "Anthropologist", id: "57"));
  list.add(DropListModel(name: "Sociologist", id: "58"));
  list.add(DropListModel(name: "Archeologist", id: "59"));
  list.add(DropListModel(name: "Lawyer", id: "60"));
  list.add(DropListModel(name: "Police Officer", id: "61"));
  list.add(DropListModel(name: "Firefighter", id: "62"));
  list.add(DropListModel(name: "Judge", id: "63"));
  list.add(DropListModel(name: "Legal Assistant", id: "64"));
  list.add(DropListModel(name: "Paralegal", id: "65"));
  list.add(DropListModel(name: "Correctional Officer", id: "66"));
  list.add(DropListModel(name: "Security Guard", id: "67"));
  list.add(DropListModel(name: "Detective", id: "68"));
  list.add(DropListModel(name: "Probation Officer", id: "69"));
  list.add(DropListModel(name: "Electrician", id: "70"));
  list.add(DropListModel(name: "Plumber", id: "71"));
  list.add(DropListModel(name: "Carpenter", id: "72"));
  list.add(DropListModel(name: "Mechanic", id: "73"));
  list.add(DropListModel(name: "Welder", id: "74"));
  list.add(DropListModel(name: "Construction Worker", id: "75"));
  list.add(DropListModel(name: "HVAC Technician", id: "76"));
  list.add(DropListModel(name: "Landscaper", id: "77"));
  list.add(DropListModel(name: "Machinist", id: "78"));
  list.add(DropListModel(name: "Painter", id: "79"));
  list.add(DropListModel(name: "Chef", id: "80"));
  list.add(DropListModel(name: "Waiter/Waitress", id: "81"));
  list.add(DropListModel(name: "Hotel Manager", id: "82"));
  list.add(DropListModel(name: "Event Planner", id: "83"));
  list.add(DropListModel(name: "Travel Agent", id: "84"));
  list.add(DropListModel(name: "Customer Service Representative", id: "85"));
  list.add(DropListModel(name: "Bartender", id: "86"));
  list.add(DropListModel(name: "Housekeeper", id: "87"));
  list.add(DropListModel(name: "Tour Guide", id: "88"));
  list.add(DropListModel(name: "Receptionist", id: "89"));
  list.add(DropListModel(name: "Truck Driver", id: "90"));
  list.add(DropListModel(name: "Pilot", id: "91"));
  list.add(DropListModel(name: "Ship Captain", id: "92"));
  list.add(DropListModel(name: "Bus Driver", id: "93"));
  list.add(DropListModel(name: "Train Conductor", id: "94"));
  list.add(DropListModel(name: "Logistics Manager", id: "95"));
  list.add(DropListModel(name: "Warehouse Worker", id: "96"));
  list.add(DropListModel(name: "Delivery Driver", id: "97"));
  list.add(DropListModel(name: "Forklift Operator", id: "98"));
  list.add(DropListModel(name: "Taxi Driver", id: "99"));
  list.add(DropListModel(name: "Journalist", id: "100"));
  list.add(DropListModel(name: "Public Relations Specialist", id: "101"));
  list.add(DropListModel(name: "Editor", id: "102"));
  list.add(DropListModel(name: "News Anchor", id: "103"));
  list.add(DropListModel(name: "Radio Host", id: "104"));
  list.add(DropListModel(name: "Social Media Manager", id: "105"));
  list.add(DropListModel(name: "Content Creator", id: "106"));
  list.add(DropListModel(name: "Translator", id: "107"));
  list.add(DropListModel(name: "Public Speaker", id: "108"));
  list.add(DropListModel(name: "Advertising Manager", id: "109"));

  return list;
}

void printLog(dynamic msg) {
  _printLog('\x1B[32m() => ${msg.toString()}\x1B[0m');
}

void _printLog(dynamic msg) {
  if (kDebugMode) {
    log(msg.toString()) ;
    //debugPrint(msg.toString());
  }
}

void blocLog({required String msg, required String bloc}) {
  _printLog("\x1B[31m${bloc.toString()} ::==> ${msg.toString()}\x1B[0m");
}

String getRandomId({required String text}) {
  String cleanString = text.replaceAll(RegExp(r'[^\w\s]'), '');
  String acronym = cleanString
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map((word) => word[0])
      .join('');
  String randomNumber = "${math.Random().nextInt(90000) + 10000}";
  return acronym + randomNumber.toString();
}
