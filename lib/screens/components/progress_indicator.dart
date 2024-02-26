import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40,
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            "30%",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            width: 35,
            height: 35,
            child: CircularProgressIndicator(
              value: 0.30,
              color: ColorApp.progress,
              strokeWidth: 5,
              backgroundColor: ColorApp.appColor,
              strokeCap: StrokeCap.round,
            ),
          ),
        ],
      ),
    );
  }
}
