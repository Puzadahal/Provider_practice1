

import 'package:flutter/material.dart';
import 'package:practice/provider/post_provider.dart';
import 'package:provider/provider.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  void _retryConnection() {
    Future.microtask(() async {
      final postController =
          Provider.of<PostController>(context, listen: false);
      await postController.getPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 const Spacer(), // Pushes content to center vertically
                Icon(
                  Icons.wifi_off,
                  size: 100,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(height: 24),
                Text(
                  "No Internet Connection",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Please check your connection and try again.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 50),
                 // increased spacing here
                 Expanded(child: SizedBox()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton.icon(
                    onPressed: _retryConnection,
                    icon: const Icon(Icons.refresh,color: Colors.white,), // retry icon
                    label: const Text("Try Again",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color.fromARGB(255, 112, 164, 206),
                    ),
                  ),
                ),
                SizedBox(height: 60,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
