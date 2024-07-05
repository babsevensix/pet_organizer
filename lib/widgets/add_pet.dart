import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_organizer/models/pet.dart';
import 'package:pet_organizer/providers/pets_provider.dart';

final formatter = DateFormat('dd/MM/yyy');

class AddPet extends ConsumerStatefulWidget {
  const AddPet( {super.key});



  @override
  ConsumerState<AddPet> createState() => _AddPetState();
}

class _AddPetState extends ConsumerState<AddPet> {
  TextEditingController petNameController = TextEditingController();
  DateTime? birthDate;
  PetType petType = PetType.dog;
  Gender? gender = null;

  _selectBirthDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 100, 1, 1);
    final selectedBirthDate = await showDatePicker(context: context, firstDate: firstDate, lastDate: now);
    setState(() {
      birthDate = selectedBirthDate;
    });
  }

  @override
  void dispose() {
    petNameController.dispose();
    super.dispose();
  }

  _onSubmitNewPet() {
    if (petNameController.text.trim().isEmpty || birthDate == null || gender == null) {
      // Far vedere un errore all'utente
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Warning'),
          content: const Text('Fill all fields!'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text('Ok')),
          ],
        ),
      );
      return;
    }

    ref.read(petsProvider.notifier).addPet(
        Pet(
          name: petNameController.text,
          gender: gender!,
          type: petType,
          birthDay: birthDate!,
        ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
     
      child: Column(
        children: [
          
          TextField(
            controller: petNameController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Pet Name'),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).inputDecorationTheme.border!.borderSide.color,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                birthDate == null ? Text('SELECT BIRTHDAY') : Text(formatter.format(birthDate!)),
                IconButton(
                  onPressed: _selectBirthDate,
                  icon: Icon(Icons.calendar_month),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          DropdownButtonFormField(
            items: PetType.values
                .map(
                  (p) => DropdownMenuItem(
                    child: Text(p.name),
                    value: p,
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                petType = value;
              });
            },
            value: petType,
          ),
          SizedBox(height: 16,),
          DropdownButtonFormField(
            items: Gender.values
                .map(
                  (p) => DropdownMenuItem(
                    child: Text(p.name),
                    value: p,
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              setState(() {
                gender = value;
              });
            },
            value: gender,
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: _onSubmitNewPet,
                  child: Text('Save'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
