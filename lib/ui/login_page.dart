import 'package:exam10/ui/myActPage.dart';
import 'package:exam10/ui/sms_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  
  var _formKey = GlobalKey<FormState>();
  String? phone;
  String? username;
  var a=Firebase.initializeApp();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
        children: [
          Container(
            height: 170.0,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80.0,left: 10.0),
                  height: 100.0,
                  width: 130.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fitness",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600),),
                      Text("You Wanna",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600),),
                      Text("Have",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w600),),
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0,left: 90.0),
                  height: 130.0,
                  width: 130.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cloud.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/yoga1.png"),
                      ),
                  ),
            ),
            SizedBox(height: 10.0,),
            Material(
                      elevation: 10.0,
                      shadowColor: Colors.black45,
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 230.0,
                      width: 300.0,
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SingleChildScrollView(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 25.0, left: 25.0, bottom: 10.0),
                    child: Text("Please Login",style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w700),),
                    ),
                    Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  // Email
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0,),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIcon: Icon(CupertinoIcons.phone,size: 23.0,),
                      ),
                      initialValue: "+998",
                      maxLength: 13,
                      onSaved: (p) {
                        phone = p;
                      },
                      validator: (text) {
                        if (text!.length < 4) {
                          return "You need at least 4 characters";
                        }
                      },
                    ),
                  ),
                  // Password
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0,),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: Icon(CupertinoIcons.person, size: 26.0,),
                      ),
                      onSaved: (u) {
                        username = u;
                      },
                      validator: (text) {
                        if (text!.length < 6) {
                          return "You need at least 6 characters";
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(17.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text("SEND SMS"),
                  onTap: ()async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SmsPage(phone)));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}