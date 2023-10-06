import 'package:car_rental_system/car.dart';
import 'package:car_rental_system/customer.dart';

class ReserveCar {

  final int carId;
  final String carType;
  final Customer customer;

  ReserveCar( this.carType, this.customer, this.carId);

  double getPrice({required double dailyRate,
    required DateTime startDate,
    required DateTime endDate,}
  ) {
    double totalPrice =(endDate.day - startDate.day) * dailyRate ;
    return totalPrice;
  }



  @override
  String toString() {
    return ' \ncarType: $carType \ncarId: $carId ';
  }
}
