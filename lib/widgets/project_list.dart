import 'package:flutter/material.dart';

import '../dummy/projects.dart';
import '../utils/style.dart';
import 'add_call_to_action.dart';
import 'project_card.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double deviceScreen = MediaQuery.of(context).size.width;
    const double cardHeight = 220;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppStyle.horizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Projects", style: AppStyle.titleStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("You have", style: AppStyle.subTitleStyle),
                      const SizedBox(width: 2),
                      Text(
                        "${projects.length}",
                        style: const TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                      const SizedBox(width: 2),
                      Text("projects", style: AppStyle.subTitleStyle),
                    ],
                  ),
                ],
              ),
              AddCallToAction(
                label: "Add",
                handler: () {},
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: cardHeight,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
                horizontal: AppStyle.horizontalPadding),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: deviceScreen * 0.75,
              maxCrossAxisExtent: cardHeight,
              mainAxisSpacing: 13,
            ),
            itemCount: projects.length,
            itemBuilder: (ctx, index) => ProjectCard(projects[index]),
          ),
        ),
      ],
    );
  }
}
