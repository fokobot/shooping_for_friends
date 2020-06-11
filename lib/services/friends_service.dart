import 'package:shopping_for_friends/locator.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/services/api.dart';


class FriendsService {
  Api _api = locator<Api>();

  List<Friend> _friends = [];
  List<Friend> get friends => _friends;

  Future getFriends() async {
    try {
      _friends = await _api.getFriends();
    } catch (err) {
      return Future.error(err.toString());
    }
  }

}
