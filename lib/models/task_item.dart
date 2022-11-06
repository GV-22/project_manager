import 'team_member.dart';

enum TaskStatus { all, open, closed, archived }

class TaskItem {
  final int id;
  final int projectId;
  String title;
  TaskStatus status;
  List<TeamMember> assignees;

  TaskItem({
    required this.id,
    required this.projectId,
    required this.title,
    required this.status,
    required this.assignees,
  });

  void updateTitle(String title) {
    this.title = title;
  }

  void updateStatus(TaskStatus status) {
    this.status = status;
  }

  void updateAssignees(List<TeamMember> assignees) {
    this.assignees = assignees;
  }
}
