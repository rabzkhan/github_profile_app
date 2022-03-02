import 'package:flutter/material.dart';
import 'package:github_profile/app/data/models/user_profile.dart';
import 'package:github_profile/app/data/models/user_repos.dart';
import 'package:github_profile/app/routes/app_routes.dart';
import 'package:github_profile/notifer/user_provider.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProfile userProfileData = context.watch<UserProvider>().user;
    final List<Repos> userRepos = context.watch<UserProvider>().userRepos;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          ListTile(
            isThreeLine: true,
            // ignore: prefer_const_constructors
            leading: Container(
              height: 140,
              width: 60,
              child: CircleAvatar(
                radius: 6,
                backgroundImage: NetworkImage(userProfileData.avatar_url),
              ),
            ),
            title: Text(
              userProfileData.name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              userProfileData.bio ?? 'NO BIO FOUND',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                const SizedBox(width: 20),
                Text(
                  '${userProfileData.followers} Followers',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 20),
                Text(
                  '${userProfileData.following} following',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Repositories',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: userRepos.map((item) {
                  return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).pushNamed(AppRoutes.webView,
                      //     arguments: item.html_url);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Card(
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
