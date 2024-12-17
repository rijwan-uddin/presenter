import 'package:dem/interfacee/user_view_interface.dart';

import '../models/user_model.dart';
import '../models/toast_messages.dart';
import '../models/user_model.dart';

class UserPresenter {
  final UserViewInterface view;
  CarDataModel? _savedData;

  UserPresenter(this.view);

  void loadUserData() {
    // Simulate data loading (e.g., from an API or database)
    UserModel user = UserModel(name: 'rafiul haque', age: 25);
    view.showUserData(user.name, user.age);
    view.showToastMessage(ToastMessages.dataLoaded);
  }

  void unloadUserData() {
    view.showUserData('', 0); // Clear the user data
    view.showToastMessage(ToastMessages.dataUnloaded);
  }

  void saveCarData(String carName, String phoneNumber) {
    if (carName.isNotEmpty && phoneNumber.isNotEmpty) {
      _savedData = CarDataModel(carName: carName, phoneNumber: phoneNumber);
      view.showToastMessage(ToastMessages.saveSuccess);
    } else {
      view.showToastMessage(ToastMessages.saveFail);
    }
  }

  void showCarData() {
    if (_savedData != null) {
      view.showToastMessage("Car: ${_savedData!.carName}, Phone: ${_savedData!.phoneNumber}");
    } else {
      view.showToastMessage("No data saved yet.");
    }
  }

  void handleButton2Press() {
    view.showToastMessage(ToastMessages.b2);
  }

  void handleButton3Press(String carName, String phoneNumber) {
    saveCarData(carName, phoneNumber);
  }
}