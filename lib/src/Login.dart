import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'ui/CustomInput.dart';
import 'Homescreen.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String userID;
  bool toggleState = true;
  String mob_num;
  String password;
  bool status = false;
  _makePostRequest() async {
    try {
      setState(() {
        status = true;
      });
      // set up POST request arguments
      String url = 'http://18.219.51.76:8084/api/login';
      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"mob_num": "$mob_num", "password": "$password"}';
      // make POST request
      Response response = await post(url, headers: headers, body: json);
      setState(() {
        mob_num = "";
        password = "";
      });
      // check the status code for the result
      int statusCode = response.statusCode;
      // this API passes back the id of the new item added to the body
      String body = response.body;
      setState(() {
        userID = body;
        toggleState = !toggleState;
        status = false;
      });
      if (statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else if (statusCode == 401) {
        _showDialog("Invalid Password");
      } else if (statusCode == 404) {
        _showDialog("Invalid Phone number");
      }
    } catch (err) {
      setState(() {
        status = false;
      });
      _showDialog("Server Error");
    }
  }

  void _showDialog(text) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Login Error"),
          content: new Text(text),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
          //  color: Color.fromRGBO(88, 85, 214, 1.0),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height,
                child: Center(
                    child: (!status
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Material(
                                elevation: 20.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80.0)),
                                child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Image.asset(
                                      'assets/logo.png',
                                      width: 80,
                                      height: 80,
                                    )),
                              ),
                              Column(
                                children: <Widget>[
                                  CustomInputField(
                                      Icon(Icons.person,
                                          size: 30, color: Colors.cyan[400]),
                                      'Phone No', (text) {
                                    setState(() {
                                      mob_num = text;
                                    });
                                  }),
                                  SizedBox(height: 30),
                                  CustomInputField(
                                      Icon(Icons.lock,
                                          size: 30, color: Colors.cyan[400]),
                                      'Password', (text) {
                                    setState(() {
                                      password = text;
                                    });
                                  }),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "Remember me",
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Black',
                                            color: Colors.white,
                                            fontSize: 17),
                                      ),
                                      Text(
                                        "Forgot Password?",
                                        style: TextStyle(
                                            fontFamily: 'Poppins-Black',
                                            color: Colors.lightBlueAccent,
                                            fontSize: 17),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 30),
                                  ButtonTheme(
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.80,
                                    height: 50,
                                    buttonColor: Colors.white,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      onPressed: () {
                                        //showAlert(context);
                                        /*
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Homescreen()),
                                );
                                */
                                        if (mob_num.isNotEmpty &&
                                            password.isNotEmpty) {
                                          print("Hello Here");
                                          _makePostRequest();
                                        } else {
                                          _showDialog(
                                              "Please enter phone no and password");
                                        }
                                      },
                                      child: const Text('LOG IN',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Poppins-Black',
                                              color: Color.fromRGBO(
                                                  88, 85, 214, 1.0))),
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Dont have an account?",
                                      style: TextStyle(
                                          fontFamily: 'Poppins-Black',
                                          color: Colors.white,
                                          fontSize: 17),
                                    ),
                                    FlatButton(
                                        child: Text("Register",
                                            style: TextStyle(
                                                fontFamily: 'Poppins-Black',
                                                color: Colors.lightBlue,
                                                fontSize: 17)),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()),
                                          );
                                        })
                                  ],
                                ),
                              )
                            ],
                          )
                        : CircularProgressIndicator())),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
