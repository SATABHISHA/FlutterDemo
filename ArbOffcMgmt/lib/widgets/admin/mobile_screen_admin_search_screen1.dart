import 'package:arb_offc/widgets/admin/sf_circular_pie_char_admin_skill_search.dart';
import 'package:flutter/material.dart';

class MobileScreenAdminSearchScreen1 extends StatelessWidget {
  const MobileScreenAdminSearchScreen1({
    Key? key,
    required this.children,
    required this.circularChart
  }) : super(key: key);

  final List<Widget> children;
  final Widget circularChart;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Container(
          height: (MediaQuery.of(context).size.height - 250),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    // height: 200,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      // reverse: true,
                      // shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

                      children: children,
                    ),
                  ),
                ),

                Expanded(
                  flex: 6,
                  child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 20.0),
                    // color: Colors.white,
                    // height: 300,
                    /*decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            ),*/
                    child: circularChart,
                  ),
                )
              ]
          ),
        )
      ],
    );
  }
}