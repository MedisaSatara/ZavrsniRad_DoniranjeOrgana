import 'package:flutter/material.dart';

class MailScreen extends StatefulWidget {
  @override
  _MailScreenState createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _krvnaGrupaController = TextEditingController();
  final TextEditingController _porukaController = TextEditingController();

  @override
  void dispose() {
    _krvnaGrupaController.dispose();
    _porukaController.dispose();
    super.dispose();
  }

  void _posaljiMail() {
    if (_formKey.currentState!.validate()) {
      final krvnaGrupa = _krvnaGrupaController.text;
      final poruka = _porukaController.text;

      print("Šaljem mail donorima s krvnom grupom: $krvnaGrupa");
      print("Poruka: $poruka");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Poruka poslana donorima sa krvnom grupom $krvnaGrupa')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pošalji poruku donorima"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Unesite krvnu grupu:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _krvnaGrupaController,
                decoration: InputDecoration(
                  hintText: "npr. A+, B-, AB+...",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Unesite krvnu grupu";
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              Text(
                "Poruka za donore:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _porukaController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Unesite poruku koju želite poslati...",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Unesite poruku";
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton.icon(
                  onPressed: _posaljiMail,
                  icon: Icon(Icons.send),
                  label: Text("Pošalji"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
