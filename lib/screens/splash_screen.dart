import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(color: Colors.amberAccent),
        child: Stack(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black12),
                ))
          ],
        ),
      ),
    );
  }
}
