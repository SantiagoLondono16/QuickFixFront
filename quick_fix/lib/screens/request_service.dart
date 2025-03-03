import 'package:flutter/material.dart';

class RequestServiceScreen extends StatefulWidget {
  const RequestServiceScreen({super.key});

  @override
  State<RequestServiceScreen> createState() => _RequestServiceScreenState();
}

class _RequestServiceScreenState extends State<RequestServiceScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String _selectedPaymentMethod = "Tarjeta de Credito";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solicitud de Servicio"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Precio",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            // Campo de texto para ingresar el precio
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Ingresar Precio",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Campo de texto para ingresar la fecha del servicio
            const Text(
              "Fecha del Sevicio",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(
                hintText: "Seleccionar fecha",
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dateController.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            // Sección de método de pago
            const Text(
              "Metodo de Pago",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            _buildPaymentOption("Tarjeta de Credito", Icons.credit_card),
            _buildPaymentOption("PayPal", Icons.account_balance_wallet),
            _buildPaymentOption("Efectivo", Icons.money),

            const SizedBox(height: 30),

            // Botón de confirmación
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _confirmRequest();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text("Confirmar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para cada método de pago
  Widget _buildPaymentOption(String method, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(method),
      trailing: Radio<String>(
        value: method,
        groupValue: _selectedPaymentMethod,
        onChanged: (String? value) {
          setState(() {
            _selectedPaymentMethod = value!;
          });
        },
      ),
    );
  }

  // Función para confirmar la solicitud
  void _confirmRequest() {
    String price = _priceController.text;
    String date = _dateController.text;
    if (price.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor ingresar precio")),
      );
      return;
    }
    if (date.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor seleccionar fecha")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              "solicitud del servicio exitosa con el metodo de Pago  $_selectedPaymentMethod por el Precio de  \$$price el $date")),
    );
  }
}
