import 'package:flutter/material.dart';

class UserGoals extends StatelessWidget{
  const UserGoals({super.key});

  Widget mycard(String task){
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            "$task",
          ),
          onLongPress: (){},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Мои Цели",
          style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            mycard("Медитация"),
            mycard("Тренировака")
          ],
        ),
      ),
    );
  }
}