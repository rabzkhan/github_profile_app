import 'package:flutter/material.dart';
import 'package:github_profile/notifer/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();

    Future<void> fetchUserInfo() async {
      await context
          .read<UserProvider>()
          .getUser(userName: userNameController.text, ctx: context);
      await context
          .read<UserProvider>()
          .getUserRepos(userName: userNameController.text, ctx: context);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://octodex.github.com/images/twenty-percent-cooler-octocat.png',
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: userNameController,
                cursorColor: Colors.white,
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.white),
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  // ignore: prefer_const_constructors
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 3.0)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Github Profile'),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                onPressed: () => fetchUserInfo()),
          )
        ],
      ),
    );
  }
}
