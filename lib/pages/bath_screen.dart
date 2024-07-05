import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_organizer/pages/add_bath_schedule_screen.dart';
import 'package:pet_organizer/providers/pet_selected_provider.dart';
import 'package:pet_organizer/theme.dart';

import '../providers/baths_provider.dart';

class BathScreen extends ConsumerWidget {
  const BathScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final bathsForSelectedAniaml = ref.watch(bathSchedulerForAnimalProvider);

    final idAnimal = ref.watch(idSelectionIdPetProvider)!;
    final bathsForSelectedAniaml = ref.watch(bathSchedulerForAnimalProvider2(idAnimal));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bath'),
      ),
      body: bathsForSelectedAniaml.isEmpty
          ? NoRecord()
          : Column(
              children: [
                SizedBox(height: 14,),
                Text(
                  'Schedules',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 6,),
                Expanded(
                  child: ListView.builder(
                      itemCount: bathsForSelectedAniaml.length,
                      itemBuilder: (ctx, idx) {
                        final bathSchedule = bathsForSelectedAniaml[idx];

                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(child: Text('Repeat every')),
                                Expanded(child: Text('${bathSchedule.amount} ${bathSchedule.period.name}')),
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AddBathScheduleScreen()));
        },
        backgroundColor: principalColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(48))),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class NoRecord extends StatelessWidget {
  const NoRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No record',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black87,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'To add entry, click add',
              style: Theme.of(context).textTheme.labelMedium!,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'at the bottom of the screen',
              style: Theme.of(context).textTheme.labelMedium!,
            )
          ],
        ),
      ],
    );
  }
}
