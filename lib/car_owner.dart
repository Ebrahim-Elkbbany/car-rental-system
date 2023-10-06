
import 'package:car_rental_system/person.dart';

class CarOwner extends Person {

  CarOwner({
    required super.name,
    required super.id,
    required super.nationality,
    required super.contactInfo,
    required super.age,
    required super.gender,
  });



  @override
  String toString() {
    return"${super.toString()}";
  }
}
