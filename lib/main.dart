import 'package:flutter/material.dart';
import 'package:in_out_app/runner.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting('ru');
  runApp(const InOutApp());
}
