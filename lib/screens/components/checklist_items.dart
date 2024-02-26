import 'package:flutter/material.dart';
import 'package:task2_flutter/constants/colors.dart';

class CheckListItem extends StatelessWidget {
  final bool isChecked;
  final String text;

  const CheckListItem({super.key, required this.isChecked, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isChecked)
          const CircleAvatar(
            radius: 8,
            child: Icon(
              Icons.check_circle_sharp,
              size: 17,
              color: ColorApp.finished,
            ),
          )
        else
          const Icon(
            Icons.circle_outlined,
            size: 15,
            color: ColorApp.primaryColor,
          ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              color: isChecked ? ColorApp.finished : ColorApp.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
