import 'package:flutter/material.dart';
import 'package:systemapp/widgets/pricePoints.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fl_chart/fl_chart.dart';

class Gridbox extends StatelessWidget {
  String text,subText;
  IconData iconDisplay;
  Color boxcolor;
  Color sColor;
 final Color tColor;
  
   Gridbox({
    required this.text,
    required this.subText,
    required this.iconDisplay,
    required this.boxcolor,
    required this.tColor,
    required this.sColor,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:const EdgeInsets.all(10.0),
        decoration: BoxDecoration(      
          borderRadius: BorderRadius.circular(16),
          color: boxcolor,
          boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 189, 188, 188).withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                    ),
                ],
            ),
            child: Column(            
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/4,
                      child: Container(
                        padding:const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(71, 190, 189, 185),
                          ),
                        child:  Text(                                      
                          text,
                          maxLines: 2,
                          style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                                    ),
                                ),
                              ),
                    Icon(iconDisplay, color: tColor, size: 32, ),
                    
                  ],
                  
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    Container(                      
                      width: MediaQuery.of(context).size.width/4.4,
                      child: const Text(
                        '4',
                        // maxLines: 2,
                        style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                        ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/6.5,
                      child:  Text(
                        subText,
                        maxLines: 2,
                        style:  TextStyle(fontSize: 9.2, color: sColor, fontWeight: FontWeight.bold),
                        ),
                    ),
                  ],
                )
              ],
            ),
          ),
    );
  }
}

class Linechart extends StatelessWidget {

  final List<PricePoint> points;
  const Linechart({required this.points, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AspectRatio(
        aspectRatio: 1.7,
        
        child: LineChart(LineChartData(lineBarsData : [
          LineChartBarData(
          spots: points.map((point) => FlSpot(point.x, point.y)
        ).toList(),
        isCurved: true,
        dotData:const FlDotData(show: true)
        ),
        ])),
      ),
    );
    
  }
}


class listTileProfile extends StatelessWidget {

  String title1,subtitle;
  IconData leadingIcon, trailingIcon;
  

   listTileProfile({
    required this.title1,
    required this.subtitle,
    required this.leadingIcon,
    required this.trailingIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
       leading: Container(
         width: 40,
         height: 40,
         decoration: BoxDecoration(
           color: const Color.fromARGB(22, 101, 101, 102),
           borderRadius: BorderRadius.circular(100),
           
         ),
         child: Icon(leadingIcon, color:const  Color.fromARGB(255, 255, 174, 0),),
       ),
       title: Text( title1, style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(232, 36, 36, 36)),),
       subtitle: Text(subtitle, style:const TextStyle(fontSize: 15, color: Color.fromARGB(232, 36, 36, 36)),),
       trailing: Container(
         width: 40,
         height: 40,
         decoration: BoxDecoration(
           color: const Color.fromARGB(22, 101, 101, 102),
           borderRadius: BorderRadius.circular(100),
         ),
         child: Icon(trailingIcon, color:const  Color.fromARGB(255, 19, 19, 19),),
       ),
      ),
    );
  }
}
