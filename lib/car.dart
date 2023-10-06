import 'package:car_rental_system/car_owner.dart';

class Car {
  CarOwner carOwner;
  int carId;
  String kindOfCar;
  String model;
  int year;
  double dailyRate;
  String isAvailable;
  Car(this.kindOfCar, this.model, this.year, this.dailyRate, this.isAvailable,this.carId,this.carOwner);




  @override
  String toString() {
    return '''
     KindOfCar:$kindOfCar
     Model:$model 
     Year:$year   
     Car id:$carId
     Daily Rate:\$${dailyRate.toStringAsFixed(2)}
     Car Owner: \n${carOwner.name}
       ''';
  }
}

