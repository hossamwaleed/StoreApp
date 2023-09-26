import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/screens/homepage.dart';
import 'package:storeapp/screens/updateproductpage.dart';

import 'cubits/blocobserver.dart';


void main() {
   Bloc.observer = MyBlocObserver();
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdateProductPage.id : (context) => UpdateProductPage(),
        
      },
      initialRoute: HomePage.id,
    );
  }
}
