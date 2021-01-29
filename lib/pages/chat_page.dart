import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, i) => Text('$i'),
              reverse: true,
            )),
            Divider(
              height: 1,
            ),
            //TODO: TextBox
            Container(
              color: Colors.white,
              height: 50.0,
            )
          ],
        ),
      ),
    );
  }

  AppBar _myAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                maxRadius: 16,
                backgroundColor: Colors.blue[100],
                child: Text(
                  'Na',
                  style: TextStyle(fontSize: 12.0),
                )),
            SizedBox(
              width: 12.0,
            ),
            Text(
              'Natalia Flores',
              style: TextStyle(color: Colors.black87, fontSize: 14.0),
            ),
          ],
        ));
  }
}
