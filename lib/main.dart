import 'package:flutter/material.dart';
import 'package:login_page/signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login page demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon iconType = Icon(Icons.visibility_off);
  bool active = false;
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     backgroundColor: Color(0xFF744cbe),
    //     body: Center(
    //       child: Column(
    //         children: [
    //           Padding(
    //               padding: EdgeInsets.only(
    //                   top:30,
    //                   bottom: 20,
    //               ),
    //               child: Image.asset('images/icon.jpg',
    //               height: 150,
    //               width: 150,
    //               ),
    //           ),
    //           Text('App Name',
    //             style: TextStyle(
    //                 fontSize: 22,
    //                 fontFamily: 'Arial'
    //             ),
    //           ),
    //           SizedBox(
    //             height: 20,
    //           ),
    //           Container(
    //             height: MediaQuery.of(context).size.height*.6,
    //             width: MediaQuery.of(context).size.width*.8,
    //             padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(22),
    //             ),
    //             child: Form(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     TextFormField(
    //                       decoration: InputDecoration(
    //                           border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10)
    //                           ),
    //                           hintText: "Email",
    //                           prefixIcon: Icon(
    //                               Icons.account_circle
    //                           )
    //                       ),
    //                       validator: (value) {
    //                         if(value!.length>=4){
    //                           return null;
    //                         }else{
    //                           return 'User name must be at least 4 digit long';
    //                         }
    //                       },
    //                     ),
    //                     TextFormField(
    //                       decoration: InputDecoration(
    //                           border: OutlineInputBorder(
    //                               borderRadius: BorderRadius.circular(10)
    //                           ),
    //                           hintText: "Password",
    //                           prefixIcon: Icon(
    //                               Icons.lock
    //                           ),
    //                           suffixIcon: Icon(
    //                               Icons.visibility
    //                           )
    //                       ),
    //                       validator: (value){
    //
    //                       },
    //
    //                     ),
    //                     TextButton(
    //                         onPressed: (){} ,
    //                         child: Text("Forgot Password ?")
    //                     ),
    //                     ElevatedButton(
    //                         style: ButtonStyle(
    //                             backgroundColor: MaterialStateProperty.all<Color>(Colors.purple)
    //                         ),
    //                         onPressed: () {},
    //                         child: Text("Login")
    //                     ),
    //                     TextButton(
    //                         onPressed: (){
    //                           Navigator.push(context,
    //                               MaterialPageRoute(
    //                                 builder: (context) => SignupPage(),
    //                               ),
    //                           );
    //                         },
    //                         child: Text("SIGN UP")
    //                     ),
    //                   ],
    //                 )
    //             ) ,
    //           )
    //         ],
    //       ),
    //     )  // This trailing comma makes auto-formatting nicer for build methods.
    // );
    return Scaffold(
      backgroundColor: Color(0xFF9734ff),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/icon.jpg",
              height: 200,
              width: 200,
            ),
            Text(
              "Person Name",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.height * 0.85,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Enter username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: active,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            active = !active;
                            (active)
                                ? iconType = Icon(Icons.visibility_off)
                                : iconType = Icon(Icons.visibility);
                          });
                        },
                        icon: iconType,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  /*     RaisedButton(
                    onPressed: () {},
                    child: Text("Login"),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Login"),
                  ),*/
                  Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.deepPurpleAccent,
                    child: Container(
                      width: MediaQuery.of(context).size.height * 0.7,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.05,
                        //minWidth: MediaQuery.of(context).size.height * 0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.1,
                right: MediaQuery.of(context).size.height * 0.1,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.teal,
              child: Container(
                width: MediaQuery.of(context).size.height * 0.7,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * 0.04,
                  //minWidth: MediaQuery.of(context).size.height * 0.7,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forget your password? ",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Reset Password.",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign up now.",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
