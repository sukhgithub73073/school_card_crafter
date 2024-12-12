import 'package:card_craft/src/core/app_assets.dart';
import 'package:card_craft/src/core/app_colors.dart';
import 'package:card_craft/src/core/app_image_view.dart';
import 'package:card_craft/src/core/app_text_style.dart';
import 'package:card_craft/src/core/common_space.dart';
import 'package:card_craft/src/core/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_craft/src/extension/app_extension.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: colorWhite,
      body: ListView(
        children: [
          Stack(
            children: [
              ImageView(
                  url: AppAssets.topRound,
                  width: double.maxFinite,
                  height: 150.h,
                  fit: BoxFit.fill),
              ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: colorSecendry, width: 3.w),
                          color: colorWhite,
                          shape: BoxShape.circle),
                      child: Center(
                        child: ImageView(
                          margin: EdgeInsets.all(20.w),
                          url: AppAssets.logo,
                          imageType: ImageType.asset,
                        ),
                      ),
                    ),
                    spaceVertical(space: 20.h),
                    TextView(
                      text: "welcomeDescription",
                      color: colorWhite,
                      textSize: 13.sp,
                      textAlign: TextAlign.left,
                      style: AppTextStyleEnum.small,
                      fontFamily: Family.regular,
                      lineHeight: 1.3,
                    ),
                    spaceVertical(space: 20.h),

                    // Adding the "About Us" description
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: "About Us",
                            color: colorPrimary,
                            textSize: 20.sp,
                            textAlign: TextAlign.left,
                            style: AppTextStyleEnum.title,
                            fontFamily: Family.bold,
                          ),
                          spaceVertical(space: 10.h),
                          SizedBox(height: 10.h),
                          Text(
                            "Welcome to School Club, your comprehensive school management solution designed to simplify and streamline the administration of educational institutions. Our platform offers a robust and user-friendly interface that enables schools to manage all their data effectively, from staff and students to classes and subjects.",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Our Mission",
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "At School Club, we aim to revolutionize the way schools operate by providing a centralized system that caters to all their administrative needs. Our mission is to create a seamless and efficient environment where educators can focus more on teaching and less on administrative tasks.",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Key Features",
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "• Staff Management: Easily manage staff details, designations, and roles. Track attendance, leave applications, and performance metrics to ensure smooth operations.\n"
                                "• Student Management: Maintain comprehensive student records, including personal details, academic history, attendance, and performance. Our system also facilitates easy communication between teachers and parents.\n"
                                "• Class Management: Organize and manage class schedules, assign teachers, and monitor student progress. Create a well-structured timetable that minimizes conflicts and maximizes learning opportunities.\n"
                                "• Subject Management: Keep track of all subjects taught in the school. Assign teachers to subjects and manage lesson plans and curriculum efficiently.\n"
                                "• Attendance Tracking: Monitor and record attendance for both students and staff. Generate reports to identify patterns and address attendance issues promptly.\n"
                                "• Exams and Results: Conduct exams seamlessly and manage results with ease. Our platform supports various exam formats and provides detailed analytics on student performance.\n"
                                "• Timetable Creation: Generate and manage school timetables effortlessly. Ensure optimal utilization of resources and avoid scheduling conflicts.\n"
                                "• Library Management: Keep track of library books, issue and return records, and manage subscriptions. Our system helps in maintaining an organized and efficient library.\n"
                                "• Transport Management: Manage school transportation effectively. Track bus routes, schedules, and student transport details to ensure safety and punctuality.\n"
                                "• Hostel Management: Efficiently manage hostel accommodations, including room assignments, attendance, and student records.\n"
                                "• Parent-Teacher Communication: Enhance communication between parents and teachers. Share important updates, progress reports, and event notifications easily.\n"
                                "• Complaints and Feedback: Manage and address complaints and feedback from students, parents, and staff. Ensure a positive and responsive school environment.",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Why Choose School Club?",
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "• User-Friendly Interface: Our intuitive design ensures that all users, regardless of their technical proficiency, can navigate and utilize the platform effectively.\n"
                                "• Comprehensive Solution: School Club offers a one-stop solution for all school management needs, reducing the need for multiple systems and software.\n"
                                "• Secure and Reliable: We prioritize the security of your data with robust encryption and regular backups. Rest assured, your information is safe with us.\n"
                                "• Customizable and Scalable: Whether you're a small school or a large institution, our platform can be customized to meet your specific requirements and scale as you grow.\n"
                                "• Dedicated Support: Our team is always ready to assist you with any issues or questions. We provide ongoing support to ensure you get the most out of School Club.",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "Join Us Today",
                            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Experience the future of school management with School Club. Join countless educational institutions that have already transformed their operations and enhanced their productivity with our innovative platform. Together, let's create an efficient, organized, and thriving educational environment for everyone.",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ]),

              Positioned(
                top: 5.h,
                left: 5.w,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(color: colorWhite, Icons.arrow_back),
                      onPressed: () {
                        context.back();
                      },
                    ),
                    TextView(
                      text: "aboutUs",
                      color: colorWhite,
                      textSize: 16.sp,
                      textAlign: TextAlign.center,
                      style: AppTextStyleEnum.medium,
                      fontFamily: Family.medium,
                      lineHeight: 1.3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
