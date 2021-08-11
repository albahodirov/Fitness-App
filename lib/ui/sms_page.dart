import 'myActPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class SmsPage extends StatefulWidget {
  String? phone;
  SmsPage(this.phone, {Key? key}) : super(key: key);

  @override
  _SmsPageState createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  TextEditingController smsCode = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authUser.verifyPhoneNumber(
        phoneNumber: widget.phone!,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException credential) {},
        codeSent: (String verificationId, int? resendToken) async {},
        codeAutoRetrievalTimeout: (String text) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/SignInPage.gif"),
                      ),
                    ),
            ),
            SizedBox(height: 20.0,),
          Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurple.shade500),
                maxLength: 6,
                controller: smsCode,
                validator: (text) {
                  if (text!.length < 6) {
                    return "You need at least 6 characters";
                  }
                },
              ),
                ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade500,
                ),
                onPressed: _phoneVerify,
                child: Text("SMS Verify"),
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }

  _phoneVerify() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await _authUser.verifyPhoneNumber(
          phoneNumber: widget.phone!,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException credential) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
                content: Text("Smsni Tekshirib Qaytadan Urinib Ko'ring !"),
              ),
            );
          },
          codeSent: (String verificationId, int? resendToken) async {
            print("Sms Jonatildi !");
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: smsCode.text);
            await _authUser.signInWithCredential(phoneAuthCredential);
            await Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MyActPage()));
          },
          codeAutoRetrievalTimeout: (String text) {
            print("TEXT: $text");
          });
    }
  }
}
