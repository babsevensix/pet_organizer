import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Pet{
  Pet({required this.name, required this.birthDay, required this.type, required this.gender}):
        id = uuid.v4();


  String id;
  String name;
  DateTime birthDay;
  PetType type;
  Gender gender;
}

enum PetType{
  cat, dog, bird,
}

enum Gender{
  male,
  female,
}