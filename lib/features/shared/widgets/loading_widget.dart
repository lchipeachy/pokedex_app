import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000029),
      body: Center(
        child: CircularProgressIndicator(
          color: Color(0xFFCD3131),
        ),
      ),
    );
  }
}