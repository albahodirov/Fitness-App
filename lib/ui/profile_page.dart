import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Padding(padding: EdgeInsets.only(right: 15.0),
          child: Icon(CupertinoIcons.search,color: Colors.black,),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 10.0,),
            Container(
              alignment: Alignment.center,
              height: 80.0,
              //color: Colors.red,
              child: Column(
                children: [
                    Text("Current Session",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w700,letterSpacing: 0.5),),
                    SizedBox(height: 4.0,),
                    Text("40 min",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w700),),
                    SizedBox(height: 2.5,),
                    Text("Medium Intensity",style: TextStyle(fontSize: 16.0,),),
                ],
              ),
            ),
            Container(
              height: 60.0,
              child: Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Schedule",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w700),),
                  Text("Aug, 2021",style: TextStyle(fontSize: 14.0),),
                ],
              ),
              ),
            ),
            Container(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 80.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("10",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700),),
                        Text("S",style: TextStyle(fontSize: 14.0),),
                      ],
                    ),
                  ),
                  Container(
                    height: 95.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.purple.shade300,Colors.deepPurple.shade800],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("11",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700,color: Colors.white),),
                        Text("S",style: TextStyle(fontSize: 14.0,color: Colors.white),),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("12",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700),),
                        Text("M",style: TextStyle(fontSize: 14.0),),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("13",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700),),
                        Text("T",style: TextStyle(fontSize: 14.0),),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0,
                    width: 55.0,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("14",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700),),
                        Text("W",style: TextStyle(fontSize: 14.0),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
            Container(
              height: 70.0,
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text("Your Progress",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700),),
                  ),
                  SizedBox(height: 5.0,),
                  Padding(padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child: StepProgressIndicator(
    totalSteps: 100,
    currentStep: 65,
    size: 9,
    padding: 0,
    selectedColor: Colors.yellow,
    unselectedColor: Colors.cyan,
    roundedEdges: Radius.circular(20),
    selectedGradientColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.deepPurple.shade600, Colors.pink.shade200],
    ),
    unselectedGradientColor: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.purple.shade100, Colors.purple.shade100],
    ),
),
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text("40 min",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w700),),
                  ),
                ],
              ),
            ),
            Container(
              height: 290.0,
              width: 290.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/yoga2.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}