import 'package:car_rental_system/reserve_car.dart';
import 'dart:io';

import 'car.dart';
import 'customer.dart';
import 'car_owner.dart';

class AgencySystem {

  static List<Car> allCars = [];
  static List<ReserveCar> reservations = [];
  static List<Customer> customers = [];
  static List<CarOwner> carOwners = [];

  static ReserveCar reserveCar(Customer customer,) {
    print('AvailableCars: ${allCars.where((car) => car.isAvailable == 'true')}');
    print('Please Enter kindOfCar');
    String kindOfCar = stdin.readLineSync()!;
    print('Please Enter carId');
    int carId = int.parse(stdin.readLineSync()!);
    print('Please enter DateIn in the format yyyy-MM-dd:');
    String startDate = stdin.readLineSync()!;
    print('Please enter DateOut in the format yyyy-MM-dd:');
    String endDate = stdin.readLineSync()!;
    Car? selectedCar = allCars.firstWhere((car) => car.kindOfCar == kindOfCar && car.carId==carId);
    ReserveCar reserveCar = ReserveCar(kindOfCar, customer,selectedCar.carId);
    reservations.add(reserveCar);
    double price = reserveCar.getPrice(
      dailyRate: selectedCar.dailyRate,
      startDate: DateTime.parse(startDate),
      endDate: DateTime.parse(endDate),
    );
    selectedCar.isAvailable ='false';
    //to test
    print('AvailableCars: ${allCars.where((car) => car.isAvailable == 'false')}');
    print("${reserveCar.toString()} \ntotalPrice: ${price.toStringAsFixed(2)}");
    print('Success Reserve car\n.........................................');
    return reserveCar;
  }

  static void returnCar(int carId) {
    reservations.remove(reservations.firstWhere((reserve) => reserve.carId == carId));
    allCars.firstWhere((car) => car.carId == carId).isAvailable='true';
    print('Success Return car\n.........................................');
  }

  static void removeCar(int carId,String kindOfCar) {
    Car? removeCar =
    allCars.firstWhere((car) => car.carId == carId && car.kindOfCar ==kindOfCar);
    allCars.remove(removeCar);
    //to test
    print(allCars);
    print('Success Remove car\n.........................................');
  }

  static void addCar(CarOwner carOwner){
    print('Enter kindOfCar:');
    String kindOfCar = stdin.readLineSync()!;
    print('Enter model:');
    String model = stdin.readLineSync()!;
    print('Enter year:');
    int year = int.parse(stdin.readLineSync()!);
    print('Enter dailyRate:');
    double dailyRate = double.parse(stdin.readLineSync()!);
    print('isAvailable:');
    String isAvailable = stdin.readLineSync()!;
    print('Enter carId:');
    int carId = int.parse(stdin.readLineSync()!);
    Car car1=  Car(kindOfCar, model, year, dailyRate, isAvailable, carId,carOwner);
    allCars.add(
      car1,
    );
    //to test
    print(allCars);
  }
}
