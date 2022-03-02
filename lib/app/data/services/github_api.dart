import 'dart:math';

import 'package:github_profile/app/data/dio_client.dart';
import 'package:github_profile/app/data/endpoints.dart';
import 'package:github_profile/app/data/models/user_profile.dart';
import 'package:github_profile/app/data/models/user_repos.dart';

class GithubApi {
  DioClient _client = DioClient();

  //for user profile
  Future<UserProfile> getUserProfile({required String userName}) async {
    try {
      final response = await _client.get('${Endpoints.usersProfile}/$userName');
      return UserProfile.fromJson(response);
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }

  //for user repos
  Future<List<Repos>> getRepos({required String userName}) async {
    try {
      final List response = await _client
          .get('${Endpoints.usersProfile}/$userName/${Endpoints.repos}');

      return response.map((item) => Repos.fromMap(item)).toList();
    } catch (e) {
      throw e;
    }
  }

  //for user repos

}
