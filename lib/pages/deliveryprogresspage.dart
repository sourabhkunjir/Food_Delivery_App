import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_coustombutton.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';


class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Icon(
              Icons.delivery_dining_outlined,
              size: 200,
            ),
            Text("Your order is successfully placed !"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Delivery in progress"),
            ),
            MyCoustomButton(
              text: "Continue foodie!",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
