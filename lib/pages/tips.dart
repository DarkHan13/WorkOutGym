import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTips extends StatelessWidget{
  const UserTips({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips'.tr),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}