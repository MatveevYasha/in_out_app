import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_out_app/src/feature/bloc/main_bloc.dart';
import 'package:in_out_app/src/feature/bloc/main_event.dart';
import 'package:in_out_app/src/feature/bloc/main_state.dart';
import 'package:in_out_app/src/feature/data/database/expenses_deal_db.dart';
import 'package:in_out_app/src/feature/data/database/incomes_deal_db.dart';
import 'package:in_out_app/src/feature/home/home_page.dart';
import 'package:in_out_app/src/feature/statistics/statistics_page.dart';
import 'package:in_out_app/src/feature/transactions/transactions_page.dart';
import 'package:in_out_app/src/shared/errors/main_app_error_page/main_error_page.dart';
import 'package:in_out_app/src/shared/loading.dart';
import 'package:in_out_app/src/shared/scope/app_scope.dart';

class InOutApp extends StatelessWidget {
  final Box<ExpensesDealDB> expensesDealBox;
  final Box<IncomesDealDB> incomesDealBox;

  const InOutApp({
    required this.expensesDealBox,
    required this.incomesDealBox,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(
        expensesDealBox: expensesDealBox,
        incomesDealBox: incomesDealBox,
      )..add(InitialMainEvent()),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ru')],
        home: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return switch (state) {
              LoadingMainState() => const Loading(),
              SuccessMainState() => AppScope(
                  child: [
                    HomePage(
                      deals: state.deals,
                      incomeAmount: state.incomeAmount,
                      expensesAmount: state.expensesAmount,
                    ),
                    TransactionsPage(deals: state.deals),
                    StatisticsPage(
                      deals: state.deals,
                      incomeAmount: state.incomeAmount,
                      expensesAmount: state.expensesAmount,
                    ),
                  ],
                ),
              ErrorMainState() => const MainErrorPage(),
            };
          },
        ),
      ),
    );
  }
}
