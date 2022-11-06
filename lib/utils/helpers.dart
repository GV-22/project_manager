import '../dummy/tasks.dart';
import '../models/task_item.dart';

int computeProgression(int projectId) {
  int progression = 0;

  final projectTasks = tasksOf(projectId);

  if (projectTasks.isEmpty) return progression;

  final closedTasks =
      projectTasks.where((element) => element.status == TaskStatus.closed);

  progression = ((closedTasks.length / projectTasks.length) * 100).toInt();

  return progression;
}

List<TaskItem> tasksOf(int projectId) {
  return tasks.where((task) => task.projectId == projectId).toList();
}
