import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/widgets/pet_card.dart';
import 'package:pet_organizer/providers/pets_provider.dart';

class MyPetsList extends ConsumerWidget {
  const MyPetsList({super.key,

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPets = ref.watch(petsProvider);

    return ListView.builder(
      itemCount: myPets.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Dismissible(
        direction: DismissDirection.up,
        key: ValueKey(myPets[index]),
        child: PetCard(
          myPets[index],
        ),
        onDismissed: (direction){
          //onRemovePet(myPets[index]);
          ref.read(petsProvider.notifier).removePet(myPets[index]);

        },
      ),
    );
  }


}
