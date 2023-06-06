import 'package:flutter/material.dart';

class UserTips extends StatelessWidget{
  const UserTips({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Советы'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}