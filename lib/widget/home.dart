import 'dart:math';
import 'package:expenses/widget/components/chart.dart';
import 'package:flutter/material.dart';
import '../model/trasaction_model.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      title: 'tr0',
      id: 'da',
      value: 879,
      date: DateTime.now().subtract(
        Duration(days: 3),
      ),
    ),
    Transaction(
      title: 'tr2',
      id: 'da',
      value: 879,
      date: DateTime.now().subtract(
        Duration(days: 3),
      ),
    ),
    Transaction(
      title: 'tr2',
      id: 'da',
      value: 879,
      date: DateTime.now().subtract(
        Duration(days: 3),
      ),
    ),
    Transaction(
        title: 'tr2',
        id: 'da',
        value: 879,
        date: DateTime.now().subtract(
          Duration(days: 1),
        )),
  ];

  List<Transaction> get _recentTransaction {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransaction),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
