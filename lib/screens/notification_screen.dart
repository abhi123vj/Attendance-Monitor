import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/suject_controller.dart';
import '../models/notification_model.dart';
import '../models/syllabus_res.dart';

class NotifyScreen extends StatefulWidget {
   NotifyScreen({Key? key}) : super(key: key);

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
 late ExpandedTileController _controller;

  void initState() {
    // initialize controller
    _controller = ExpandedTileController(isExpanded:true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SubjectController subC = Get.put(SubjectController());
    final _searchKey = TextEditingController();
    Timer? searchOnStoppedTyping;
subC.getNotification();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextFormField(
                style: Theme.of(context).textTheme.subtitle1,
                controller: _searchKey,
                maxLines: 1,
                onChanged: (str) {
                  const duration = Duration(milliseconds: 800);
                  if (searchOnStoppedTyping != null) {
                    searchOnStoppedTyping?.cancel();
                  }
                  searchOnStoppedTyping = Timer(duration, () {
                    if (subC.searchKey.value != str.trim()) {
                      subC.searchKey.value = str.trim();
                      subC.getNotification();
                    }
                  });
                },
                decoration: InputDecoration(
                    focusColor: AppColors.cyanDark,
                    prefixIconColor: AppColors.bgWhite,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(color: AppColors.bgBlack.withOpacity(.7)),
                    hintText: "Search.."),
              )),
          Expanded(
              child: Obx(() => subC.isloading.isTrue
                  ? Center(
                      child: LoadingAnimationWidget.dotsTriangle(
                        size: 50,
                        color: AppColors.accentGreen,
                      ),
                    )
                  : subC.notificationList.length == 0
                      ? Center(child: Text("NO Notifications"))
                      : ListView.builder(
                          itemCount: subC.notificationList.length,
                          itemBuilder: ((context, index) {
                            NotificationElement demoNotify =
                                subC.notificationList.elementAt(index);

                            ///! Redesign
                            return ExpandedTile(
                              title: Text("${demoNotify.title} "),
theme: const ExpandedTileThemeData(
              //headerColor: Colors.green,
             // headerRadius: 24.0,
             // headerPadding: EdgeInsets.all(24.0),
              headerSplashColor: AppColors.accentGreen,
              //
              contentBackgroundColor: Colors.white,
              contentPadding: EdgeInsets.all(0.0),
              contentRadius: 12.0,
            ),

                              controller: _controller,
              content: Container(
                color: AppColors.cyanLight,
                child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(DateFormat("dd-MM-yyyy").format(demoNotify.createdAt??DateTime.now())),
                             Text(DateFormat("H:m:s").format(demoNotify.createdAt??DateTime.now())),
                           ],
                         ),
                         Divider(height: 3.h,color: AppColors.white,thickness: 0.3.h,),
                         SizedBox(height: 2.h,),
                        Text("${demoNotify.body}"),
                        SizedBox(height: 2.h,),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Bounce(
                        duration: const Duration(milliseconds: 110),
                        onPressed: () {
                          //subC.deleteNotify(index);
                        },
                        child: Container(
                            
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10
                              ),
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text(
                             "Remove",
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      color: AppColors.redDark,
                                    ),
                              ),
                            ))
                          ],
                        )
                        
                       
                      ],
                    ),
                  ),
                ),
              ),
               onTap: () {
            
          },
                              
                              
                              
                              
                              
                              
                              
                              
                             
                                
                                
                                
                                
                                
                              //   // Text(
                              //   //     "${demoNotify.title} body =  ${demoNotify.body}  date = ${demoNotify.createdAt} "),
                              // ),
                                                        );
                          }))))
        ],
      ),
    );
  }
}
