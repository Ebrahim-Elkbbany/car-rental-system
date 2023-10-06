import 'package:car_rental_system/agancy_system.dart';
import 'package:car_rental_system/car.dart';
import 'package:car_rental_system/car_owner.dart';
import 'package:car_rental_system/car_rental_page.dart';
import 'package:car_rental_system/customer.dart';

main(){
  CarOwner carOwner =CarOwner(name: 'ahmed', id: '3030', nationality: 'egyptian', contactInfo: '0000', age: 20, gender: 'male');
  CarOwner carOwner1 =CarOwner(name: 'mo', id: 'mo', nationality: 'egyptian', contactInfo: '0000', age: 20, gender: 'male');
  CarOwner carOwner2 =CarOwner(name: 'gg', id: 'gg', nationality: 'egyptian', contactInfo: '0000', age: 20, gender: 'male');
  Customer customer =Customer(name: 'yy', id: 'yy', nationality: 'egyptian', contactInfo: '050', age: 20, gender: 'male');
  AgencySystem.customers.add(customer);
  AgencySystem.carOwners.add(carOwner);
  AgencySystem.carOwners.add(carOwner1);
  AgencySystem.carOwners.add(carOwner2);
  AgencySystem.allCars.add(Car('bmw', 'x6', 2020, 50, 'true', 5555,carOwner ));
  CarRentalPage().rentalAgencyPage();
}