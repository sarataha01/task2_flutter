import 'package:flutter/material.dart';

class ConstraintsScreen extends StatelessWidget {
  const ConstraintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            const Spacer(
              flex: 3,
            ),
            Flexible(
              flex: 9,
              child: ListView(),
            ),
          ],
        ),
      ),
    );
  }
}
