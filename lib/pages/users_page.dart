import 'package:flutter/material.dart';
import 'package:realtime_chat/models/user.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final users = [
    User(uid: '1', name: 'Diana', email: 'test1@test.com', online: true),
    User(uid: '2', name: 'Paul', email: 'test2@test.com', online: false),
    User(uid: '3', name: 'Andrea', email: 'test3@test.com', online: true),
    User(uid: '4', name: 'Sara', email: 'test4@test.com', online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Name',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
              onPressed: () {}),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (_, i) => ListTile(
            leading: CircleAvatar(
              child: Text(users[i].name.substring(0, 2)),
            ),
            title: Text(users[i].name),
            trailing: Container(
              width: 12.0,
              height: 12.0,
              decoration: BoxDecoration(
                  color: users[i].online ? Colors.green[300] : Colors.red,
                  shape: BoxShape.circle),
            ),
          ),
          separatorBuilder: (_, i) => Divider(),
          itemCount: users.length,
        ));
  }
}
