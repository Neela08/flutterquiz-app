import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_logic/statistics.dart';

class quizPage extends StatefulWidget {
  final questionLength,quizTitle;
  quizPage({this.questionLength,this.quizTitle});
  @override
  _quizPageState createState() => _quizPageState();
}

class _quizPageState extends State<quizPage> {
String selectedAnswer='';
String rightAnswer='';
int length=5,index=0,point=0;
var showData;int borderColor=0;
String question='';
String option1='';
String option2='';
String option3='';
String option4='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child:  FutureBuilder(builder: (context, snapshot){
          showData=json.decode(snapshot.data.toString());
          return  Column(
            children: [

              Container(
                    margin: EdgeInsets.only(top: 50,left: 30,right: 30),
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.0),
                      border: Border.all(color: Colors.black,width: 3)
                      //color: Colors.amber,
                    ),
                    child: Center(
                      child: Text(
                          (index==0)?showData[index]['question']:'$question',
                        textAlign: TextAlign.center,
                      ),
                    )
                ),


              SizedBox(height: 20.0),
              InkWell(
                onTap: (){setSelectedAnswer('1',1);},
                child:Container(
                  height: 70,
                     margin: EdgeInsets.only(left: 20.0,right: 20.0),
                  //  padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border:Border.all(color: Colors.amber),
                      color:(borderColor==1)?Colors.amber:null,
                    ),
                    child: Center(
                      child: Text( (index==0)?showData[index]['1']:'$option1',textAlign: TextAlign.center,),
                    )
                ),
              ),

              SizedBox(height: 10,),
              InkWell(
                onTap: (){setSelectedAnswer('2',2);},
                child:Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                   // padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:Border.all(color: Colors.amber),
                      color:(borderColor==2)?Colors.amber:null,
                    ),
                    child: Center(
                      child: Text((index==0)?showData[index]['2']:'$option2',textAlign: TextAlign.center,),
                    )
                ) ,
              ),

              SizedBox(height: 10.0,),
              InkWell(
                onTap: (){setSelectedAnswer('3',3);},
                child:Container(
                    height: 70,
                    margin: EdgeInsets.only(left: 20.0,right: 20.0),
                    //padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:Border.all(color: Colors.amber),
                      color:(borderColor==3)?Colors.amber:null,),
                    child: Center(
                      child: Text((index==0)?showData[index]['3']:'$option3',textAlign: TextAlign.center,),
                    )
                ),
              ),

              SizedBox(height: 10.0,),
           InkWell(
             onTap: (){setSelectedAnswer('4',4);},
             child:    Container(
                 height: 70,
                 margin: EdgeInsets.only(left: 20.0,right: 20.0),
               //  padding: EdgeInsets.all(20.0),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   border:Border.all(color: Colors.amber),
                   color:(borderColor==4)?Colors.amber:null,),
                 child: Center(
                   child: Text((index==0)?showData[index]['4']:'$option4',textAlign: TextAlign.center,),
                 )
             ),
           ),
              SizedBox(height: 30.0,),
              InkWell(onTap: (){next();},
                child:Container(
          height: 70,
          width: 70,
          //padding: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                     color: Colors.black,
                        shape: BoxShape.circle
                    ),

          child: Center(
              child: IconButton(
            icon: Icon(Icons.navigate_next,size: 30,color: Colors.white,)
          )
          ) ,),

              )],
          );
        }, future: DefaultAssetBundle.of(context).loadString("assets/"+widget.quizTitle),

        )

      )

    );}
  void setSelectedAnswer(String answer,int color)
  {
    setState(() {
      selectedAnswer=answer;
      borderColor=color;
    });
  }
  void checkAnswer()
  {
    if(selectedAnswer==showData[index]['answer'])
      {
        point=point+10;
      }
  }
  void next()
  {  checkAnswer();
  borderColor=0;
    setState(() {
      index++;
      if(index<=widget.questionLength-1)
      {

        question=showData[index]['question'];
        option1=showData[index]['1'];
        option2=showData[index]['2'];
        option3=showData[index]['3'];
        option4=showData[index]['4'];
      }

      else
      {

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => statistics(questionLength: widget.questionLength,point: point,)
        ));
      }
    });
  }


}


