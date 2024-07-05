import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_organizer/pages/regular_procedures.dart';
import 'package:pet_organizer/theme.dart';

import '../models/pet.dart';
import '../providers/pet_selected_provider.dart';

final formatter = DateFormat('dd/MM/yyy');

class InfoPet extends ConsumerWidget {
  const InfoPet({super.key});



  void _onOpenProceduresDialog(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (ctx) {
      return const ProceduresOptionList();
    },);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pet = ref.watch(getSelectedPetProvider)!;

    return SizedBox(
      width: double.infinity,

      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pet.name.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Birthday: ${formatter.format(pet.birthDay)}' ,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon( pet.gender == Gender.male ? Icons.male : Icons.female, size: 16,),

                  Text('Sex: ${pet.gender.name.toUpperCase()}'),
                ],
              ),
              const SizedBox(height: 32,),


             Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 OutlinedButton(onPressed: (){
                   _onOpenProceduresDialog(context);
                 }, child: const Text('Procedures')),
                 OutlinedButton(onPressed: (){}, child: const Text('Services')),
                 OutlinedButton(onPressed: (){}, child: const Text('Schedule')),
               ],
             )
            ],
          ),
        ),
      ),
    );
  }
}


class ProceduresOptionList extends StatelessWidget {
  const ProceduresOptionList( {super.key});



  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 10,),
      children: [
        OptionButton(icon: Icons.healing, text: 'Regular procedures', onTap: (){
          Navigator.pop(context);
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>const RegularProceduresScreen())

          );
        }),
        OptionButton(icon: Icons.vaccines, text: 'Vaccination', onTap: (){}),
        OptionButton(icon: Icons.medical_services, text: 'Medications', onTap: (){}),
      ],
    );
  }
}


class OptionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const OptionButton(
      {required this.icon, required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(
          //   //color: Colors.black,

          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0.41),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 25.0),
        child: Row(
          children: [
            Container(
              //color: Colors.grey,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: Icon(
                icon,
                color: principalColor.withOpacity(0.8),
                size: 32,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        // child: OutlinedButton.icon(
        //   icon: Icon(icon, color: Colors.blue),
        //   label: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       text,
        //       style: TextStyle(fontSize: 18.0),
        //     ),
        //   ),
        //   onPressed: onTap,
        //   style: ButtonStyle(
        //     alignment: Alignment.centerLeft,
        //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        //       EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
