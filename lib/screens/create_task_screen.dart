import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task2_flutter/providers/task_provider.dart';

import '../constants/asset_data.dart';
import '../constants/colors.dart';
import '../models/task_model.dart';
import '../util/validators.dart';
import '../widgets/input_field.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final List<TextEditingController> _additionalControllers = [
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Task",
            style: TextStyle(
              color: ColorApp.secondaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  InputField(
                    controller: _titleController,
                    prefix: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset(
                        AssetData.titlePath,
                      ),
                    ),
                    hintText: "Task Title",
                    validator: (String? input) =>
                        Validators.checkLengthValidator(input, 7),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: ColorApp.divider,
                    endIndent: 1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "ToDos",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  ..._additionalControllers.asMap().entries.map((entry) {
                    final index = entry.key;
                    final controller = entry.value;
                    return Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InputField(
                                controller: controller,
                                prefix: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: SvgPicture.asset(
                                    AssetData.clipboardPath,
                                  ),
                                ),
                                hintText: "To Do",
                                validator: (String? input) => index == 0
                                    ? Validators.checkLengthValidator(input, 5)
                                    : null,
                                suffix: index > 0
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.close_rounded,
                                          color: ColorApp.suffix,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _additionalControllers
                                                .removeAt(index);
                                          });
                                        },
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    );
                  }),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _additionalControllers.add(TextEditingController());
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.button,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outlined,
                              color: ColorApp.primaryColor,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Add",
                              style: TextStyle(
                                color: ColorApp.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              debugPrint(_titleController.text);
              taskProvider.addTask(Task(
                title: _titleController.text,
                todos: _additionalControllers
                    .map((controller) => controller.text)
                    .toList(),
              ));
              Navigator.pop(context);
            }
          },
          shape: const CircleBorder(),
          backgroundColor: ColorApp.button,
          child: const Icon(Icons.check),
        ),
      );
    });
  }
}
