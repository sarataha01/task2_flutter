import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_flutter/constants/asset_data.dart';

import '../constants/colors.dart';
import 'widgets/personal_profile.dart';
import 'widgets/selected_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> titles = [
    'Study for Finals',
    'Clean the kitchen',
    'Business Tasks',
    'Study for Finals',
    'Clean the kitchen',
    'Business Tasks',
  ];

  List<String> subtitles = [
    '4 tasks',
    '2 tasks',
    '3 tasks',
    '4 tasks',
    '2 tasks',
    '3 tasks',
  ];

  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic>? args =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    //
    // List<String> newTitles = [args?['titles'] ?? ''];
    // //List<String> additionalControllers = args?['additionalControllers'] ?? [];
    //
    // titles.addAll(newTitles);

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
          const SelectedTask(),
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
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: ColorApp.container,
                    ),
                    child: ListTile(
                      title: Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorApp.primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        subtitles[index],
                        style: const TextStyle(
                          fontSize: 14,
                          color: ColorApp.secondaryColor,
                        ),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text("25%",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700)),
                                SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: CircularProgressIndicator(
                                    value: 0.25,
                                    color: ColorApp.progress,
                                    strokeWidth: 5,
                                    backgroundColor: ColorApp.appColor,
                                    strokeCap: StrokeCap.round,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.more_vert),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
