import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  bool? isLast;
  Task({this.iconData, this.title, this.bgColor, this.iconColor, this.btnColor, this.left, this.done, this.isLast});

  static List<Task> generateTasks() {
    return [
      Task(iconData: Icons.person_rounded,
          title: 'Personal',
          bgColor: kYellowLight,
          iconColor: kYellowDark,
          btnColor: kYellow,
          left: 3,
          done: 0,
          isLast: false
      ),
      Task(iconData: Icons.cases_rounded,
          title: 'Work',
          bgColor: kRedLight,
          iconColor: kRedDark,
          btnColor: kRed,
          left: 2,
          done: 0,
          isLast: false
      ),
      Task(iconData: Icons.favorite_rounded,
          title: 'Heath',
          bgColor: kBlueLight,
          iconColor: kBlueDark,
          btnColor: kBlue,
          left: 1,
          done: 1,
          isLast: false
      ),
      Task(isLast: true)
    ];
  }
}