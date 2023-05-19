import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onsubmit;
  TransactionForm(this.onsubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titlecontroller = TextEditingController();

  final valuecontroller = TextEditingController();

  _submitForm() {
    final title = titlecontroller.text;
    final value = double.tryParse(valuecontroller.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onsubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
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
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: valuecontroller,
            decoration: const InputDecoration(
              label: Text('preço R\$'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: _submitForm,
                child: const Text(
                  "nova transação ",
                  style: TextStyle(
                    color: Colors.purple,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
