import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/pages/bath_screen.dart';
import 'package:pet_organizer/providers/pet_selected_provider.dart';
import 'package:pet_organizer/widgets/into_pet.dart';

class RegularProceduresScreen extends ConsumerWidget {
  const RegularProceduresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pet = ref.watch(getSelectedPetProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Regular procedures'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Hero(
              tag: 'pet-hero-${pet.id}',
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/${pet.name}.jpg'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView(
                children: [
                  OptionButton(icon: Icons.bathtub, text: 'Bath', onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> BathScreen()));
                  }),
                  OptionButton(icon: Icons.content_cut, text: 'Claws', onTap: () {}),
                  OptionButton(icon: Icons.brush, text: 'Fur', onTap: () {}),
                  OptionButton(icon: Icons.medical_services, text: 'Teeth', onTap: () {}),
                  OptionButton(icon: Icons.bug_report, text: 'From parasites', onTap: () {}),
                  OptionButton(icon: Icons.pest_control, text: 'From fleas and ticks', onTap: () {}),
                  OptionButton(
                      icon: Icons.arrow_back,
                      text: 'Back',
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
