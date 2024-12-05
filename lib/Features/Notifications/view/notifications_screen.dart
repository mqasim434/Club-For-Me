import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [const Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/no-notification.png'),
              const Text(
                'No Notifications Yet!',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
