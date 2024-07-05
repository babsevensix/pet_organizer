
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/providers/pets_provider.dart';

class IdPetSelectedNotifier extends StateNotifier<String?>{
  IdPetSelectedNotifier(): super(null);

  void setSelected(String id){
    state = id;
  }

  void clearSelection(){
    state = null;
  }
}

final idSelectionIdPetProvider = StateNotifierProvider<IdPetSelectedNotifier, String?>((ref){
  return IdPetSelectedNotifier();
});

final getSelectedPetProvider = Provider((ref){
  final idSelectedPet = ref.watch(idSelectionIdPetProvider);
  final myPetsList = ref.watch(petsProvider);

  if (idSelectedPet != null){
    return myPetsList.firstWhere((p) {
      return p.id == idSelectedPet;
    });
  } else {
    return null;
  }

});