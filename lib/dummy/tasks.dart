import '../models/task_item.dart';
import 'team_members.dart';

final List<TaskItem> tasks = [
  TaskItem(
    id: 1,
    projectId: 1,
    title: "Task 1 - Project 1",
    status: TaskStatus.closed,
    assignees: [teamMembers[0], teamMembers[1]],
  ),
  TaskItem(
    id: 2,
    projectId: 1,
    title: "Task 2 - Project 1",
    status: TaskStatus.open,
    assignees: [teamMembers[1], teamMembers[3]],
  ),
  TaskItem(
    id: 3,
    projectId: 1,
    title: "Task 3 - Project 1",
    status: TaskStatus.open,
    assignees: [teamMembers[1], teamMembers[3]],
  ),
  TaskItem(
    id: 4,
    projectId: 1,
    title: "Task 4 - Project 1",
    status: TaskStatus.open,
    assignees: [teamMembers[1], teamMembers[3]],
  ),
  TaskItem(
    id: 5,
    projectId: 2,
    title: "Task 1 - Project 2",
    status: TaskStatus.open,
    assignees: [teamMembers[2], teamMembers[7]],
  ),
  TaskItem(
    id: 6,
    projectId: 2,
    title: "Task 2 - Project 2",
    status: TaskStatus.closed,
    assignees: [teamMembers[8], teamMembers[0], teamMembers[5]],
  ),
  TaskItem(
    id: 7,
    projectId: 2,
    title: "Task 3 - Project 2",
    status: TaskStatus.closed,
    assignees: [teamMembers[6], teamMembers[4]],
  ),
  TaskItem(
    id: 8,
    projectId: 2,
    title: "Task 4 - Project 2",
    status: TaskStatus.closed,
    assignees: [teamMembers[6], teamMembers[4]],
  ),
  TaskItem(
    id: 9,
    projectId: 2,
    title: "Task 5 - Project 2",
    status: TaskStatus.open,
    assignees: [teamMembers[6], teamMembers[4]],
  ),
  TaskItem(
    id: 10,
    projectId: 2,
    title: "Task 6 - Project 2",
    status: TaskStatus.archived,
    assignees: [teamMembers[6], teamMembers[4]],
  ),
];
