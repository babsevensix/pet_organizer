import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_organizer/models/bathschedule.dart';
import 'package:pet_organizer/providers/baths_provider.dart';
import 'package:pet_organizer/providers/pet_selected_provider.dart';

final formatter = DateFormat('dd/MM/yyyy');

class AddBathScheduleScreen extends ConsumerStatefulWidget {
  const AddBathScheduleScreen({super.key});

  @override
  ConsumerState<AddBathScheduleScreen> createState() => _AddBathScheduleScreenState();
}

class _AddBathScheduleScreenState extends ConsumerState<AddBathScheduleScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();

  int? _amount;
  RemindTypeSchedule _period = RemindTypeSchedule.day;
  RemindTypeSchedule _remindType = RemindTypeSchedule.day;

  _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String idAnimal = ref.read(idSelectionIdPetProvider)!;

      ref.read(bathSchedulerProvider.notifier).addBath(Bathschedule( _remindType,
          formatter.parse(_dateController.text) ,_amount!, _period, idAnimal));

      Navigator.of(context).pop();

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Schedule Bath'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // TextFormField(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   maxLength: 50,
              //   decoration: InputDecoration(
              //     label: Text('Name')
              //   ),
              //   validator: (value){
              //     if (value == null || value.isEmpty || value.trim().length <=1 ){
              //       return 'Must be between 1 and 50 characters';
              //     }
              //     return null;
              //   },
              //   onSaved: (value){
              //       print(value);
              //   },
              // ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        label: Text('Amount'),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty || int.tryParse(value) == null || int.parse(value) <= 0) {
                          return 'Must be a valid positive number';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _amount = int.parse(newValue!);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _period,
                      items: [
                        for (final r in RemindTypeSchedule.values)
                          DropdownMenuItem(
                            child: Text(r.name),
                            value: r,
                          )
                      ],
                      decoration: InputDecoration(
                        label: Text('Period'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      onChanged: (value) {
                        _period = value!;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _dateController,
                onTap: () async {
                  var dateSelected = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    initialDatePickerMode: DatePickerMode.year,
                  );

                  _dateController.text = dateSelected == null ? '' : formatter.format(dateSelected);
                },
                readOnly: true,
                decoration: InputDecoration(
                  label: Text('Choose a new start date'),
                  suffixIcon: Icon(Icons.edit_calendar_outlined),
                ),
                validator: (value){
                  if (value == null || value.isEmpty || value.trim().isEmpty ){
                    return 'Please select a valid date!';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 18,
              ),
              DropdownButtonFormField(
                value: _remindType,
                items: [
                  for (final r in RemindTypeSchedule.values)
                    DropdownMenuItem(
                      child: Text(r.name),
                      value: r,
                    )
                ],
                decoration: InputDecoration(
                  label: Text('Remind'),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onChanged: (value) {
                  _remindType = value!;
                },
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: _saveItem, child: Text('Salva'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
