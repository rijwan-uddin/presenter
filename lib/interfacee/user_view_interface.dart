abstract class UserViewInterface {
  void showUserData(String userName, int userAge, String address);

  void onDelete(String userName);

  void onAdd(String userName);

  void showToastMessage(String message);
}
//declare and called the function and pass with the parameter
