
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/models/bathschedule.dart';
import 'package:pet_organizer/providers/pet_selected_provider.dart';

class BathsSchedulerNotifier extends StateNotifier<List<Bathschedule>> {
  BathsSchedulerNotifier(): super([]);

  void addBath(Bathschedule schedule){
    state = [...state, schedule];
  }

  void removeBath(Bathschedule schedule){
    state = state.where((p) => p.id != schedule.id).toList();
  }
}

final bathSchedulerProvider = StateNotifierProvider<BathsSchedulerNotifier, List<Bathschedule>>(
    (ref){
      return BathsSchedulerNotifier();
    }
);

final bathSchedulerForAnimalProvider = Provider((ref){
   final idAnimal = ref.watch(idSelectionIdPetProvider) ;
   final baths = ref.watch(bathSchedulerProvider);

   return baths.where( (p) => p.idAnimal == idAnimal).toList();
});

final bathSchedulerForAnimalProvider2 = Provider.family<List<Bathschedule>, String>((ref, idAnimal){

  final baths = ref.watch(bathSchedulerProvider);

  return baths.where( (p) => p.idAnimal == idAnimal).toList();
});