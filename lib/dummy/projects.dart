import 'package:flutter/material.dart';
import 'team_members.dart';
import '../models/project_item.dart';
import '../utils/style.dart';

final List<ProjectItem> projects = [
  ProjectItem(
    id: 1,
    title: "Duxica Dribble Team",
    bgColor: AppStyle.bluePrimaryColor,
    members: [
      teamMembers[0],
      teamMembers[2],
      teamMembers[5],
      teamMembers[7],
    ],
  ),
  ProjectItem(
    id: 2,
    title: "Crypto Wallet Redesign",
    bgColor: Colors.black,
    members: [
      teamMembers[0],
      teamMembers[1],
    ],
  ),
];


