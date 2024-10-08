import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtreme_fitness/landingpages/pages/network/networkcontroller.dart';

class ServerErrorPage extends StatelessWidget {
  final VoidCallback? callback;
  const ServerErrorPage({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            const Text(
              'Server Error',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Something went wrong on the server. Please try again later.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: callback,
                child: const Text(
                  'Retry',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
