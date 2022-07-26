

import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AttendanceDisplay extends StatelessWidget {
   AttendanceDisplay({Key? key}) : super(key: key);
   List<String> sub= [
    'Maths', 'CSA','Wireless', 'MC', 'Phyton', 'SPM'
    ];
     final _subController = TextEditingController();
     List<Widget> _buildCells(int count) {
  return List.generate(
    count,
    (index) => Container(
      alignment: Alignment.center,
      width: 120.0,
      height: 60.0,
      color: Colors.white,
      margin: EdgeInsets.all(4.0),
      child: Text("${index + 1}",),
    ),
  );
}

List<Widget> _buildRows(int count) {
  return List.generate(
    count,
    (index) => Row(
      children: _buildCells(10),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Class Name",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
               padding:  EdgeInsets.all(2.h),
               child: AppFormField(
                          type: "DropDown",
                          hintText: "Branch",
                          list: sub,
                          controller: _subController),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: 
              _buildCells(20),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildRows(20),
                ),
              ),
            )
          ],
        ),
          ),
        )
          ]),
      ) 
    );
  }
}