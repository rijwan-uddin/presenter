class UserModel {
  final String name;
  final int age;

  UserModel({required this.name, required this.age});
}

class CarDataModel {
  final String carName;
  final String phoneNumber;

  CarDataModel({required this.carName, required this.phoneNumber});
}

class PaymentDataModel {
  final String carName;
  final String phoneNumber;
  final String price;
  final String address;

  PaymentDataModel({
    required this.carName,
    required this.phoneNumber,
    required this.price,
    required this.address,
  });
}
//here i  created the model class and declare the variable
