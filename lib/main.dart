import 'package:code_along/base/bottom_nav_bar.dart';
import 'package:code_along/screens/home/all_tickets.dart';
import 'package:flutter/material.dart';
void main() {
  

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      routes: {
        "/": (context)=> const BottomNavBar(),
      "/all_tickets":(context)=>AllTickets(),
      },
    );
  }
}