import 'package:flix_id/domain/entities/user.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget{
  final User user;

  const MainPage({Key? key, required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page'),),
      body: Center(
        child: Text(user.toString()),
      ),
    );
  }

  
}