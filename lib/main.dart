import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  AnimationController _animationControll;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationControll=new AnimationController(
      vsync: this,
      duration:new Duration(milliseconds: 1000 )
    );

    _animation=new CurvedAnimation(parent: _animationControll,
      curve:  Curves.elasticOut
    );
    _animationControll.addListener(()=> this.setState((){}));
    _animationControll.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(image: new AssetImage("assets/back.jpg"),
          fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode:BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size:_animationControll.value *100,

              ),
              new Form(child: Theme(
                data: new ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: new InputDecorationTheme(
                    labelStyle: new TextStyle(
                      color: Colors.teal,
                      fontSize: 30.0
                    )
                  )
                ),
                child: new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Email"
                            ),
                            keyboardType: TextInputType.emailAddress,

                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Enter Password"
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new Padding(padding: const EdgeInsets.only(top: 20.0)),
                          new MaterialButton(
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            onPressed: ()=>{},
                            splashColor: Colors.red,
                          )
                          
                        ],
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}


