import 'package:in_out_app/src/feature/data/entities/deal.dart';

sealed class MainState {}

class LoadingMainState extends MainState {
  LoadingMainState();
}

class SuccessMainState extends MainState {
  final List<Deal> deals;

  SuccessMainState({required this.deals});
}

class ErrorMainState extends MainState {
  ErrorMainState();
}
