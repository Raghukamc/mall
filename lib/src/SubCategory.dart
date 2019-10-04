import 'package:flutter/material.dart';
import 'ui/Clipper.dart';

class SubCategory extends StatefulWidget {
  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  int _selectedIndex = 0;
  var list = ["one", "two", "three", "four"];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Text> createChildrenTexts() {
    return list
        .map((text) => Text(
              text,
              style: TextStyle(color: Colors.blue),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            // Use Brightness.light for dark status bar
            // or Brightness.dark for light status bar
            backgroundColor: Color.fromRGBO(98, 0, 238, 0.9)),
        body: Container(
          color: Color.fromRGBO(98, 0, 238, 0.9),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: ClipPath(
                            clipper: ClippingClass(),
                            child: Container(
                              width: screenSize.width,
                              height: screenSize.height * 0.24,
                              child: Image.network(
                                'https://d1m6qo1ndegqmm.cloudfront.net/uploadimages/coupons/7768-UtsavRestaurant_640x320_Banner.jpg',
                                width: 60,
                                height: 60,
                              ),
                              decoration: BoxDecoration(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 100.0,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  "http://pluspng.com/img-png/kfc-png-file-kfc-logo-svg-1024.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  "http://pluspng.com/img-png/kfc-png-file-kfc-logo-svg-1024.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  "http://pluspng.com/img-png/kfc-png-file-kfc-logo-svg-1024.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  "http://pluspng.com/img-png/kfc-png-file-kfc-logo-svg-1024.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  "http://pluspng.com/img-png/kfc-png-file-kfc-logo-svg-1024.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  "http://pluspng.com/img-png/kfc-png-file-kfc-logo-svg-1024.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                  "http://pluspng.com/img-png/kfc-png-file-kfc-logo-svg-1024.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Container(
                      width: screenSize.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Lorem Ipsum is simply Dummy text of the printing and type setting industry. Lorem Ipsum has been the industry standard dummy text level in the since the 1500s",
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  delegate: SliverChildListDelegate(
                    [
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.call_to_action,
                                  color: Colors.lightBlue[600], size: 50),
                              Text("ACTION")
                            ],
                          ),
                          //onTap: _callCategory,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.call_to_action,
                                  color: Colors.lightBlue[600], size: 50),
                              Text("ACTION")
                            ],
                          ),
                          // onTap: _callCategory,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.call_to_action,
                                  color: Colors.lightBlue[600], size: 50),
                              Text("ACTION")
                            ],
                          ),
                          //onTap: _callCategory,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.call_to_action,
                                  color: Colors.lightBlue[600], size: 50),
                              Text("ACTION")
                            ],
                          ),
                          // onTap: _callCategory,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.call_to_action,
                                  color: Colors.lightBlue[600], size: 50),
                              Text("ACTION")
                            ],
                          ),
                          //onTap: _callCategory,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                      Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.call_to_action,
                                  color: Colors.lightBlue[600], size: 50),
                              Text("ACTION")
                            ],
                          ),
                          // onTap: _callCategory,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          backgroundColor: Color.fromRGBO(98, 0, 238, 0.9),
          onTap: _onItemTapped,
        ));
  }
}

class HeaderWidget extends StatelessWidget {
  final String text;

  HeaderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(text),
      color: Colors.grey[200],
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;

  BodyWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}
