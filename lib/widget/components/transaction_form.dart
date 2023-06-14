import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onsubmit;
  TransactionForm(this.onsubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titlecontroller = TextEditingController();
  final valuecontroller = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  _submitForm() {
    final title = titlecontroller.text;
    final value = double.tryParse(valuecontroller.text) ?? 0.0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onsubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickeDate) {
      if (pickeDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickeDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
          bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
              onSubmitted: (_) => _submitForm(),
              controller: titlecontroller,
              decoration: const InputDecoration(
                label: Text("Titulo"),
              ),
            ),
            TextField(
              onSubmitted: (_) => _submitForm(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: valuecontroller,
              decoration: const InputDecoration(
                label: Text('preço R\$'),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Nenhuma data selecionada'
                        : 'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                  ),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: const Text(
                      'Selecionar Data',
                      style: TextStyle(color: Colors.purple),
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Colors.purple,
                  )),
                  onPressed: _submitForm,
                  child: const Text(
                    "nova transação ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans-Bold',
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
