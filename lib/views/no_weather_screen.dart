import 'package:flutter/material.dart';

class NoWeatherScreen extends StatelessWidget {
  const NoWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'There is no weather to display 🥺,',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Start searching now 🔍',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
      ),
    );
  }
}
