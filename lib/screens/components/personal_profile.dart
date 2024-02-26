import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../util/general_utils.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(GeneralUtils.getUniqueAvatar()),
          ),
          const SizedBox(
            width: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Sara,",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "We wish you a productive day!",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: ColorApp.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
