import 'package:flutter/material.dart';

class UserTips extends StatelessWidget{
  const UserTips({super.key});

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Text(
        'Советы',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}