import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return PaymentFormState();
  }
}

class PaymentFormState extends State<PaymentForm> {
  DateTime? _selectedDate;

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _duoDateController = TextEditingController();
  final TextEditingController _paymentDateController = TextEditingController();

  selectDate(context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2025),
    );
    return pickedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Descrição"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.monetization_on_outlined),
                      hintText: "Valor"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                child: TextFormField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? picker = await selectDate(context);
                    if (picker != null) {
                      _selectedDate = picker;
                      _duoDateController.text =
                          DateFormat('dd/MM/yyyy').format(picker);
                    }
                  },
                  controller: _duoDateController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), hintText: "Vencimento"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                child: TextFormField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? picker = await selectDate(context);
                    if (picker != null) {
                      _selectedDate = picker;
                      _paymentDateController.text =
                          DateFormat('dd/MM/yyyy').format(picker);
                    }
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      hintText: "Data Pagamento"),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5.0),
                width: double.infinity,
                child: ElevatedButton(
                    child: const Text("Salvar"),
                    onPressed: () {
                      
                      Navigator.pop(context,
                          true); 
                    }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
