import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/screens/home.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: Icon(Icons.add_alarm),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Hero(
                    tag: "logo",
                    child: Container(
                      child: Image.asset("images/avengers.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                cursorColor: Colors.orange,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 5,
                width: 20,
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                cursorColor: Colors.orange,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 5,
                width: 20,
              ),
              TextField(
                cursorColor: Colors.orange,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Age",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 5,
                width: 20,
              ),
              Flexible(
                child: FlatButton(
                  onPressed: () async {
                    try {
                      setState(() {
                        showSpinner = true;
                      });
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(),
                            ));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
