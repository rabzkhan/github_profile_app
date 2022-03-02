import 'package:flutter/material.dart';
import 'package:github_profile/app/data/dio_client.dart';
import 'package:github_profile/app/data/exceptions.dart';
import 'package:github_profile/app/data/models/user_profile.dart';
import 'package:github_profile/app/data/models/user_repos.dart';
import 'package:github_profile/app/data/services/github_api.dart';
import 'package:github_profile/app/routes/app_routes.dart';
import 'package:github_profile/screens/widget/show_custom_dialouge.dart';

class UserProvider extends ChangeNotifier {
  GithubApi _gitApi = GithubApi();
  bool isLoading = false;

  late UserProfile _user;
  UserProfile get user => _user;

  late List<Repos> _userRepos;
  List<Repos> get userRepos => _userRepos;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getUser(
      {required String userName, required BuildContext ctx}) async {
    setLoading(true);
    try {
      final response = await _gitApi.getUserProfile(userName: userName);
      _user = response;
      print(_user.avatar_url);
      setLoading(false);
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showCustomDialog(ctx, 'Error', errorMessage);
      setLoading(false);
    }
  }

  Future<void> getUserRepos(
      {required String userName, required BuildContext ctx}) async {
    setLoading(true);
    try {
      final response = await _gitApi.getRepos(userName: userName);
      _userRepos = response;
      Navigator.of(ctx).pushNamed(AppRoutes.userDetails);
      setLoading(false);
    } catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      showCustomDialog(ctx, 'Error', errorMessage);
      setLoading(false);
    }
  }
}
