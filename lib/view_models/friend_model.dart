import 'package:shopping_for_friends/base/base_model.dart';
import 'package:shopping_for_friends/models/friend.dart';
import 'package:shopping_for_friends/services/friends_service.dart';

import '../locator.dart';

class FriendModel extends BaseModel {
  FriendsService _friendService = locator<FriendsService>();

  List<Friend> get friends => _friendService.friends;

  bool dataAvailable = true;

  Future getFriends() async {
    setState(ViewState.Busy);
    try {
      await _friendService.getFriends();
      setState(ViewState.Idle);
      return Future.value(true);
    } catch (err) {
      setState(ViewState.Idle);
      return Future.error(err.toString());
    }
  }
}
