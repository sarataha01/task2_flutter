import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';
import 'components/custom_app_bar.dart';
import 'components/list_view_button.dart';
import 'components/my_todo_list_view.dart';
import 'components/personal_profile.dart';
import 'components/pinned_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      return Scaffold(
        appBar: const MyAppBar(
          text: "ToDo",
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const PersonalProfile(),
            const SizedBox(
              height: 30,
            ),
            PinnedTask(pinnedTask: taskProvider.pinnedTask),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: MyAddButton(),
            ),
            const MyListView(),
          ],
        ),
      );
    });
  }
}
