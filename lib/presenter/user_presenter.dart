import 'package:dem/interfacee/user_view_interface.dart';

import '../models/user_model.dart';
import '../models/toast_messages.dart';

class UserPresenter {
  final UserViewInterface view;

  UserPresenter(this.view);

  void loadUserData() {
    UserModel user = UserModel(name: 'dior', age: 25, address: 'dhaka mirpur');
    view.showUserData(user.name, user.age, user.address);
    view.showToastMessage(ToastMessages.dataLoaded);
  }

  void unloadUserData() {
    view.showUserData('', 0, ''); // Clear the user data
    view.showToastMessage(ToastMessages.dataUnloaded);
  }

  void handleButton2Press() {
    view.showToastMessage(ToastMessages.b2);
  }

  void handleButton3Press() {
    view.showToastMessage(ToastMessages.b3);
  }
}
