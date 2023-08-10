import 'package:flutter/material.dart';

class AddFolderPage extends StatefulWidget {
  const AddFolderPage({super.key});

  @override
  State<AddFolderPage> createState() => _AddFolderPageState();
}

class _AddFolderPageState extends State<AddFolderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.blue,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            margin: const EdgeInsets.all(25),
          ),
          Container(
            height: 200,
            color: Colors.blue,
            margin: const EdgeInsets.all(25),
          ),
        ],
      ),
    );
  }
}
