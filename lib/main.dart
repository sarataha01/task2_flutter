import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2_flutter/constants/colors.dart';
import 'package:task2_flutter/providers/task_provider.dart';
import 'package:task2_flutter/screens/create_task_screen.dart';
import 'package:task2_flutter/screens/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TaskProvider(),
        ),
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: ColorApp.appColor,
          ),
          home: HomePage(),
          routes: {
            '/createTask': (context) => const CreateTask(),
            '/home': (context) => HomePage(),
          },
        ),
      ),
    );
  }
}
