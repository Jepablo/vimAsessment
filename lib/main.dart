import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assesmentvimigo/styles.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'contactDetail.dart';
import 'contactList.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),

  ));
}

class MyApp extends StatefulWidget {

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final int _numPages = 2;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.3, 0.6],
              colors: [
                Color(0xFF355FDD),
                Color(0xFF3859D7),
                Color(0xFF5036D5),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/vimigo.png',
                                  ),
                                  height: 150.0,
                                  width: 300.0,
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Text(
                                'Leading in Performance\nReward System',
                                style: title,
                              ),
                              const SizedBox(height: 40.0),
                              Text(
                                'Step 1 : Press the Contact List button on the bottom right to see all the details\n\n'
                                    'Step 2 : Enter your name and phone number if you wish to add in the list\n\n'
                                    'Step 3 : Tap on the list to view the contact details\n\n'
                                    'Step 4 : You can search the contact list using name',
                                style: subtitle,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _currentPage != _numPages
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ContactList()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'Open Contact List',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : const Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}