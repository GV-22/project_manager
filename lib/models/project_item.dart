import 'package:flutter/material.dart';

import 'team_member.dart';

class ProjectItem {
  final int id;
  String title;

  List<TeamMember> members;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? deadLine;
  Color bgColor;

  ProjectItem({
    required this.id,
    required this.title,
    required this.members,
    required this.bgColor,
    this.startTime,
    this.endTime,
    this.deadLine,
  });

  void updateTitle(String title) {
    this.title = title;
  }

  void updateStartTime(DateTime startTime) {
    this.startTime = startTime;
  }

  void updateEndTime(DateTime endTime) {
    this.endTime = endTime;
  }

  void updateDeadLine(DateTime deadLine) {
    this.deadLine = deadLine;
  }

  void updateMembers(List<TeamMember> members) {
    this.members = members;
  }

  void updateBgColor(Color bgColor) {
    this.bgColor = bgColor;
  }
}
