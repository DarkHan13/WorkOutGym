import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:work_out_gym/translations/locale_keys.g.dart';

class UserTips extends StatelessWidget{
  const UserTips({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Tips.tr()),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}