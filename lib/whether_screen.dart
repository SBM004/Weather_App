import 'dart:ui';

import 'package:flutter/material.dart';

class WhetherApp extends StatelessWidget{

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
                          Text('300°F',style:TextStyle(color:Colors.white,fontSize:30.0,fontWeight: FontWeight.bold)),
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
                  Card(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child:Container(
                      width:100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children:[Text('9:00',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                        SizedBox(height:5),
                        Icon(Icons.cloud,size:30),
                        SizedBox(height:5),
                        Text('300.20° F',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  ),
                  Card(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child:Container(
                      width:100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children:[Text('9:00',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                        SizedBox(height:5),
                        Icon(Icons.cloud,size:30),
                        SizedBox(height:5),
                        Text('300.20° F',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  ),
                  Card(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child:Container(
                      width:100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children:[Text('9:00',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                        SizedBox(height:5),
                        Icon(Icons.cloud,size:30),
                        SizedBox(height:5),
                        Text('300.20° F',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  ),
                  Card(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child:Container(
                      width:100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children:[Text('9:00',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                        SizedBox(height:5),
                        Icon(Icons.cloud,size:30),
                        SizedBox(height:5),
                        Text('300.20° F',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  ),
                  Card(
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 10,
                    child:Container(
                      width:100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children:[Text('9:00',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold)),
                        SizedBox(height:5),
                        Icon(Icons.cloud,size:30),
                        SizedBox(height:5),
                        Text('300.20° F',style:TextStyle(color:Colors.white,fontSize:15,fontWeight: FontWeight.bold))
                        ]),
                      ),
                    )
                  ),
                ]
              ),
            ),
            SizedBox(
              height:20
            ),
            //Additional information
            Placeholder(
              fallbackHeight:120
            )
          ]
         ),
       )
       
      
    );
  }
}