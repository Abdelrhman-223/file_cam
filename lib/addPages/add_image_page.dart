import 'package:flutter/material.dart';

class AddImagePage extends StatefulWidget {
  const AddImagePage({super.key});

  @override
  State<AddImagePage> createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.white,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.white,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.white,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.white,
            margin: const EdgeInsets.all(25),
          ),
        ],
      ),
    );
  }
}
