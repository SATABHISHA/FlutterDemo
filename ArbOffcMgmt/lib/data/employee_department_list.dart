import 'package:arb_offc/model/employee.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

import '../model/employee.dart';

class EmployeeDepartmentList extends ChangeNotifier{


  List<Employee> _designerList = [
    Employee(name: 'Abhishek Aich'),
    Employee(name: 'Ramen')
  ];

  List<Employee> _phpList = [
    Employee(name: 'Abc'),
    Employee(name: 'def')
  ];

  List<Employee> _dotNetList = [
    Employee(name: 'Arup Dutta'),
    Employee(name: 'Manish'),
    Employee(name: 'Amrit Maity'),
    Employee(name: 'Partha Pratim'),
    Employee(name: 'Amit'),
    Employee(name: 'Kola'),
    Employee(name: 'Jol Doshyu'),
  ];

  List<Employee> _mobileList = [
    Employee(name: 'Satabhisha Roy')
  ];

  UnmodifiableListView<Employee> get designer {
    return UnmodifiableListView(_designerList);
  }
  UnmodifiableListView<Employee> get dotNet {
    return UnmodifiableListView(_dotNetList);
  }
  UnmodifiableListView<Employee> get php {
    return UnmodifiableListView(_phpList);
  }
  UnmodifiableListView<Employee> get mobile {
    return UnmodifiableListView(_mobileList);
  }
  int getDesignerCount(){
   return _designerList.length;
  }
  int getDotNetCount(){
    return _dotNetList.length;
  }
   int getPhpCount(){
    return _phpList.length;
   }
   int getMobileCount(){
    return _mobileList.length;
   }

   int getCount(String department){
    int count = 0;
    if(department == 'dotnet'){
      return _dotNetList.length;
    }
    if(department == 'designer'){
      return _designerList.length;
    }
    if(department == 'mobile'){
      return _mobileList.length;
    }
    if(department == 'php'){
      return _phpList.length;
    }
    return count;
   }

   /* set setDepartment(String department){
    this.department = department;
    notifyListeners();
   }
   String get getDepartment {
    return department;
    notifyListeners();
   }*/
}