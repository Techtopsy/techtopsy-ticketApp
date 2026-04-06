import 'package:code_along/base/res/styles/app_styles.dart';
import 'package:code_along/base/widgets/app_column_text_layout.dart';
import 'package:code_along/base/widgets/app_layout_builder_widget.dart';
import 'package:code_along/base/widgets/big_circle.dart';
import 'package:code_along/base/widgets/big_dot.dart';
import 'package:code_along/base/widgets/text_style_fourth.dart';
import 'package:code_along/base/widgets/text_style_third.dart';

import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen==true? 0:16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //blue part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketPrimary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  //show departure and destination with Icons first line
                  Row(
                    children: [
                      TextStyleThird(text: ticket["from"]["code"]),
                      Expanded(child: Container()),
                      BigDot(),
                      Expanded(
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(randomDivider: 6),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(text: ticket["to"]["code"],),
                    ],
                  ),
                  //show departure and destination names with time
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(text: ticket["from"]["name"],),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(text: ticket["flying_time"],),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["to"]["name"],
                          align: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //circles and dots
            Container(
              height: 20,
              color: AppStyles.ticketSecondary,
              child: Row(
                children: [
                  BigCircle(isRight: false),
                  Expanded(
                    child: AppLayoutBuilderWidget(randomDivider: 16, width: 6),
                  ),
                  BigCircle(isRight: true),
                ],
              ),
            ),
            //orange part of the ticket
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppStyles.ticketSecondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(21),
                  bottomRight: Radius.circular(21),
                ),
              ),
              child: Column(
                children: [
                  //show departure and destination with Icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        topText: ticket["date"],
                        bottomText: "DATE",
                        alignment: CrossAxisAlignment.start,
                      ),
                      AppColumnTextLayout(
                        topText: ticket["depature_time"],
                        bottomText: "departure time",
                        alignment: CrossAxisAlignment.center,
                      ),
                      AppColumnTextLayout(
                        topText: ticket["number"].toString(),
                        bottomText: "number",
                        alignment: CrossAxisAlignment.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
