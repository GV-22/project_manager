import 'package:flutter/material.dart';
import 'package:project_manager/widgets/stacked_member_avatars.dart';
import '../models/project_item.dart';
import '../models/task_item.dart';
import '../utils/helpers.dart';
import '../utils/style.dart';
import '../widgets/add_call_to_action.dart';
import '../widgets/categorized_tasks.dart';
import '../widgets/progress_bar.dart';

class ProjectViewer extends StatelessWidget {
  static const String routeName = "/project-viewer";
  const ProjectViewer({Key? key}) : super(key: key);

  // ProjectItem? project;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, ProjectItem>;
    if (routeArgs["project"] == null) {
      throw "Missing project";
    }

    final ProjectItem project = routeArgs["project"]!;

    final List<TaskItem> _tasks = tasksOf(project.id);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 24, top: 70),
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage("assets/images/bg_transparent_2.png"),
                  //   fit: BoxFit.cover,
                  // ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [project.bgColor, project.bgColor.withOpacity(.7)],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(Icons.arrow_back_ios_new,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            _CircularActionBtn(
                              icon: Icons.calendar_month_outlined,
                              handler: () {},
                            ),
                            const SizedBox(width: 14),
                            _CircularActionBtn(icon: Icons.edit, handler: () {})
                          ],
                        ),
                      ],
                    ),
                    LayoutBuilder(
                      builder: ((context, constraints) => SizedBox(
                            width: constraints.constrainWidth() * 0.7,
                            child: Text(
                              project.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),
                    ),
                    ProgressBar(computeProgression(project.id)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Members", style: AppStyle.smallWhiteTextStyle),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Expanded(
                                child: StackedMemberAvatars(maxToSHow: 6)),
                            const SizedBox(width: 24),
                            Container(
                              width: 40,
                              height: 40,
                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    project.bgColor.withOpacity(.1),
                                    project.bgColor,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(Icons.add,
                                  color: Colors.white, size: 18),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.grey.withOpacity(.1),
                padding: const EdgeInsets.only(
                  top: AppStyle.horizontalPadding,
                  left: AppStyle.horizontalPadding,
                  right: AppStyle.horizontalPadding,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today's tasks", style: AppStyle.titleStyle),
                            Text("Wednesday, 11 May",
                                style: AppStyle.subTitleStyle),
                          ],
                        ),
                        AddCallToAction(label: "New Task", handler: () {}),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Expanded(child: CategorizedTasks(_tasks))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircularActionBtn extends StatelessWidget {
  final IconData icon;
  final Function handler;

  const _CircularActionBtn(
      {required this.icon, required this.handler, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 35;
    return InkWell(
      onTap: () => handler(),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white.withOpacity(.1)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: Icon(icon, size: size - 20, color: Colors.white)),
      ),
    );
  }
}
