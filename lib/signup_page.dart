
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //Icon visible = Icon(Icons.visibility_off);
  bool isVisibility = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF9734ff),
      body: Padding(
          padding: EdgeInsets.only(
            bottom: 50,
            top: 50,
            left: 80,
            right: 80,
          ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: screenWidth * 0.8,
            height: screenHeight * 0.9,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sign Up",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                //Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  //children: [
                Form(
                  child: Column(
                    children: [
                      textFormField("User Name", Icon(CupertinoIcons.person), Icon(null)),
                      textFormField("Email", Icon(CupertinoIcons.mail), Icon(null)),
                      passTextFormField("Password", Icon(Icons.lock)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked =! isChecked;
                          });
                        },
                    ),
                    Text(
                      "I read and agree to",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text("Terms and Conditions",
                        style: TextStyle(
                          color: Color(0xFF9734ff),
                        ),
                      ),
                    ),
                  ],
                ),
              MaterialButton(
                onPressed: (){
                  // _launchInBrowser("https://www.google.com");
                  // _makePhoneCall("tel:01715142945");
                  //_makePhoneCall("sms:01715142945?body=Hello");
                  // launch('mailto:abdullaharrezwan1999@gmail.com?'
                  //     'subject=Title&'
                  //     'body=Hello');
                  filePicker();
                },
                child: Text("Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(0xFF9734ff),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Alreday have an account",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(title: "Hello"),
                          ),
                        );
                      },
                    child: Text("Sign In",
                      style: TextStyle(
                        color: Color(0xFF9734ff),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Future<FilePickerResult?>filePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    return result;
  }


  Widget textFormField (String hintText, Icon prefixIcon, Icon suffixIcon){
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        autovalidate: true,
        validator: (value) {
          if(RegExp(r"^[0-9A-Za-z]{10}$").hasMatch(value!)){
            return null;
          }
          else{
            return "Number must be 10 digit long";
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget passTextFormField(String hintText, Icon prefixIcon) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: isVisibility,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
              onPressed: (){
                setState(() {
                  isVisibility =! isVisibility;
                });
              },
              icon: (isVisibility) ? Icon(Icons.visibility_off): Icon(Icons.visibility),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
