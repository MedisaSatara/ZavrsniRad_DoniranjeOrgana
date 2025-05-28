import 'dart:async';

import 'package:doniranjeorgana_desktop/models/pacijent.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/pacijent_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientDetailsScreen extends StatefulWidget {
  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _imeController = TextEditingController();
  final _prezimeController = TextEditingController();
  final _telefonController = TextEditingController();
  final _prebivalisteController = TextEditingController();
  final _spolController = TextEditingController();
  final _datumRodjenjaController = TextEditingController();
  final _mjestoRodjenjaController = TextEditingController();
  final _jmbgController = TextEditingController();
  final _krvnaGrupaController = TextEditingController();
  final _rhFaktorController = TextEditingController();
  final _hronicneBolestiController = TextEditingController();
  final _alergijaController = TextEditingController();

  late PacijentProvider _pacijentProvider;
  Timer? _debounce;
  SearchResult<Pacijent>? result;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pacijentProvider = context.read<PacijentProvider>();
  }

  void _savePacijent() async {
    if (_formKey.currentState!.validate()) {
      try {
        await _pacijentProvider.insert({
          "ime": _imeController.text,
          "prezime": _prezimeController.text,
          "telefon": _telefonController.text,
          "prebivaliste": _prebivalisteController.text,
          "spol": _spolController.text,
          "datumRodjenja": _datumRodjenjaController.text,
          "mjestoRodjenja": _mjestoRodjenjaController.text,
          "jmbg": _jmbgController.text,
          "krvnaGrupa": _krvnaGrupaController.text,
          "rhFaktor": _rhFaktorController.text,
          "hronicneBolesti": _hronicneBolestiController.text,
          "alergija": _alergijaController.text,
        });
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Greška pri dodavanju pacijenta: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final fieldStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Add patient"),
        backgroundColor: const Color(0xFF2A9D8F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1000),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _buildTextField(
                            "First name", _imeController, fieldStyle),
                        _buildTextField(
                            "Last name", _prezimeController, fieldStyle),
                        _buildTextField(
                            "Phone number", _telefonController, fieldStyle),
                        _buildTextField(
                            "City", _prebivalisteController, fieldStyle),
                        _buildTextField("Gender", _spolController, fieldStyle),
                        _buildTextField(
                            "Birth date", _datumRodjenjaController, fieldStyle),
                        _buildTextField("Birth city", _mjestoRodjenjaController,
                            fieldStyle),
                        _buildTextField("JMBG", _jmbgController, fieldStyle),
                        _buildTextField(
                            "Blood type", _krvnaGrupaController, fieldStyle),
                        _buildTextField(
                            "Rh factor", _rhFaktorController, fieldStyle),
                        _buildTextField(
                            "Allergy", _alergijaController, fieldStyle),
                        _buildTextField("Hronic disease",
                            _hronicneBolestiController, fieldStyle),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _savePacijent,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2A9D8F),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        icon: Icon(Icons.save),
                        label: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, InputBorder border) {
    return SizedBox(
      width: 450,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.grey[100],
          border: border,
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: const Color(0xFF2A9D8F), width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Required data' : null,
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Transform.translate(
        offset: Offset(0, -40),
        child: Card(
          elevation: 5.0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          shadowColor: Colors.black.withOpacity(0.3),
          child: Container(
            width: 400,
            height: 300,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Search patients:",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Name",
                  ),
                  controller: _imeController,
                ),
                SizedBox(height: 8.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Last name",
                  ),
                  controller: _prezimeController,
                ),
                SizedBox(height: 8.0),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    var data = await _pacijentProvider.get(filter: {
                      'imePacijenta': _imeController.text.trim().toLowerCase(),
                      'prezimePacijenta':
                          _prezimeController.text.trim().toLowerCase(),
                    });
                    setState(() {
                      result = data;
                    });
                  },
                  child: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 63, 125, 137),
                    elevation: 5.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 12.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      var data = await _pacijentProvider.get(filter: {
        'imePacijenta': _imeController.text.trim().toLowerCase(),
        'prezimePacijenta': _prezimeController.text.trim().toLowerCase(),
      });
      setState(() {
        result = data;
      });
    });
  }
}
