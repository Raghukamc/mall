import 'package:flutter/material.dart';
import 'ui/CustomInput.dart';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String userID;
  bool toggleState = true;
  String fullname;
  String email;
  String mob_num;
  String password;
  bool status = false;

  _makePostRequest() async {
    setState(() {
      status = true;
    });
    // set up POST request arguments
    String url = 'http://18.219.51.76:8083/api/register';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"mob_num": "$mob_num", "password": "$password", "fullname": "$fullname", "email": "$email"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    print(statusCode);
    // this API passes back the id of the new item added to the body
    String body = response.body;
    setState(() {
      userID = body;
      toggleState = !toggleState;
      status = false;
    });
    print(body);
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Use Brightness.light for dark status bar
          // or Brightness.dark for light status bar
          backgroundColor: Color.fromRGBO(98, 0, 238, 0.9)),
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
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
                                SizedBox(height: 40),
                                Column(
                                  children: <Widget>[
                                    CustomInputField(
                                        Icon(Icons.person,
                                            size: 30, color: Colors.cyan[400]),
                                        'FULLNAME', (text) {
                                      setState(() {
                                        fullname = text;
                                      });
                                    }),
                                    SizedBox(height: 20),
                                    CustomInputField(
                                        Icon(Icons.email,
                                            size: 30, color: Colors.cyan[400]),
                                        'EMAIL', (text) {
                                      setState(() {
                                        email = text;
                                      });
                                    }),
                                    SizedBox(height: 20),
                                    CustomInputField(
                                        Icon(Icons.phone,
                                            size: 30, color: Colors.cyan[400]),
                                        'PHONE NUMBER', (text) {
                                      setState(() {
                                        mob_num = text;
                                      });
                                    }),
                                    SizedBox(height: 20),
                                    CustomInputField(
                                        Icon(Icons.lock,
                                            size: 30, color: Colors.cyan[400]),
                                        'PASSWORD', (text) {
                                      setState(() {
                                        password = text;
                                      });
                                    }),
                                    SizedBox(
                                      height: 20,
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
                                          _makePostRequest();
                                          //showAlert(context);
                                        },
                                        child: const Text('REGISTER',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: 'Consolas',
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
                                        "Already have an account?",
                                        style: TextStyle(
                                            fontFamily: 'Consolas',
                                            color: Colors.white,
                                            fontSize: 17),
                                      ),
                                      FlatButton(
                                          child: Text("Login",
                                              style: TextStyle(
                                                  fontFamily: 'Poppins-Black',
                                                  color: Colors.lightBlue,
                                                  fontSize: 17)),
                                          onPressed: () {
                                            Navigator.pop(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register()),
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
      ),
    );
  }
}
