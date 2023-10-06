

import 'dart:io';
import 'package:car_rental_system/agancy_system.dart';
import 'package:car_rental_system/car_owner.dart';
import 'customer.dart';

class CarRentalPage {

  void adminLogin(String name ,String id) {
    if(name=='admin' &&id=='admin'){
      print("What do you need ? \n1- remove carOwner \n2-remove customer ");
      int? input = int.parse(stdin.readLineSync()!);
      switch (input) {
        case 1:
          print(AgencySystem.carOwners);
          print('Enter CarOwner Name:');
          String name = stdin.readLineSync()!;
          print('Enter Car Id:');
          String id = stdin.readLineSync()!;
          AgencySystem.carOwners.remove(AgencySystem.carOwners.firstWhere((owner) => owner.id == id&&owner.name==name),);
          print(AgencySystem.carOwners);
          print( ' remove successfully');
          break ;
        case 2:
          print('Enter customer Name:');
          String name = stdin.readLineSync()!;
          print('Enter customer Id:');
          String id = stdin.readLineSync()!;
          AgencySystem.customers.remove(AgencySystem.customers.firstWhere((customers) => customers.id == id&&customers.name==name),);
          print( ' remove successfully');
          break ;
      }
    }
    else{
      print('data is un correct');
    }
  }

  void customerRegister() {
    print('Enter Name:');
    String name = stdin.readLineSync()!;
    print('Enter Id:');
    String id = stdin.readLineSync()!;
    print('Enter Nationality:');
    String nationality = stdin.readLineSync()!;
    print('Enter ContactInfo:');
    String contactInfo = stdin.readLineSync()!;
    print('Enter Gender:');
    String gender = stdin.readLineSync()!;
    print('Enter age:');
    int? age = int.parse(stdin.readLineSync()!);
    int customerNum = AgencySystem.customers.length;
    try {
      AgencySystem.customers.add(
        Customer(
          name: name,
          id: id,
          nationality: nationality,
          contactInfo: contactInfo,
          age: age,
          gender: gender,
        ),
      );
      print('Need to rent car ?? \nyes or no');
      String rentCar = stdin.readLineSync()!;
      if (rentCar == 'yes') {
        AgencySystem.reserveCar(
          AgencySystem.customers[customerNum],
        );
      } else {
        print(
            'Thanks for register to our agency\n.........................................');
      }
    } catch (e) {
      print(e.toString());
      return customerRegister();
    }
  }

  void customerValidation(String name, String id) {
    try {
      Customer? currentCustomer = AgencySystem.customers
          .firstWhere((customer) => customer.name == name && customer.id == id);
      print("What do you need ? \n1- rent car \n2-return car \n3- Logout");
      int input = int.parse(stdin.readLineSync()!);
      switch (input) {
        case 1:
          AgencySystem.reserveCar(
            currentCustomer,
          );
          return customerValidation(name, id);
        case 2:
          print('Please Enter carId');
          int carId = int.parse(stdin.readLineSync()!);
          AgencySystem.returnCar(carId);
          return customerValidation(name, id);
        case 3:
          break;
      }
    } catch (e) {
      print(
          'wrong information , please try again\n...........................');
    }
  }

  void carOwnerRegister() {
    print('Enter Name:');
    String name = stdin.readLineSync()!;
    print('Enter Id:');
    String id = stdin.readLineSync()!;
    print('Enter Nationality:');
    String nationality = stdin.readLineSync()!;
    print('Enter ContactInfo:');
    String contactInfo = stdin.readLineSync()!;
    print('Enter Gender:');
    String gender = stdin.readLineSync()!;
    print('Enter age:');
    int? age = int.parse(stdin.readLineSync()!);
    int carOwnerNum = AgencySystem.carOwners.length;
    try {
      AgencySystem.carOwners.add(
        CarOwner(
          name: name,
          id: id,
          nationality: nationality,
          contactInfo: contactInfo,
          age: age,
          gender: gender,
        ),
      );
      print('Need to add car?? \nyes or no');
      String answer = stdin.readLineSync()!;
      if (answer == 'yes') {
        AgencySystem.addCar(AgencySystem.carOwners[carOwnerNum]);
        print('Added successfully \n.........................................');
      } else {
        print(
            'Thanks for register to our agency\n.........................................');
      }
    } catch (e) {
      print(e.toString());
      return carOwnerRegister();
    }
  }

  void carOwnerValidation(String name, String id) {
    try {
      CarOwner? currentCarOwner = AgencySystem.carOwners
          .firstWhere((carOwner) => carOwner.name == name && carOwner.id == id);
      print("What do you need ? \n1- add car \n2-remove car \n3- Logout");
      int input = int.parse(stdin.readLineSync()!);
      switch (input) {
        case 1:
          AgencySystem.addCar(currentCarOwner);
          return carOwnerValidation(name, id);
        case 2:
          print('Please Enter Car Id');
          int carId = int.parse(stdin.readLineSync()!);
          print('Please Enter kindOfCar');
          String kindOfCar = stdin.readLineSync()!;
          AgencySystem.removeCar(carId, kindOfCar);
          return carOwnerValidation(name, id);
        case 3:
          break;
      }
    } catch (e) {
      print(
          'wrong information , please try again\n...........................');
    }
  }

  void rentalAgencyPage() {
    print('Welcome to our Agency:');
    print('''
    What do you need ?
    1-login as admin 
    2-Register as Customer 
    3-Register as Car Owner 
    4-Login as Customer
    5-Login as Car Owner 
    6-Back
    ''');
    int? registerType = int.parse(stdin.readLineSync()!);
    switch (registerType) {
      case 1:
        print('Enter Your Name:');
        String name = stdin.readLineSync()!;
        print('Enter Your Id:');
        String id = stdin.readLineSync()!;
        adminLogin(name,id);
        return rentalAgencyPage();
      case 2:
        customerRegister();
        return rentalAgencyPage();
      case 3:
        carOwnerRegister();
        return rentalAgencyPage();
      case 4:
        print('Enter Your Name:');
        String name = stdin.readLineSync()!;
        print('Enter Your Id:');
        String id = stdin.readLineSync()!;
        customerValidation(name, id);
        return rentalAgencyPage();
      case 5:
        print('Enter Your Name:');
        String name = stdin.readLineSync()!;
        print('Enter Your Id:');
        String id = stdin.readLineSync()!;
        carOwnerValidation(name, id);
        return rentalAgencyPage();
      case 6:
        print('you are close the app you can open it again across restart');
        break;
      default:
        {
          print('please select correct number');
          rentalAgencyPage();
        }
    }
  }

}
