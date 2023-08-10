import 'package:flutter/material.dart';

class AddVideoPage extends StatefulWidget {
  const AddVideoPage({super.key});

  @override
  State<AddVideoPage> createState() => _AddVideoPageState();
}

class _AddVideoPageState extends State<AddVideoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.green,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.green,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.green,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.green,
            margin: const EdgeInsets.all(25),
          ),
        ],
      ),
    );
  }
}
