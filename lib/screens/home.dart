import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:login_screen/screens/login_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Marvel Super Heros')),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              accountName: Text("Moaz Waleed"),
              accountEmail: Text("moaz.walead2@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/ironman.jpg"),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("images/spiderman.jpg"),
                )
              ],
            ),
            ListTile(
              title: Text("Inbox"),
              leading: Icon(Icons.inbox),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              title: Text("Chat"),
              leading: Icon(Icons.chat),
            ),
            Divider(
              thickness: 1,
            ),
            FlatButton(
              padding: EdgeInsets.all(-5),
              onPressed: () {
                try {
                  final user = _auth.signOut();
                  if (user != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: ListTile(
                title: Text("Log out"),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
        ],
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: 200,
              height: 100,
              child: FlatButton(
                color: Colors.red,
                child: Card(
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      "Iron Man",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onPressed: () {
                  final player = AudioCache();
                  player.play("ironman.mp3");
                },
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: FlatButton(
                color: Colors.yellow,
                child: Card(
                  color: Colors.yellow,
                  child: Center(
                    child: Text("Ant Man",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                onPressed: () {
                  final player = AudioCache();
                  player.play("antman.mp3");
                },
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: FlatButton(
                color: Colors.green,
                child: Card(
                  color: Colors.green,
                  child: Center(
                      child: Text(
                    "Hulk",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
                onPressed: () {
                  final player = AudioCache();
                  player.play("hulk.mp3");
                },
              ),
            ),
            Container(
              width: 200,
              height: 100,
              child: FlatButton(
                color: Colors.grey.shade900,
                child: Card(
                  color: Colors.grey.shade900,
                  child: Center(
                      child: Text(
                    "Batman",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
                onPressed: () {
                  final player = AudioCache();
                  player.play("batman.mp3");
                },
              ),
            ),
            Expanded(
              child: Image(
                height: 80,
                image: AssetImage("images/avengers.jpg"),
              ),
            ),
          ]),
    );
  }
}
