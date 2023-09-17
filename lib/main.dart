import "package:flutter/material.dart";
import "package:su_android_learning/hw_login.dart";

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AndroidLearning(),
    ),
  );
}

class AndroidLearning extends StatelessWidget {
  const AndroidLearning({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HWLogin(),
      ),
    );
  }
}
