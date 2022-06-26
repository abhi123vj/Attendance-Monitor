import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import 'package:intl/intl.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_image_strings.dart';

class AppFormField extends StatefulWidget {
  final String? hintText;
  final List? list;
  final String type;
  final TextEditingController controller;
  final bool isReadOnly;
  final int maxLines;
  final int index;
  final double height;
  final Function()? markPresent;
  final Function()? markAbsent;
  final Function(int val)? onValChange;

  final Color borderColor;
  const AppFormField({
    this.index = 0,
    this.hintText,
    this.borderColor = AppColors.yellowPale,
    this.type = 'Normal',
    Key? key,
    required this.controller,
    this.list,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.height = 60,
    this.markPresent,
    this.markAbsent,
    this.onValChange,
  }) : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "Normal":
        return normalTextField();
      case 'DropDown':
        return dropDownTextField();
      case "Mark":
        return markerTextField();
      case "Number":
        return normalTextField(isNumbers: true);
      case "phone":
        return normalTextField(isphone: true);
      case "password":
        return normalTextField(isPassword: true);
      case "email":
        return normalTextField(isEmail: true);
      default:
        return normalTextField();
    }
  }

  Material normalTextField(
      {isEmail = false,
      isPassword = false,
      isphone = false,
      isNumbers = false}) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        width: 100.w,
        height: widget.height,
        decoration: BoxDecoration(
          color: AppColors.accentYellow,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.only(
          left: 20,
        ),
        alignment: Alignment.centerLeft,
        child: TextFormField(
          style: Theme.of(context).textTheme.subtitle1,
          controller: widget.controller,
          readOnly: widget.isReadOnly,
          maxLines: widget.maxLines,
          keyboardType: isphone
              ? TextInputType.phone
              : isEmail
                  ? TextInputType.emailAddress
                  : isNumbers
                      ? TextInputType.number
                      : TextInputType.text,
          obscureText: isPassword,
          textCapitalization: !isEmail && !isPassword && !isphone && !isNumbers
              ? TextCapitalization.words
              : TextCapitalization.none,
          inputFormatters: isphone
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10)
                ]
              : isPassword
                  ? []
                  : isNumbers
                      ? [
                          FilteringTextInputFormatter.digitsOnly,
                        ]
                      : [FilteringTextInputFormatter.singleLineFormatter],
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintStyle: Theme.of(context)
                  .textTheme
                  .subtitle2
                  ?.copyWith(color: AppColors.bgBlack.withOpacity(.7)),
              hintText: widget.hintText),
        ),
      ),
    );
  }

  Container markerTextField(
      {isEmail = false,
      isPassword = false,
      isphone = false,
      isNumbers = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 10.w, right: 10.w),
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        border: Border.all(color: widget.borderColor, width: 1),
      ),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text("${widget.index + 1}. ",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500)),
                Expanded(
                  child: Text(widget.hintText.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: widget.markPresent,
              icon: Icon(
                Icons.check,
                color: AppColors.cyanNormal,
              )),
          IconButton(
              onPressed: widget.markAbsent,
              icon: Icon(
                Icons.close,
                color: AppColors.redDark,
              ))
        ],
      ),
    );
  }

  Container datePickerTextField(context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: 100.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        border: Border.all(color: AppColors.cyanLight, width: 1),
      ),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              readOnly: true,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  hintText: widget.hintText),
            ),
          ),
          IconButton(
            onPressed: () {
              _showMyDialog(context);
            },
            icon: SizedBox(
              height: 40,
              // child: Image.asset(
              //   AppImages.calenderIcon,
              //   fit: BoxFit.fitHeight,
              // ),
            ),
          ),
        ],
      ),
    );
  }

  Stack dropDownTextField() {
    return Stack(
      children: [
        Material(
          elevation: 2,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: 100.w,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.accentYellow,
            ),
            padding: const EdgeInsets.only(
              left: 20,
            ),
            alignment: Alignment.centerLeft,
            child: TextFormField(
              
              onChanged: (val) {
                print("Val is $val");
              },
              controller: widget.controller,
              readOnly: true,
              maxLines: null,
              decoration: InputDecoration(
                
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: AppColors.bgBlack.withOpacity(.7)),
                  hintText: '-- Select ${widget.hintText} --'),
            ),
          ),
        ),
        Opacity(
          opacity: 0,
          child: DropdownButton<String>(
            underline: null,
            dropdownColor: AppColors.bgBlack,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            isExpanded: true,
            items: widget.list?.cast<String>().map((value) {
              return DropdownMenuItem(

                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: value == widget.controller.text
                          ? AppColors.accentYellow
                          : AppColors.white),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              log(newValue.toString());            
              setState(() {
                log(newValue.toString());
                widget.controller.text = newValue!;
              });
            },
          ),
        ),
      ],
    );
  }

  // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   //  print("Seleted date $args");
  // }

  // void _displayValue(DateTime value) {
  //   setState(() {
  //     widget.controller.text = DateFormat('dd-MM-yyyy').format(value);
  //   });
  //   //  print("controller = ${widget.controller.text}");
  // }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            width: 100.w,
            height: 40.h,
            // child: SfDateRangePicker(
            //   showNavigationArrow: true,
            //   minDate: DateTime.tryParse('01-01-1900'),
            //   maxDate: DateTime.now(),
            //   onSelectionChanged: _onSelectionChanged,
            //   view: DateRangePickerView.decade,
            //   selectionMode: DateRangePickerSelectionMode.single,
            //   showActionButtons: true,
            //   onCancel: () {
            //     Navigator.pop(context);
            //   },
            //   onSubmit: (value) {
            //     _displayValue(DateTime.parse(value.toString()));
            //     Navigator.pop(context);
            //   },
            // ),
            child: Container(),
          ),
        );
      },
    );
  }
}
