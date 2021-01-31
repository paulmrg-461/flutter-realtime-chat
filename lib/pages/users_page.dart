import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:realtime_chat/services/auth_service.dart';
import 'package:realtime_chat/services/socket_service.dart';
import 'package:realtime_chat/models/user.dart';
import 'package:realtime_chat/services/users_service.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final usersService = new UsersService();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<User> users = [];

  @override
  void initState() {
    this._loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    final user = authService.user;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            user.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
              onPressed: () {
                socketService.disconnect();
                Navigator.pushReplacementNamed(context, 'login');
                AuthService.deleteToken();
              }),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              child: (socketService.serverStatus == ServerStatus.Online)
                  ? Icon(
                      Icons.check_circle,
                      color: Colors.blue[400],
                    )
                  : Icon(
                      Icons.offline_bolt,
                      color: Colors.red.withOpacity(0.7),
                    ),
            ),
          ],
        ),
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: _loadUsers,
            header: WaterDropHeader(
              complete: Icon(
                Icons.check_circle,
                color: Colors.blue[400],
              ),
              waterDropColor: Colors.blue[400],
            ),
            child: _usersListView()));
  }

  ListView _usersListView() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (_, i) => _userListTile(users[i]),
      separatorBuilder: (_, i) => Divider(),
      itemCount: users.length,
    );
  }

  ListTile _userListTile(User user) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(user.name.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
            color:
                user.online ? Colors.green[300] : Colors.red.withOpacity(0.7),
            shape: BoxShape.circle),
      ),
    );
  }

  _loadUsers() async {
    this.users = await usersService.getUsers();
    setState(() {});
    //await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
