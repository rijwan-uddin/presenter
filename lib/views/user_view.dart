import 'package:dem/interfacee/user_view_interface.dart';
import 'package:dem/presenter/user_presenter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class UserView extends StatelessWidget implements UserViewInterface {
  late final UserPresenter _presenter;
  final ValueNotifier<String> _userName = ValueNotifier<String>('');
  final ValueNotifier<int> _userAge = ValueNotifier<int>(0);

  // Controllers
  final TextEditingController _carNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  UserView() {
    _presenter = UserPresenter(this);
  }

  @override
  void showUserData(String userName, int userAge) {
    _userName.value = userName;
    _userAge.value = userAge;
  }

  @override
  void showToastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void _showSavedDataModal(BuildContext context, String carName, String phoneNumber) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Saved Car Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Car Name: $carName', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            Text('Phone Number: $phoneNumber', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentModal(BuildContext context) {
    _priceController.clear(); // Clear previous input
    _addressController.clear();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Payment Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _carNameController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'Car Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _presenter.savePaymentData(
                      _carNameController.text,
                      _phoneController.text,
                      _priceController.text,
                      _addressController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Submit Payment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info Display
              ValueListenableBuilder<String>(
                valueListenable: _userName,
                builder: (context, value, child) => Text(
                  'Name: $value',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              ValueListenableBuilder<int>(
                valueListenable: _userAge,
                builder: (context, value, child) => Text(
                  'Age: $value',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),

              // Car Name Input
              TextField(
                controller: _carNameController,
                decoration: const InputDecoration(
                  labelText: 'Car Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.directions_car),
                ),
              ),
              const SizedBox(height: 10),

              // Phone Number Input
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 20),

              // Buttons
              Center(
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        _presenter.loadUserData();
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Load User Data'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        _presenter.unloadUserData();
                      },
                      icon: const Icon(Icons.clear),
                      label: const Text('Unload User Data'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent[100]),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        _presenter.saveCarData(
                            _carNameController.text, _phoneController.text);
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Save'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_carNameController.text.isNotEmpty &&
                            _phoneController.text.isNotEmpty) {
                          _showSavedDataModal(
                              context, _carNameController.text, _phoneController.text);
                        } else {
                          showToastMessage("No data to display");
                        }
                      },
                      icon: const Icon(Icons.visibility),
                      label: const Text('Show Saved Data'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[100]),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_carNameController.text.isNotEmpty &&
                            _phoneController.text.isNotEmpty) {
                          _showPaymentModal(context);
                        } else {
                          showToastMessage("Please save data first");
                        }
                      },
                      icon: const Icon(Icons.payment),
                      label: const Text('Payment'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange[100]),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
