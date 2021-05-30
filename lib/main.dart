import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:async/async.dart';

void main() {
  runApp(new MaterialApp(
    title: "Multi App",
    home: new HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _firstnameController = new TextEditingController();
  var _lastnameController = new TextEditingController();
  var _usernameController = new TextEditingController();
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var _confirmpasswordController = new TextEditingController();

  //expect data from other view
  Future _goToDetailScreen(BuildContext context) async {
    Map result = await Navigator.of(context)
        .push(new MaterialPageRoute<Map>(builder: (BuildContext context) {
      return new DetailsScreen(
        firstnameController: _firstnameController.text,
        lastnameController: _lastnameController.text,
        usernameController: _usernameController.text,
        emailController: _emailController.text,
        passwordController: _passwordController.text,
        confirmpasswordController: _confirmpasswordController.text,
      );
    }));

    if (result != null && result.containsKey('firstname')) {
      _firstnameController.text = result['firstname'].toString();
    } else {
      print('nothing');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Page One",
            style: new TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white)),
        backgroundColor: Colors.greenAccent,
      ),
      body: new Container(
        height: 500.0,
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new TextField(
                controller: _firstnameController,
                keyboardType: TextInputType.name,
                decoration: new InputDecoration(labelText: 'Enter first name'),
              ),
            ),
            new ListTile(
              title: new TextField(
                controller: _lastnameController,
                keyboardType: TextInputType.name,
                decoration: new InputDecoration(labelText: 'Enter last name'),
              ),
            ),
            new ListTile(
              title: new TextField(
                controller: _usernameController,
                keyboardType: TextInputType.name,
                decoration: new InputDecoration(labelText: 'Enter user name'),
              ),
            ),
            new ListTile(
              title: new TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(labelText: 'Enter email'),
              ),
            ),
            new ListTile(
              title: new TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: new InputDecoration(labelText: 'Enter password'),
              ),
            ),
            new ListTile(
              title: new TextField(
                controller: _confirmpasswordController,
                keyboardType: TextInputType.visiblePassword,
                decoration:
                    new InputDecoration(labelText: 'Enter confirm password'),
              ),
            ),
            new ListTile(
                title: new TextButton(
                    onPressed: () => _goToDetailScreen(context),
                    child: new Text(
                      "Submit",
                      style: new TextStyle(),
                    )))
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  final String firstnameController;
  final String lastnameController;
  final String usernameController;
  final String emailController;
  final String passwordController;
  final String confirmpasswordController;

  DetailsScreen(
      {Key key,
      this.firstnameController,
      this.lastnameController,
      this.usernameController,
      this.emailController,
      this.passwordController,
      this.confirmpasswordController})
      : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var _backFirstnameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Detail Page",
            style: new TextStyle(
                fontWeight: FontWeight.w500, color: Colors.white)),
        backgroundColor: Colors.greenAccent,
      ),
      body: new Container(
        height: 500.0,
        child: new ListView(
          children: <Widget>[
            //edit firstname
            new ListTile(
              title: new TextField(
                controller: _backFirstnameController,
                keyboardType: TextInputType.name,
                decoration: new InputDecoration(labelText: 'Back first name'),
              ),
            ),

            new ListTile(
              title: new Text("${this.widget.firstnameController}"),
            ),
            new ListTile(
              title: new Text("${this.widget.lastnameController}"),
            ),
            new ListTile(
              title: new Text("${this.widget.usernameController}"),
            ),
            new ListTile(
              title: new Text("${this.widget.emailController}"),
            ),
            new ListTile(
              title: new Text("${this.widget.passwordController}"),
            ),
            new ListTile(
              title: new Text("${this.widget.confirmpasswordController}"),
            ),
            new ListTile(
                title: new TextButton(
                    onPressed: () => {
                          Navigator.pop(context,
                              {'firstname': _backFirstnameController.text})
                        },
                    // {
                    //   var router = new MaterialPageRoute(
                    //       builder: (BuildContext context){
                    //
                    //       }
                    //   );
                    //
                    //   Navigator.of(context).push(router);
                    // },
                    child: new Text(
                      "Previous",
                      style: new TextStyle(),
                    )))
          ],
        ),
      ),
    );
  }
}
