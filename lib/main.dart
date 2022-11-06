import 'package:flutter/material.dart';
import 'screens/project_viewer.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Manager',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        // ProjectEditor.routeName: ((context) => const ProjectEditor()),
        ProjectViewer.routeName: ((context) => const ProjectViewer()),
      },
    );
  }
}
