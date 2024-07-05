import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/datas/my_pets.dart';

import '../models/pet.dart';

// final petsProvider = Provider((ref){
//   return [...myPets].toList();
// });

class MyPetsNotifier extends StateNotifier<List<Pet>>{
  MyPetsNotifier(): super(myPets);

  void addPet(Pet newPet){

    state = [...state, newPet];
  }

  void removePet(Pet pet){
    state = state.where((p)=>p.id != pet.id).toList();
  }
}


final petsProvider = StateNotifierProvider<MyPetsNotifier, List<Pet>>((ref) {
  return MyPetsNotifier();
});