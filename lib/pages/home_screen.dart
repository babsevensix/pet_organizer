import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/datas/my_pets.dart';
import 'package:pet_organizer/providers/pet_selected_provider.dart';
import 'package:pet_organizer/widgets/add_pet.dart';
import 'package:pet_organizer/widgets/into_pet.dart';
import 'package:pet_organizer/widgets/my_pets_list.dart';

import '../models/pet.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  //

  void onOpenAddDialog() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const AddPet(),
    );
  }

  void onRemovePet(Pet pet) {
    final index = myPets.indexOf(pet);
    setState(() {
      myPets.remove(pet);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Pet Removed'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              myPets.insert(index, pet);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    Pet? _selectedPet = ref.watch(getSelectedPetProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Pet Organizer',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: onOpenAddDialog,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: max(h / 4, 150),
              child: const MyPetsList(),
            ),
            const SizedBox(
              height: 15,
            ),
            _selectedPet == null ? const Text('Please select a pet') : const InfoPet(),
          ],
        ),
      ),
    );
  }
}
