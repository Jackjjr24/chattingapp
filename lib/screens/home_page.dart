import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()),
              );
          },
          )
        ]
      ),

      body: ListView(
        children: [

          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("User 1"),
            subtitle: Text("Hey There!"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChatPage(userName: "User 1"),),);
            },
          ),

          ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text("User 2"),
            subtitle: Text("What are you doing?"),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (_) => ChatPage(userName: "User 2"),),
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print("start new chat");
        },
      ),
    );
  }
}