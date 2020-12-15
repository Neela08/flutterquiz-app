import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_logic/quizPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int length=5;
void onclick()
{
  
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: Colors.white,
       body:
       Column(
         children: [
        Padding(padding: EdgeInsets.only(top: 60,left: 20,right: 20),
          child: Text(
          'OOP Quizzz',style: TextStyle(fontSize: 30.0,color: Colors.black87,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
        ),),
          Expanded(
            flex: 1,
            child: Container(
              child:ListView(

                children: [
                  quizList('JAVA','World\'s most popular OOP language, runs on over 10 million devices ', 'assets/java.png','javaQuiz.json'),
                  quizList('KOTLIN','Google\'s official OOP language for Android development', 'assets/kotlin.png','kotlinQuiz.json'),
                  quizList('DART','OOP language for Flutter Development ', 'assets/dart.png','javaQuiz.json'),
                  quizList('PHP','Most popular scripting language for web development ', 'assets/javascript.png','kotlinQuiz.json')



                ],

              ) ,),
          ),





         ],
       )
    );
  }
  Widget quizList(String title,String des,String imgPath,String quizName)
  {
    return InkWell(
      child: Padding(
          padding: EdgeInsets.only(top: 0.0,left: 10.0,right: 10.0),
          child: Container(height: 250,width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
               // border: Border.all(color: Colors.blueAccent)
            ),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(title,style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 25.0,color: Colors.black),),
                    Container(height: 70,width: 140,decoration: BoxDecoration(
                       // border: Border.all(color:Colors.blue)
                    ),
                        child:Text(des,style: TextStyle(fontSize: 12.0,color: Colors.black45),))],),
                Container(
                    height: 400,
                    width: 220,
                    child:Image.asset(imgPath)
                )
              ],

            ),)

      ),
      onTap: (){ return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Choose number of questions"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  onPressed: () {
                    setState(() {
                      length=2;

                      //   firstQuestion();

                    });Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => quizPage(questionLength: length,quizTitle:quizName)
                    ));

                  },
                  child: Text("2"),
                ),

                FlatButton(
                  onPressed: () {
                    setState(() {
                      length=5;
                      // firstQuestion();
                    });Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => quizPage(questionLength: length,quizTitle:quizName)
                    ));
                  },
                  child: Text("5"),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      length=10;

                    });Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => quizPage(questionLength: length,quizTitle:quizName)
                    ));


                  },
                  child: Text("10"),
                ),


              ],
            )

          ],
        ),
      );},
    );
  }

}

