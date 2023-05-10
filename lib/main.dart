import 'package:flutter/material.dart';

import 'hotel.dart';

void main() {
  runApp(MaterialApp(
    home: Hotelui(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Image(image: AssetImage('assets/rooms/room1.jpg'))]),);
  }
}
