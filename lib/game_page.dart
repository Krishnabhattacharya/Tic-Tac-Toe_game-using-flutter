import 'dart:core';


import 'package:flutter/material.dart';

class game_page extends StatefulWidget {
  const game_page({Key? key}) : super(key: key);

  @override
  State<game_page> createState() => _game_pageState();
}

class _game_pageState extends State<game_page> {
  //String display="";
  int c=0;
  bool turn=true;
   List<String>display=['','','','','','','','','',];
  // String str=Text('RESERT???',style: TextStyle(fontSize: 10,color: Colors.white),) as String;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Center(
        child: Text(
          'TIC TAC TOE',style: TextStyle(fontSize: 33,color: Colors.white),
        ),
      ),
        backgroundColor: Colors.yellow[900],
      ),
      body:
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                    begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFF6FF00),Color(0xFFF57F17)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100,left: 10,right: 10),
            child: GridView.builder(gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,),
                itemBuilder: (BuildContext context,int index){
              return GestureDetector(
                onTap: ()
                  {
                    tapped(index);
                  },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange,width: 5)
                  ),
                  child: Center(
                    child: Text(display[index],style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),
              );
    },
            itemCount: 9,),
          ),
        ),

    );
  }
   void tapped(int index)
  {
   setState(() {
     if(turn&&display[index]==''){
       display[index]='0';
       c++;}
     else if(!turn&&display[index]==''){
       display[index]='X';
       c++;}

     turn=!turn;
     checkWinner();
   });
  }

  void checkWinner() {
    if(display[0]==display[3]&&display[0]==display[6]&&display[0]!=''){
      show(display[0]);
    }
  else  if(display[1]==display[4]&&display[1]==display[7]&&display[1]!=''){
      show(display[1]);
    }
 else   if(display[2]==display[5]&&display[2]==display[8]&&display[2]!=''){
      show(display[2]);
    }
  else  if(display[0]==display[1]&&display[0]==display[2]&&display[0]!=''){
      show(display[0]);
    }
  else  if(display[3]==display[4]&&display[3]==display[5]&&display[3]!=''){
      show(display[3]);
    }
 else   if(display[6]==display[7]&&display[6]==display[8]&&display[6]!=''){
      show(display[6]);
    }
   else if(display[0]==display[4]&&display[0]==display[8]&&display[0]!=''){
      show(display[0]);
    }
  else  if(display[2]==display[4]&&display[2]==display[6]&&display[2]!=''){
      show(display[2]);
    }
    else if(c==9)
      {
        showd();
      }
  }
  show(String s){
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.deepOrange,duration: Duration(seconds: 5),behavior: SnackBarBehavior.floating,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),action: SnackBarAction(onPressed: (){setState(() {
     for(var i=0;i<9;i++)
       {
         display[i]='';
       }

   });},label:'RESET??',),
       content: Text('WINNER IS ->$s<-\n\nGAME IS OVER!!',textAlign: TextAlign.center
     ,style: TextStyle(fontSize: 30,color: Colors.white),))

   );
  }

  void showd() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.deepOrange,duration: Duration(seconds: 5),behavior: SnackBarBehavior.floating,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),action: SnackBarAction(onPressed: (){setState(() {
      for(var i=0;i<9;i++)
      {
        display[i]='';
      }

    });},label:'RESET??',),
        content: Text('GAME IS DRAW!!!',textAlign: TextAlign.center
          ,style: TextStyle(fontSize: 30,color: Colors.white),))

    );
  }
}