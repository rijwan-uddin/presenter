abstract class UserViewInterface {
  void showUserData(String userName, int userAge);

  void onDelete(String userName);

  void onAdd(String userName);

  void showToastMessage(String message);
}