import 'package:in_out_app/src/feature/data/entities/deal.dart';

sealed class MainEvent {}

class InitialMainEvent extends MainEvent {}

class AddDeal extends MainEvent {
  final Deal deal;

  AddDeal({required this.deal});
}
