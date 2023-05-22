import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void routetohomeSlider(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/loginScreen',
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 235, 181),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome To Fire Fighter',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: size.height / 1.75,
              ),
              TextButton(
                onPressed: () {
                  routetohomeSlider(context);
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
