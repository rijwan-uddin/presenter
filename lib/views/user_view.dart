import 'package:dem/interfacee/user_view_interface.dart';
import 'package:dem/presenter/user_presenter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> implements UserViewInterface {
  late UserPresenter _presenter;
  String _userName = '';
  int _userAge = 0;
  String _userAddr = '';

  @override
  void initState() {
    super.initState();
    _presenter = UserPresenter(this);
  }

  @override
  void showUserData(String userName, int userAge, String address) {
    setState(() {
      _userName = userName;
      _userAge = userAge;
      _userAddr = address;
    });
  }

  @override
  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $_userName', style: const TextStyle(fontSize: 20)),
            Text('Age: $_userAge', style: const TextStyle(fontSize: 20)),
            Text('add: $_userAddr', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _presenter.loadUserData();
              },
              child: const Text('Load User Data'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _presenter.unloadUserData();
              },
              child: const Text('Unload User Data'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _presenter.handleButton2Press();
              },
              child: const Text('Practice'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _presenter.handleButton3Press();
              },
              child: const Text('Tap here'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onAdd(String userName) {
    // TODO: implement onAdd
  }

  @override
  void onDelete(String userName) {
    // TODO: implement onDelete
  }
}




