import 'package:flutter/material.dart';
import 'package:project_manager/widgets/stacked_member_avatars.dart';
import '../screens/project_viewer.dart';
import '../utils/helpers.dart';

import '../models/project_item.dart';
import '../utils/style.dart';
import 'progress_bar.dart';

class ProjectCard extends StatelessWidget {
  final ProjectItem project;

  const ProjectCard(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final double deviceScreen = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ProjectViewer.routeName,
            arguments: {"project": project});
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 24),
        decoration: BoxDecoration(
          // color: Colors.blue.withOpacity(.5),
          // image: DecorationImage(
          //   image: AssetImage("assets/images/bg_transparent_2.png"),
          //   fit: BoxFit.fill
          // ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [project.bgColor, project.bgColor.withOpacity(.7)],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    project.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.more_horiz_outlined, color: Colors.white),
                  ),
                )
              ],
            ),
            ProgressBar(computeProgression(project.id)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: StackedMemberAvatars(
                        maxToSHow: project.members.length)),
                Icon(Icons.calendar_month_outlined, color: AppStyle.white7),
                const SizedBox(width: 10),
                Text("Dec 25", style: TextStyle(color: AppStyle.white7))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
