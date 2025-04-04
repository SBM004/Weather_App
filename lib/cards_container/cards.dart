import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget{
  final String time;
  final IconData icon;
  final String temp;
  const HourlyForecastCard({
    
    super.key,
    required this.time,
    required this.icon,
    required this.temp
    });
  @override
  Widget build(BuildContext context){
    return Card(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
                    elevation: 10,
                    child:Container(
                      width:100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children:[Text(time,style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                        SizedBox(height:5),
                        Icon(icon,size:30),
                        SizedBox(height:5),
                        Text(temp,style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  );
  }
}

class AdditionalInfoCard extends StatelessWidget{
  final IconData icon;
  final String tt;
  final String tt1;
   const AdditionalInfoCard({
    super.key,
    required this.icon,
    required this.tt,
    required this.tt1,
   });
   @override
   Widget build(BuildContext context){
    return  
     Column(
     children:[
       Icon(icon,size:40,color:Colors.white),
       SizedBox(height:5),
       Text(tt,style:TextStyle(color:Colors.white,fontSize:15)),
       SizedBox(height:5),
       Text(tt1,style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
     ]
                         );
   }
}