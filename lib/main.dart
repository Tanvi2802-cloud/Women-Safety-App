import 'package:flutter/material.dart';

void main() {
runApp(const WomenSafetyApp());
}

class WomenSafetyApp extends StatelessWidget {
const WomenSafetyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Women Safety App',
theme: ThemeData(
primarySwatch: Colors.pink,
),
home: const HomeScreen(),
);
}
}

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("Women Safety App"),
centerTitle: true,
),
body: Center(
child: Padding(
padding: const EdgeInsets.all(20),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
"Stay Safe",
style: TextStyle(
fontSize: 28,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 40),
ElevatedButton(
onPressed: () {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("SOS Alert Sent!"),
),
);
},
style: ElevatedButton.styleFrom(
minimumSize: const Size(220, 80),
),
child: const Text(
"SOS",
style: TextStyle(fontSize: 30),
),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(
content: Text("Emergency Contacts Coming Soon"),
),
);
},
child: const Text("Emergency Contacts"),
),
],
),
),
),
);
}
}
