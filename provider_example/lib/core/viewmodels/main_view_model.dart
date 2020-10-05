import 'package:provider_example/app/service_locator.dart';
import 'package:provider_example/app/viewstate.dart';
import 'package:provider_example/core/models/user.dart';
import 'package:provider_example/core/services/api.dart';
import 'package:provider_example/core/viewmodels/base_model.dart';

class MainViewModel extends BaseModel {
  Api _api = locator<Api>();

  List<User> userList;

  Future<bool> getUsersFromApi() async {
    setState(ViewState.Busy);
    userList = await _api.getUserList();
    setState(ViewState.Idle);
    print(userList);
  }

  Future<bool> getUserPostFromApi(int userID) async {
    setState(ViewState.Busy);

    setState(ViewState.Idle);
    return true;
  }
}
