import 'package:code_along/base/res/styles/app_styles.dart';
import 'package:code_along/base/res/styles/media.dart';
import 'package:flutter/material.dart';

class Hotel extends StatelessWidget {
  const Hotel({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width *0.6,
      height: 350,
      color: Colors.red.shade200,
      decoration: BoxDecoration(
        color: AppStyles.primaryColor,
        borderRadius:BorderRadius.circular(24)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           decoration: BoxDecoration(
        color: AppStyles.primaryColor,
        borderRadius:BorderRadius.circular(12),
        image: DecorationImage(
          fit:BoxFit.cover,
          image: AssetImage(
            AppMedia.hotelRoom
            )
           )
          ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.only(left:15),
            child: Text(
              "Open space",
              style: AppStyles.headLineStyle1.copyWith(color:AppStyles.kakiColor),
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.only(left:15),
            child: Text(
            "\$25/night",
            style:AppStyles.headLineStyle1.copyWith(color:AppStyles.kakiColor),
             ),
          ) 
        ],
      )
    );
  }
}