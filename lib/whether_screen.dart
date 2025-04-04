import 'dart:ui';

import 'package:flutter/material.dart';
import './cards_container/cards.dart';
import 'package:http/http.dart 'as http;
class WhetherApp extends StatelessWidget{
  Future getCurrentWhether() async{
    http.get(Uri.parse('https://http://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=306252eb428edfd327e1742988e5aa56'));
  }
  const WhetherApp({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        
        title:Text('Whether App',style:TextStyle(color:Colors.white)),
      centerTitle: true,
      actions: [
        IconButton(onPressed:(){
          print('refresh');
        },
        icon:Icon(Icons.refresh_outlined,color:Colors.white,)
        ),

      ],
       ),
       body:Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            SizedBox(
              width:double.infinity,
              child: Card(
                elevation:10,
                shadowColor:Colors.black,
                color: const Color.fromARGB(255, 49, 48, 48),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                     
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX:10,sigmaY:10),
                    child: Padding(
                      
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        
                        children: [
                          Text('300°K',style:TextStyle(color:Colors.white,fontSize:30.0,fontWeight: FontWeight.bold)),
                          SizedBox(height:10),
                          Icon(Icons.cloud,color:Colors.white,size:64),
                          SizedBox(height:10),
                          Text('Rainy',style:TextStyle(color:Colors.white,fontSize:20))
                        ],
                      ),
                    ),
                  ),
                )
                ,
                //child:Text('hii',style:TextStyle(color:Colors.white)),
              ),
            ),
            //whether forcast card
            const SizedBox(height:20),
            Text('Whether Forcast',style:TextStyle(color:Colors.white,fontSize:25,fontWeight: FontWeight.bold)),
            SingleChildScrollView(
              scrollDirection:Axis.horizontal,
              child: Row(
                
                children:[
                  // for(int i=1;i<=5;i++)
                  //   HourlyForecastCard(),
                    
                  
                 HourlyForecastCard(time:'9:00',icon:Icons.cloud,temp:'300.20° F'),
                 HourlyForecastCard(time:'10:00',icon:Icons.sunny,temp:'300.20° F'),
                 HourlyForecastCard(time:'11:00',icon:Icons.air,temp:'300.20° F'),
                HourlyForecastCard(time:'12:00',icon:Icons.water,temp:'300.20° F'),
                  HourlyForecastCard(time:'1:00',icon:Icons.cloud,temp:'300.20° F'),
                ]
              ),
            ),
            SizedBox(
              height:20
            ),
            //Additional information
            Text('Additional Information',style:TextStyle(color:Colors.white,fontSize:25,fontWeight: FontWeight.bold)),
            SizedBox(height:10),
            Container(
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                    AdditionalInfoCard(icon:Icons.water_drop,tt:'humidity',tt1:'94'),
                      AdditionalInfoCard(icon:Icons.air,tt:'Wind speed',tt1:'7.64'),
                       AdditionalInfoCard(icon:Icons.beach_access,tt:'Pressure',tt1:'1009'),
                ],
              ),
            ),
          ]
         ),
       )
       
      
    );
  }
}

