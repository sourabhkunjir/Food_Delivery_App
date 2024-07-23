import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/services/auth_loginorregistertoggle_services.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          // First stack layer: Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/crystalbackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Second stack layer: Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text(
                  'Welcome to our app!',
                  style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.secondary),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginOrRegisterPage()),
                    );
                  },
                  child: const Text('Get Started'),
                ),
                const SizedBox(height: 50),
                // Container with rounded corners
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: const BorderRadius.all(Radius.circular(20)), 
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        'Delicious Food Delivered to You',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '• Fresh ingredients\n'
                        '• Quick delivery\n'
                        '• Best customer service',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
