import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2_flutter/screens/components/task_options.dart';

import '../constants/colors.dart';
import '../providers/task_provider.dart';
import 'components/custom_app_bar.dart';
import 'components/list_view_button.dart';
import 'components/personal_profile.dart';
import 'components/pinned_task.dart';
import 'components/progress_indicator.dart';

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
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskProvider.tasks[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: ColorApp.container,
                      ),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 15),
                        title: Text(
                          task.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: ColorApp.primaryColor,
                          ),
                        ),
                        subtitle: Text(
                          '${task.todos.length} tasks',
                          style: const TextStyle(
                            fontSize: 14,
                            color: ColorApp.secondaryColor,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const MyProgressIndicator(),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return TaskOptions(
                                        onPinPressed: () {
                                          taskProvider.pinTask(task);
                                          Navigator.pop(context);
                                        },
                                        onDeletePressed: () {
                                          taskProvider.deleteTask(task);
                                          Navigator.pop(context);
                                        },
                                      );
                                    });
                              },
                              child: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
