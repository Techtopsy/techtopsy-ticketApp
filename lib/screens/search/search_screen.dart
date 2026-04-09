import 'package:code_along/base/res/styles/app_styles.dart';
import 'package:code_along/base/res/styles/media.dart';
import 'package:code_along/base/utils/app_routes.dart';
import 'package:code_along/base/widgets/app_double_text.dart';
import 'package:code_along/screens/search/widget/app_text_icon.dart';
import 'package:code_along/screens/search/widget/app_ticket_tabs.dart';
import 'package:code_along/screens/search/widget/find_tickets.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
    body: ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        SizedBox(height: 40,),
        Text("What are\nyou looking for?", style: AppStyles.headLineStyle1.copyWith(fontSize:35)),
        SizedBox(height: 20,),
        AppTicketTabs(),
        SizedBox(height: 25,),
        AppTextIcon(icon: Icons.flight_takeoff_rounded,text: "Departure",),
        SizedBox(height: 20,),
        AppTextIcon(icon: Icons.flight_land_rounded,text: "Arrival",),
        SizedBox(height: 25,),
        FindTickets(),
        SizedBox(height: 40,),
        AppDoubleText(
          bigText: 'Upcoming Flights',
          smallText: 'View all',
          func: ()=> Navigator.pushNamed(context, AppRoutes.allTickets),
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: size.width* 0.42,
              height: 435,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                   color: Colors.green.shade200,
                   blurRadius: 1,
                   spreadRadius: 2, 
                  )
                ]
              ),
              child: Column(
                children: [
                  Container(
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppMedia.planeSit))
                    ),
                  ),
                  Text(
                    "20% discount on the early booking of this flight. Don't miss", style: AppStyles.headLineStyle2,
                  ),
                ],
              ),
            ),
           Column(
             children: [
               Stack(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      width: size.width *.44,
                      height: 210,
                      decoration: BoxDecoration(
                        color: Color(0xFF3AB8B8),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Discount\nfor survey",
                            style: AppStyles.headLineStyle2.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),),
                            SizedBox(height: 10,),
                            Text(
                            "Take the survey about our services and get discount",
                            style: AppStyles.headLineStyle2.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 18,
                            ),),
                      ],)
                    ),
                    Positioned(
                      right: -45,
                      top: -40,
                      child: Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                          width:18, color:AppStyles.circleColor
                          )
                        ),
                      ),
                    )
                ],
               ),
               SizedBox(
                height: 15,
               ),
               Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                width: size.width *0.44,
                height: 210,
                decoration: BoxDecoration(
                  color: Color(0xFFEC6545),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Text(
                      "Take Love",
                      style: AppStyles.headLineStyle2.copyWith(color:Colors.white
                      ),
                    )
                  ],

                )
               )
             ],
           )
          ],
        )
      ],
    ),
    );
  }
}