import 'package:flutter/material.dart';

class UserNutrition extends StatelessWidget{
  const UserNutrition({super.key});

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Питание'),
            centerTitle: true,
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'Сушка'),
                Tab(text: 'Масса'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Сушка'),
              ),
              Center(
                child: Text('Масса'),
              ),
            ],
          ),
        )
    );
  }
}