import 'package:flutter/material.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class SubscriptionProvider extends ChangeNotifier {
  final RxSharedPreferences rxSharedPreferences;

  SubscriptionProvider(this.rxSharedPreferences) {
    getUser().then((value) {
      userData = value;
      notifyListeners();
    });
  }

  late List<String>? userData;

  // check for subscription yes/no
  Future<bool> checkSubscription() async {
    return await rxSharedPreferences.getBool('isPro') ?? false;
  }

  // getUserData = array of user params
  Future<List<String>> getUser() async {
    return await rxSharedPreferences.getStringList('userData') ?? [];
  }

  // get count of user active accounts
  Future<int> getUserAccount() async {
    List<String>? userDataList =
        await rxSharedPreferences.getStringList('userData');
    return userDataList?.length ?? 0;
  }

  // delete user profile
  Future<void> deleteUser() async {
    await rxSharedPreferences.remove('userData');
  }
}
