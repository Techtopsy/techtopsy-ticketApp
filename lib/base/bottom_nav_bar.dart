import "package:code_along/base/controller/bottom_nav_controller.dart";
import "package:code_along/screens/profile/profile_screen.dart";
import "package:code_along/screens/search/search_screen.dart";
import "package:code_along/screens/ticket/widgets/ticket_screen.dart";
import "package:fluentui_icons/fluentui_icons.dart";
import "package:flutter/material.dart";
import "package:code_along/screens/home/home_screen.dart";
import 'package:get/get.dart';


class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  //dependency injection
  final BottomNavController controller = Get.put(BottomNavController());

  //list is iterated using index

  
final appScreens = [
  HomeScreen(),
  SearchScreen(),
  TicketScreen(),
  ProfileScreen(),
];


  @override
  Widget build(BuildContext context) {
    
    return Obx((){
      return Scaffold(
       
       body: appScreens[controller.selectedIndex.value],
       bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap:controller.onItemTapped,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Color(0xFF526400),
        showSelectedLabels: false,
        
        items: [
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
        activeIcon:Icon(FluentSystemIcons.ic_fluent_home_filled), label:'Home'),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
        activeIcon:Icon(FluentSystemIcons.ic_fluent_search_filled), label:'Search'),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
        activeIcon:Icon(FluentSystemIcons.ic_fluent_ticket_filled), label:'Ticket'),
        BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
        activeIcon:Icon(FluentSystemIcons.ic_fluent_person_filled), label:'Profile'),
       ],
       
       ),
    );
    });
  }
}