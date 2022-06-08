import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                color: Colors.deepOrangeAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
