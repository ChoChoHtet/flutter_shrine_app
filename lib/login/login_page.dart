import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final _usernameController= TextEditingController();
  final _passwordController= TextEditingController();
  final _unfocusedColor=Colors.grey[500] ;
  final _usernameFocusedNode=FocusNode();
  final _passwordFocusedNode= FocusNode();
  
  @override
  void initState() {
    super.initState();
    _usernameFocusedNode.addListener(() {
      setState(() {

      });
    });
    _passwordFocusedNode.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox( height: 80,),
          Column(
            children: [
              Image.asset('assets/diamond.png'),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('SHRINE',
                  style: Theme.of(context).textTheme.headline5,),
              ),
              SizedBox(height: 35,),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                 // filled: true,
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: _usernameFocusedNode.hasFocus ?  Theme.of(context).accentColor : _unfocusedColor)
                ),
                focusNode: _usernameFocusedNode,
              ),
              SizedBox(height: 15,),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                   // filled: true,
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color:  _usernameFocusedNode.hasFocus ?  Theme.of(context).accentColor : _unfocusedColor)
                ),
                focusNode: _passwordFocusedNode,
                obscureText: true,
              ),
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child:
                  RaisedButton(
                      onPressed: (){
                        Navigator.pop(context);
                        //Navigator.push(context, route)
                      },
                      child: Text('Login'),elevation: 8,
                  )),
                  Expanded(
                      child: FlatButton(
                          onPressed: (){
                            _usernameController.clear();
                            _passwordController.clear();
                          }, child: Text('Cancel'))),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
