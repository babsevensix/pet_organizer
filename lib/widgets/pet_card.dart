import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/models/pet.dart';
import 'package:pet_organizer/providers/pet_selected_provider.dart';

class PetCard extends ConsumerWidget {
  const PetCard(this.pet, {super.key});

  final Pet pet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idPetSelected = ref.watch(idSelectionIdPetProvider);

    return GestureDetector(
      onTap: (){
        //onSelectedPet(pet);
        ref.read(idSelectionIdPetProvider.notifier).setSelected(pet.id);
      },
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            border: idPetSelected == pet.id ? Border.all(color: Colors.black): null
          ),
          width: 150,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10,),
                child: Hero(
                  tag: 'pet-hero-${pet.id}',
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                        'assets/images/${pet.name}.jpg'
                    ),

                  ),
                )


              ),
              Text(pet.name.toUpperCase()),
            ],
          ),
        ),
      ),
    );
  }
}
