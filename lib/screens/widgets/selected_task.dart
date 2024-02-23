import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_flutter/constants/asset_data.dart';

import '../../constants/colors.dart';
import 'checklist_items.dart';

class SelectedTask extends StatelessWidget {
  const SelectedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376,
      height: 198,
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
              const Text(
                "Study for Finals.",
                style: TextStyle(
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
          Container(
            width: 220,
            height: 1,
            color: ColorApp.divider,
          ),
          const Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8,
                  ),
                  CheckListItem(
                    isChecked: true,
                    text: 'Review Lectures',
                  ),
                  CheckListItem(
                    isChecked: false,
                    text: 'Review personal notes',
                  ),
                  CheckListItem(
                    isChecked: false,
                    text: 'Solve past exams',
                  ),
                  CheckListItem(
                    isChecked: false,
                    text: 'Make short summaries',
                  ),
                ],
              ),
              SizedBox(width: 75),
              SizedBox(
                width: 70,
                height: 70,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text("25%",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
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
            ],
          ),
        ],
      ),
    );
  }
}
