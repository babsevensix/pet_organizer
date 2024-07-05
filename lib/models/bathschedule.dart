import 'package:pet_organizer/models/pet.dart';

class Bathschedule{

  final String id;
  final RemindTypeSchedule remindType;
  final DateTime startDate;
  final int amount;
  final RemindTypeSchedule period;
  final String idAnimal;

  Bathschedule( this.remindType, this.startDate,this.amount, this.period, this.idAnimal):  id = uuid.v4();

}

enum RemindTypeSchedule { day, week, month, year}