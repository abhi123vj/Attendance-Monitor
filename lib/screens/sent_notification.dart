import 'package:attendance_montior/constants/app_colors.dart';
import 'package:attendance_montior/screens/widgets/app_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SentNotification extends StatelessWidget {
  SentNotification({Key? key}) : super(key: key);
 final _sendToController = TextEditingController();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Send Notification",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(3.h),
          child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.h,),
             
                    AppFormField(
                        type: "DropDown",
                        list: [
                          "Shijidha",
                          "Nimmmi",
                          "Manu",
                          "Minu",
                          "Shiny",
                          "Raji",
                          "Rekha",
                          "Kannan"
                        ],
                        controller: _sendToController,
                        hintText: 'Send To'),
                    SizedBox(
                      height: 10,
                    ),
                    AppFormField(
                      controller: _titleController,
                      hintText: 'Title',
                      type: 'name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppFormField(
                      controller: _bodyController,
                      hintText: 'Body',
                      type: 'normal',
                    ),
                  
                    SizedBox(
                      height: 5.h,
                    ),
                    ElevatedButton(
                              onPressed: () {
                               
                              },
                              child:Text(
                                      'Send',
                                      style: Theme.of(context).textTheme.button,
                                    ),
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 3.w,horizontal: 8.h),
                                  primary: AppColors.bgBlack,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18)))),
                            )
            ]),
        ),
      ) 
    );
  }
}