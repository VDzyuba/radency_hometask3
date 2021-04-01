import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radency_hometask/pages/list_page.dart';
import 'package:radency_hometask/models/save_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => SaveInfo(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radency Hometask',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListPage(),
    );
  }
}
