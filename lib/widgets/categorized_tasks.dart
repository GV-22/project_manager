import 'package:flutter/material.dart';

import '../models/task_item.dart';
import 'task_card.dart';

class CategorizedTasks extends StatefulWidget {
  final List<TaskItem> tasks;
  const CategorizedTasks(this.tasks, {Key? key}) : super(key: key);

  @override
  State<CategorizedTasks> createState() => _CategorizedTasksState();
}

class _CategorizedTasksState extends State<CategorizedTasks> {
  // final List<TaskStatus> _categories = [
  //   TaskStatus.all,
  //   TaskStatus.open,
  //   TaskStatus.closed,
  //   TaskStatus.archived,
  // ];

  TaskStatus _currentCategory = TaskStatus.all;

  @override
  Widget build(BuildContext context) {
    List<TaskItem> _tasks = [];
    if (_currentCategory == TaskStatus.all) {
      _tasks = widget.tasks;
    } else {
      _tasks = widget.tasks
          .where((task) => task.status == _currentCategory)
          .toList();
    }

    return Column(
      children: [
        SizedBox(
            height: 20,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabBtn(TaskStatus.all),
                _buildTabBtn(TaskStatus.open),
                _buildTabBtn(TaskStatus.closed),
                _buildTabBtn(TaskStatus.archived),
              ],
            )

            // LayoutBuilder(
            //   builder: ((context, constraints) {
            //     final tabWidth =
            //         constraints.constrainWidth() / _categories.length;
            //     return ListView.builder(
            //       itemCount: _categories.length,
            //       scrollDirection: Axis.horizontal,
            //       itemExtent: tabWidth,
            //       itemBuilder: (BuildContext context, int index) {
            //         final category = _categories[index];
            //         final count = category == TaskStatus.all
            //             ? widget.tasks.length
            //             : widget.tasks
            //                 .where((task) => task.status == category)
            //                 .length;

            //         // print("count $count");

            //         return _buildTabBtn(category, count);
            //       },
            //     );
            //   }),
            // ),
            ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: _tasks.length,
            padding: const EdgeInsets.only(bottom: 15, top: 5),
            itemBuilder: (BuildContext context, int index) {
              return TaskCard(_tasks[index]);
            },
          ),
        )
      ],
    );
  }

  Widget _buildTabBtn(
    TaskStatus category,
  ) {
    int tasksCount = category == TaskStatus.all
        ? widget.tasks.length
        : widget.tasks.where((task) => task.status == category).length;
    return InkWell(
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      child: Container(
        // color: Colors.red,
        padding: EdgeInsets.only(right: category == TaskStatus.all ? 30 : 0),
        decoration: category == TaskStatus.all
            ? const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey)),
              )
            : null,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              _getCategoryLabel(category),
              style: TextStyle(
                color: _currentCategory == category ? Colors.blue : Colors.grey,
              ),
            ),
            const SizedBox(width: 5),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: _currentCategory == category
                    ? Colors.blue
                    : Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                "$tasksCount",
                style: const TextStyle(color: Colors.white, fontSize: 9),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        setState(() => _currentCategory = category);
      },
    );
  }

  String _getCategoryLabel(TaskStatus category) {
    switch (category) {
      case TaskStatus.all:
        return 'All';
      case TaskStatus.open:
        return 'Open';
      case TaskStatus.closed:
        return 'Closed';
      case TaskStatus.archived:
        return 'Archived';

      default:
        throw StateError('Unknown task status provide $category');
    }
  }
}
