import 'package:code_along/base/controller/text_expansion_controller.dart';
import 'package:code_along/base/res/styles/app_styles.dart';
import 'package:code_along/base/utils/app_json.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index=0;
  @override
  void didChangeDependencies() {
    var args =ModalRoute.of(context)!.settings.arguments as Map;
    index = args["index"];
    // print(args["index"]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              //title: Text(hotelList[index]["place"]),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset("assets/images${hotelList[index]["image"]}",
              fit: BoxFit.cover,
              )),
              Positioned(
                bottom: 20,
                right:20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical:4),
                  color:Colors.black,
                  child: Text(
                    hotelList[index]["place"],
                    style: TextStyle(
                      fontSize:24,
                      //color:Colors.red,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: AppStyles.primaryColor,
                          offset: Offset(2.0,2.0),
                        )
                      ]
                    ),
                )),)
             ]
            )
           ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
              padding: EdgeInsets.all(8.0),
              child: ExpandedTextWidget(
                text: hotelList[index]["detail"],
                //text: "In one of UAE's business districts, 2 miles from the World Trade Centers a free shuttle to the beach and shopping malls.Holiday Inn Express UAE's starship hotel offers a free hot buffet breakfast, 24-hour business centre, a gym, and free Wi-Fi",
              ),
              
              //Text("In one of UAE's business districts, 2 miles from the World Trade Centers a free shuttle to the beach and shopping malls.Holiday Inn Express UAE's starship hotel offers a free hot buffet breakfast, 24-hour business centre, a gym, and free Wi-Fi"),
              ),
              Padding(padding:EdgeInsets.all(16.0),
              child: Text(
                "More Images",
                style: TextStyle(
                  fontSize:20.0, fontWeight: FontWeight.bold
                ),)
              ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotelList[index]["images"].length,
                itemBuilder: (context, imageIndex){
                return Container(
                  margin: EdgeInsets.all(16),
                  child: Image.asset(
                    "assets/images/${hotelList[index]["images"][imageIndex]}"
                  ));
              }),
            )
          ])),
        ], 
       ),       
    );
  }
}




class ExpandedTextWidget extends StatelessWidget {
  ExpandedTextWidget({super.key, required this.text});
  final String text;

  final TextExpansionController controller = Get.put(TextExpansionController());
  @override
  Widget build(BuildContext context) {
    
    return Obx((){
      var textWidget =Text(
      
        text,
        maxLines: controller.isExpanded.value?null:9,
        overflow: controller.isExpanded.value?TextOverflow.visible:TextOverflow.ellipsis,
    );
      return Column(
      children: [
        textWidget,
        GestureDetector(
          onTap:(){
            controller.toggleExpansion();
          },
          child: Text(
            controller.isExpanded.value?'Less': 'More',
            style: AppStyles.textStyle.copyWith(
              color: AppStyles.primaryColor
            ),
          ),
        )
      ],
    );
    });
  }
}