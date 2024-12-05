import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: const [
          CircleAvatar(
            child: Icon(Icons.search),
          ),
          SizedBox(
            width: 4,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpeg'),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: const Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              title: Text('Alex Linderson'),
              subtitle: Row(
                children: [
                  Text('How are you today?'),
                  Text('How?'),
                ],
              ),
              trailing: Text('2 min ago'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              title: Text('Team Align'),
              subtitle: Text('Don’t miss to attend the meeting.'),
              trailing: Text('2 min ago'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              title: Text('John Ahraham'),
              subtitle: Text('Hey! Can you join the meeting?'),
              trailing: Text('2 min ago'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              title: Text('Alex Linderson'),
              subtitle: Text('How are you today?'),
              trailing: Text('2 min ago'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpeg'),
              ),
              title: Text('Alex Linderson'),
              subtitle: Text('How are you today?'),
              trailing: Text('2 min ago'),
            ),
          ],
        ),
      ),
    ));
  }
}
