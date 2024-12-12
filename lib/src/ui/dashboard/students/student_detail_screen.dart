import 'package:flutter/material.dart';
import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/data/models/students_model.dart';
import 'package:card_craft/src/data/network/http_service.dart';
import 'package:intl/intl.dart';

class StudentDetailScreen extends StatefulWidget {
  final Datum student;

  StudentDetailScreen({required this.student});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [

                  (widget.student.image) !=
                      ""
                      ? CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        "${ApisEndpoints.imagesPathStudent}${widget.student.image}"),
                  )
                      : CircleAvatar(
                    radius: 100,
                    backgroundImage:
                    AssetImage(AppAssets.logo),
                  ) ,


                  SizedBox(height: 10),
                  Text(
                    widget.student.name ?? "",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionHeader('Personal Information'),
            _buildInfoTable([
              //['Date of Birth', DateFormat('dd-MM-yyyy').format(widget.student.dob.toLocal())],
              // ['Gender', widget.student.gender ?? ""],
              ['Mobile No', widget.student.mobileNo ?? ""],
              // ['Alternate Mobile No', widget.student.alternateMobileNo ?? ""],
              // ['Aadhaar Number', widget.student.ad ?? ""],
              // ['Religion', widget.student.religion ?? ""],
            ]),
            _buildSectionHeader('Parent Information'),
            _buildInfoTable([
              ['Father\'s Name', widget.student.father ?? ""],
              // ['Father\'s Occupation', widget.student.fatherOccupation ?? ""],
              // [
              //   'Father\'s Qualification',
              //   widget.student.fatherQualification ?? ""
              // ],
              ['Mother\'s Name', widget.student.mother ?? ""],
              // ['Mother\'s Occupation', widget.student.motherOccupation ?? ""],
              // [
              //   'Mother\'s Qualification',
              //   widget.student.motherQualification ?? ""
              // ],
            ]),
            _buildSectionHeader('Guardian Information'),
            _buildInfoTable([
              // ['Guardian Name', widget.student.guardian.guardianName ?? ""],
              // ['Guardian Mobile', widget.student.guardian.guardianMobile ?? ""],
              // [
              //   'Guardian Alternate Mobile',
              //   widget.student.guardian.guardianAlternateMobile ?? ""
              // ],
              // [
              //   'Relationship with Student',
              //   widget.student.guardian.relationshipWithStudent ?? ""
              // ],

            ]),
            _buildSectionHeader('Academic Details'),
            _buildInfoTable([
              // ['Group', widget.student.finalClassGroupName ?? ""],
              // ['Class', widget.student.finalClassName ?? ""],
              // ['Previous School', widget.student.previousSchool ?? ""],
              // ['Last Academic Result', widget.student.details.academicYear ?? ""],
              ['Obtained Marks', 'N/A'],
              ['Attended Days', 'N/A'],
            ]),
            _buildSectionHeader('Health Details'),
            _buildInfoTable([
              // ['Blood Group', widget.student.details.studentBloodGroup ?? ""],
              // ['Weight', '${widget.student.details.studentWeight ?? ""} kg'],
              // ['Height', '${widget.student.details.studentHeight ?? ""} cm'],
              // [
              //   'Disability Status',
              //   widget.student.details.disabilityStatus == 0 ? 'No' : 'Yes'
              // ],
              // Uncomment these if data is available
              // ['Disability Type', widget.student.disabilityType ?? ""],
              // ['Disability Percentage', widget.student.disabilityPercentage.toString()],
            ]),
            _buildSectionHeader('Contact Details'),
            _buildInfoTable([
              ['Pin Code', widget.student.pinCode ?? ""],
              // ['State', widget.student.state ?? ""],
              ['District', widget.student.district ?? ""],
              ['Tehsil', widget.student.tehsil ?? ""],
              ['Village/Mohalla', widget.student.villageOrMohalla ?? ""],
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }

  Widget _buildInfoTable(List<List<String>> data) {
    return Table(
      columnWidths: {
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
      },
      border: TableBorder.all(color: Colors.grey),
      children: data.map((row) {
        return TableRow(
          children: row.map((cell) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cell,
                style: TextStyle(fontSize: 16),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
