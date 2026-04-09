import 'package:code_along/base/bottom_nav_bar.dart';
import 'package:code_along/base/utils/app_routes.dart';
import 'package:code_along/screens/home/all_hotels.dart';
import 'package:code_along/screens/home/all_tickets.dart';
import 'package:code_along/screens/ticket/widgets/ticket_screen.dart';
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
        AppRoutes.homePage:(context)=> const BottomNavBar(),
        AppRoutes.allTickets:(context)=>AllTickets(),
        AppRoutes.ticketScreen:(context)=>TicketScreen(),
        AppRoutes.allHotels:(context)=>AllHotels(),
      },
    );
  }
}