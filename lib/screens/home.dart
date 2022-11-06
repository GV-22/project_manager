import 'package:flutter/material.dart';
import '../widgets/add_call_to_action.dart';
import '../dummy/tasks.dart';
import '../utils/style.dart';
import '../widgets/categorized_tasks.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/project_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Colors.grey.withOpacity(0.2);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppStyle.horizontalPadding),
                child: HomeTopBar(),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppStyle.horizontalPadding,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: borderColor),
                    ),
                    enabled: false,
                    prefixIcon:
                        Icon(Icons.search, size: 30, color: borderColor),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const ProjectList(),
              const SizedBox(height: 20),
              Container(
                // color: Colors.grey.withOpacity(.1),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyle.horizontalPadding),
                child: Row(
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
              ),
              const SizedBox(height: 35),
              Expanded(
                child: Container(
                  // color: Colors.grey.withOpacity(.1),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppStyle.horizontalPadding),
                  child: CategorizedTasks(tasks),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
