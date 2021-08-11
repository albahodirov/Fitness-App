import 'package:exam10/ui/login_page.dart';
import 'package:exam10/ui/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MyActPage extends StatefulWidget {
  const MyActPage({ Key? key }) : super(key: key);

  @override
  _MyActPageState createState() => _MyActPageState();
}

class _MyActPageState extends State<MyActPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  var a;

  var _key = GlobalKey<ScaffoldState>();

  bool switchState = false;

  @override
  void initState() {

    super.initState();
    late ImageProvider _imageWidget;

    if (_image != null) {
      _imageWidget = FileImage(_image!);
    } else {
      _imageWidget = AssetImage('assets/images/camera.png');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(CupertinoIcons.bars,color: Colors.black,size: 32.0,),
          ),
          actions: [
            InkWell(
              child: Container(
              margin: EdgeInsets.only(right: 14.0),
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/profile.png"),),
              ),
            ),
            onTap: (){
              Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage()));
            },
            ),
          ],
      ),
      endDrawer: buildProfileDrawer(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("albahodriov"),
              accountEmail: Text("+998901001010"),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade800,
              ),
              currentAccountPicture: _image == null
                  ? CircleAvatar(
                      radius: 20,
                      child: InkWell(
                        child: Icon(Icons.camera_alt),
                        onTap: () {
                          _imgFromGallery();
                        },
                      ),
                    )
                  : CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(_image!.path),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 50,
                            left: 45,
                            child: InkWell(
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 22,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                _imgFromGallery();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade500.withOpacity(0.5),
            //   ),
            //   child: Text(
            //     'John Antony',
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 24,
            //     ),
            //   ),
            // ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              onTap: (){
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage()));
              },  
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              onTap: (){
                Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
              },  
              title: Text('Log Out'),
            ),
          ],
        ),
      ),
      body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 15.0),
                  height: 35.0,
                  child: Text("My Activities",style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.w600),),
                ),
                Container(
              height: 80.0,
              //color: Colors.red,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Material(
                  elevation: 20.0,
                  shadowColor: Colors.black45,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white70,
                    ),
                    child: TextFormField(
                    cursorColor: Colors.black87,
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.search,color: Colors.black45,),
                      hintText: " Search",
                      hintStyle: TextStyle(color: Colors.black45),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      contentPadding: EdgeInsets.only(top: 15.0)
                    ),
                  ),
                  ),
                ),
              ),
            ),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade700,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text("Daily",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  Text("Weakly",style: TextStyle(fontSize: 16.0),),
                  Text("Monthly",style: TextStyle(fontSize: 16.0),),
                  Text("Yearly",style: TextStyle(fontSize: 16.0),),
                ],
              ),
            ),
            SizedBox(height: 5.0,),
            Container(
              padding: EdgeInsets.only(left: 12.0,right: 10.0),
              height:350.0,
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 190.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Padding(padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Steps",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black87),),
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple.shade600,
                                  radius: 13,
                                  child: Padding(padding: EdgeInsets.all(3.5),
                                  child: ImageIcon(
                            AssetImage("assets/images/sneakers.png"),
                            color: Colors.white,
                          ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0,),
                            Container(
                              height: 110.0,
                              width: 110.0,
                              child: CircularStepProgressIndicator(
        totalSteps: 20,
        currentStep: 12,
        stepSize: 20,
        selectedColor: Colors.red,
        unselectedColor: Colors.purple[400],
        padding: math.pi / 80,
        width: 150,
        height: 150,
        startingAngle: -math.pi * 5 / 3,
        arcSize: math.pi * 2 / 3 * 2,
        gradientColor: LinearGradient(
            colors: [Colors.pink, Colors.deepPurple],
        ),
    ),
                            ),
                          ],
                        ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Container(
                        height: 140.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Heart",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black87),),
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple.shade600,
                                  radius: 13,
                                  child: Padding(padding: EdgeInsets.only(top: 0.5),
                                  child: Icon(Icons.favorite_border_outlined,color: Colors.white,size: 15.0,),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/heart.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                    ],
                  ),
                  //2-column
                  SizedBox(width: 15.0,),
                  Column(
                    children: [
                      Container(
                        height: 140.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.purple.shade600,Colors.deepPurple.shade800],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sleep",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.white),),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 13,
                                  child: Padding(padding: EdgeInsets.only(top: 0.5),
                                  child: Icon(CupertinoIcons.moon,color: Colors.deepPurple.shade800,size: 15.0,),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 30.0,right: 105.0),
                            child: Column(
                              children: [
                                Text("8:00",style: TextStyle(color: Colors.white,fontSize: 17.0),),
                                Text("Hours",style: TextStyle(color: Colors.white,fontSize: 12.0,),),
                              ],
                            ),
                            ),
                          ],
                        ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Container(
                        height: 190.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                                     ),
                                     child: Padding(padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Colories",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black87),),
                                CircleAvatar(
                                  backgroundColor: Colors.deepPurple.shade600,
                                  radius: 13,
                                  child: Padding(padding: EdgeInsets.only(top: 0.5),
                                  child: Icon(Icons.add_circle_outline, color: Colors.white,size: 15.0,),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.0,),
                            Container(
                              height: 110.0,
                              width: 110.0,
                              child: CircularStepProgressIndicator(
        totalSteps: 20,
        currentStep: 12,
        stepSize: 20,
        selectedColor: Colors.red,
        unselectedColor: Colors.purple[400],
        padding: math.pi / 80,
        width: 150,
        height: 150,
        startingAngle: -math.pi * 2 / 3,
        arcSize: math.pi * 2 / 3 * 2,
        gradientColor: LinearGradient(
            colors: [Colors.pink, Colors.deepPurple],
        ),
    ),
                            ),
                          ],
                        ),
                        ),
                                  ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              margin: EdgeInsets.only(left: 12.0,right: 12.0),
              height: 60.0,
              decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Daily Meals",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black87),),
                  Container(
                    height: 23.0,
                    width: 23.0,
                    child: ImageIcon(
                            AssetImage("assets/images/apple.png"),
                            color: Colors.deepPurple.shade800,
                          ),
                  ),
                ],
              ),
              ),
            ),
            SizedBox(height: 10.0,),
            Container(
              margin: EdgeInsets.only(left: 12.0,right: 12.0),
              height: 60.0,
              decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Other information",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black87),),
                  Container(
                    height: 23.0,
                    width: 23.0,
                    child: Icon(CupertinoIcons.info_circle_fill,color: Colors.deepPurple.shade800,),
                  ),
                ],
              ),
              ),
            ),
              ],
            ),
          ),
    );
  }
  buildProfileDrawer(){
    return Drawer();
  }
  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
    });
    a = _image;
  }

  void showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}