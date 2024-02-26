import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task2_flutter/screens/components/task_options.dart';

import '../constants/asset_data.dart';
import '../constants/colors.dart';
import '../providers/task_provider.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SvgPicture.asset(
              AssetData.logoPath,
            ),
          ),
          title: const Text(
            "ToDo",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: ColorApp.secondaryColor,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                AssetData.settingsPath,
                width: 20,
                height: 20,
              ),
            ),
          ],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Tasks",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: ColorApp.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/createTask');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorApp.button,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AssetData.taskPlusPath),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            "Add",
                            style: TextStyle(
                              color: ColorApp.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
