import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_drawer_tile.dart';
import 'package:fooddeliveryapp/pages/settings_page.dart';
import 'package:fooddeliveryapp/pages/splash_screen.dart';
import 'package:fooddeliveryapp/services/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  // firebase-----------------------------------
  Widget build(BuildContext context) {
    void logout() {
      final _authService = AuthService();
      _authService.signOut();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SplashScreen(),
          ));
    }
    //-----------------------------------------

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Icon(
                Icons.lock_open_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            MyDrawerTile(
                onTap: () {
                  Navigator.pop(context);
                },
                text: "H O M E",
                icon: Icons.home),
            MyDrawerTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ));
                },
                text: "S E T T I N G S",
                icon: Icons.settings),
            Spacer(),
            MyDrawerTile(
                onTap: logout, text: "L O G O U T", icon: Icons.logout),
            const SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
