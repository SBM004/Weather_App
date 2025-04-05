import 'dart:ui';
import 'dart:convert';
import 'package:intl/intl.dart';
import './secrets.dart';
import 'package:flutter/material.dart';
import './cards_container/cards.dart';
import 'package:http/http.dart 'as http;
class WhetherApp extends StatefulWidget{
  const WhetherApp({super.key});

  @override
  State<WhetherApp> createState() => _WhetherAppState();
}

class _WhetherAppState extends State<WhetherApp> {
  // late double temp=0.0 ;
  // late String desc='';
  late Future <Map<String,dynamic>> weather;
  @override
  void initState(){
    super.initState();
    weather=getCurrentWhether();
  }


  Future<Map<String,dynamic>> getCurrentWhether() async{
    try{
    //String cityname ='London';
    final res = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?q=London&APPID=$openWhetherApiKey'));
    
    final data =jsonDecode(res.body);
    if(int.parse(data['cod'])!=200){
     // throw 'An unexppected error occured';
     throw data['message'];
    }
    return data;
  //   setState((){
  //   temp=data['list'][0]['main']['temp'];
  //  // desc=data['list'][0]['weather']['main'];
  //   });
    }
    catch(e){
      throw e.toString();
    }
    
  }

  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        
        title:Text('Whether App',style:TextStyle(color:Colors.white)),
      centerTitle: true,
      actions: [
        IconButton(onPressed:(){
          setState(() {
            weather=getCurrentWhether();
          });
        },
        icon:Icon(Icons.refresh_outlined,color:Colors.white,)
        ),

      ],
       ),
        body:
      //temp==0?CircularProgressIndicator(): 
      FutureBuilder(
        future:weather,
        builder:(context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child:CircularProgressIndicator()
            );
          }

          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          
          final data=snapshot.data!;
          final currentTemp=data['list'][0]['main']['temp'];
          final currentSky=data['list'][0]['weather'][0]['main'].toString();
          final currentHumidity=data['list'][0]['main']['humidity'].toString();
          final currentWindSpeed=data['list'][0]['wind']['speed'].toString();
          final currentPressure=data['list'][0]['main']['pressure'].toString();
          return Padding(
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
                            Text('$currentTemp K',style:TextStyle(color:Colors.white,fontSize:30.0,fontWeight: FontWeight.bold)),
                            SizedBox(height:10),
                            Icon(currentSky=='Clouds' || currentSky=='Rain' ?Icons.cloud:Icons.sunny,size:50,color:Colors.white,),
                           
                            SizedBox(height:10),
                            Text(currentSky,style:TextStyle(color:Colors.white,fontSize:20))
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
              // SingleChildScrollView(
              //   scrollDirection:Axis.horizontal,
              //   child: Row(
                  
              //     children:[
              //        for(int i=1;i<=5;i++)...[
              //           HourlyForecastCard(time:'10:00',icon:Icons.sunny,temp:'300.20° F'),
              //        ],
                      
                    
              //      HourlyForecastCard(time:'9:00',icon:Icons.cloud,temp:'300.20° F'),
              //      HourlyForecastCard(time:'10:00',icon:Icons.sunny,temp:'300.20° F'),
              //      HourlyForecastCard(time:'11:00',icon:Icons.air,temp:'300.20° F'),
              //     HourlyForecastCard(time:'12:00',icon:Icons.water,temp:'300.20° F'),
              //       HourlyForecastCard(time:'1:00',icon:Icons.cloud,temp:'300.20° F'),
              //     ]
              //   ),
              // ),
              SizedBox(
                height:120,
                child: ListView.builder(
                  itemCount:20,
                  scrollDirection:Axis.horizontal,
                  itemBuilder: (context, index){
                     final hourly=data['list'];
                    final time=DateTime.parse(hourly[index+1]['dt_txt'].toString());
                    return HourlyForecastCard(time:DateFormat.j().format(time),
                    icon:hourly[index+1]['weather'][0]['main'].toString()=='Clouds' || hourly[index+1]['weather'][0]['main'].toString()=='Rain' ?Icons.cloud:Icons.sunny,
                    temp:hourly[index+1]['main']['temp'].toString());
                  }
                
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
                      AdditionalInfoCard(icon:Icons.water_drop,tt:'humidity',tt1:currentHumidity),
                        AdditionalInfoCard(icon:Icons.air,tt:'Wind speed',tt1:currentWindSpeed),
                         AdditionalInfoCard(icon:Icons.beach_access,tt:'Pressure',tt1:currentPressure),
                  ],
                ),
              ),
            ]
           ),
         );
        },
      )
       
      
    );
  }
}

