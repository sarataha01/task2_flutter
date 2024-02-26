import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_flutter/constants/asset_data.dart';

import '../../constants/colors.dart';
import '../../models/task_model.dart';
import 'checklist_items.dart';

class PinnedTask extends StatelessWidget {
  final Task? pinnedTask;
  const PinnedTask({super.key, this.pinnedTask});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorApp.container,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pinnedTask?.title ?? "Your Title here",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SvgPicture.asset(
                AssetData.pinPath,
                width: 22,
                height: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: ColorApp.divider,
            endIndent: 150,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    for (var todo in pinnedTask?.todos ??
                        [
                          "todo 1",
                          "todo 2",
                          "todo 3",
                          "todo 4",
                        ])
                      CheckListItem(isChecked: false, text: todo)
                  ],
                ),
              ),
              const SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "25%",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 65,
                      height: 65,
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
              const SizedBox(width: 50),
            ],
          ),
        ],
      ),
    );
  }
}
