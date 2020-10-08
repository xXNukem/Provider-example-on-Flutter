import 'package:flutter/cupertino.dart';
import 'package:provider_example/app/viewstate.dart';

/*all of your viewmodels will extend from this base model. So you can change the state and notify listeners when you change it*/
class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
