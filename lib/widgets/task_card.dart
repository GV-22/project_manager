import 'package:flutter/material.dart';
import '../dummy/projects.dart';
import '../models/task_item.dart';

class TaskCard extends StatelessWidget {
  final TaskItem task;
  const TaskCard(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProject = projects.singleWhere((p) => p.id == task.projectId);
    return Card(
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // top section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: task.status == TaskStatus.closed
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      taskProject.title,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                task.status == TaskStatus.closed
                    ? const Icon(Icons.check_circle, color: Colors.blue)
                    : const Icon(Icons.circle_outlined, color: Colors.grey)
              ],
            ),
            const SizedBox(height: 5),
            const Divider(),
            const SizedBox(height: 5),
            // bottom section
            Row(
              children: const [
                Text(
                  "Today 10:00 PM - 11:45 PM",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
