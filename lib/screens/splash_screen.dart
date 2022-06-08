import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Container(
          height: 350,
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          ),
          child: Stack(
            children: [
              Text("UCEK"),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: IconButton(
                      onPressed: null, icon: Icon(Icons.arrow_forward_ios))),
            ],
          ),
        ),
      ),
    );
  }
}
