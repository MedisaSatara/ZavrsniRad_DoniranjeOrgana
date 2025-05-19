import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/donorski_formular.dart';
import 'package:doniranjeorgana_mobile/models/pacijent.dart';
import 'package:doniranjeorgana_mobile/providers/donorski_formular_provider.dart';
import 'package:doniranjeorgana_mobile/providers/pacijent_provider.dart';
import 'package:doniranjeorgana_mobile/widgets/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:signature/signature.dart';

class DonorskiFormularScreen extends StatefulWidget {
  final Function? onDataChanged;
  final String? korisnikIme;

  DonorskiFormularScreen({Key? key, this.onDataChanged, this.korisnikIme})
      : super(key: key);

  @override
  State<DonorskiFormularScreen> createState() => _DonorskiFormularScreen();
}

class _DonorskiFormularScreen extends State<DonorskiFormularScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late DonorskiFormularProvider _donorskiFormularProvider;
  late PacijentProvider _pacijentProvider;

  List<Pacijent>? _pacijenti;
  String? _selectedPacijentId;

  final controller = SignatureController(
      penColor: Colors.white,
      penStrokeWidth: 3,
      exportPenColor: Colors.red,
      exportBackgroundColor: Colors.black);
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _donorskiFormularProvider = context.read<DonorskiFormularProvider>();
    _pacijentProvider = context.read<PacijentProvider>();
    _fetchPatients();
  }

  Future<void> _fetchPatients() async {
    try {
      var pacijentiData = await _pacijentProvider.get();
      setState(() {
        _pacijenti = pacijentiData.result;
      });
    } catch (e) {
      print('Error fetching patients: $e');
    }
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green[400],
        duration: Duration(seconds: 3),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.saveAndValidate()) {
      final formData = _formKey.currentState!.value;

      final mutableFormData = Map<String, dynamic>.from(formData);

      if (mutableFormData['pacijentId'] != null) {
        mutableFormData['pacijentId'] =
            int.tryParse(mutableFormData['pacijentId'] as String) ?? 0;
      }

      try {
        await _donorskiFormularProvider
            .insert(DonorskiFormular.fromJson(mutableFormData));
        _showSuccessMessage('Appointment successfully added!');

        if (widget.onDataChanged != null) {
          widget.onDataChanged!();
        }

        Navigator.of(context).pop();
      } catch (e) {
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
                  Text('Failed to save the appointment. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      title: "Organ donor form",
      child: Center(
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.korisnikIme != null &&
                      widget.korisnikIme!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Ime korisnika: ${widget.korisnikIme}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  buildForm(),
                  Text(
                    'Vaš elektronski potpis:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[100],
                    ),
                    height: 150,
                    child: Signature(
                      controller: controller,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.save),
                        label: Text("Spremi potpis"),
                        onPressed: () async {
                          if (controller.isNotEmpty) {
                            final signature = await controller.toPngBytes();
                            if (signature != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Potpis je spremljen!')),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 190, 36, 25),
                          foregroundColor: Colors.white,
                        ),
                      ),
                      OutlinedButton.icon(
                        icon: Icon(Icons.clear),
                        label: Text("Očisti"),
                        onPressed: () => controller.clear(),
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 190, 36, 25),
                          side: BorderSide(
                              color: const Color.fromARGB(255, 190, 36, 25)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Fill out the donor form for yourself',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),

          FormBuilderTextField(
            name: "datumPrijave",
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Date of Application",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (selectedDate != null) {
                String formattedDate =
                    "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

                _formKey.currentState?.fields['datumPrijave']
                    ?.didChange(formattedDate);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required! Format: yyyy-MM-dd';
              }
              return null;
            },
          ),
          SizedBox(height: 20),

          FormBuilderTextField(
            name: "organiZaDonaciju",
            decoration: InputDecoration(
              labelText: "Organs for Donation",
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey.shade100,
              hintText: "Enter organs separated by commas",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required!';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          SizedBox(height: 20),

          FormBuilderCheckbox(
            name: 'saglasnost',
            title: Text('Saglasan sam sa doniranjem'),
            validator: (value) {
              if (value != true) {
                return 'Morate dati saglasnost!';
              }
              return null;
            },
          ),
          SizedBox(height: 20),

          FormBuilderDropdown<String>(
            name: 'nacinSaglasnosti',
            decoration: InputDecoration(
              labelText: 'Način saglasnosti',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            items: [
              DropdownMenuItem(value: 'Pismena', child: Text('Pismena')),
              DropdownMenuItem(value: 'Usmena', child: Text('Usmena')),
              DropdownMenuItem(
                  value: 'Elektronska', child: Text('Elektronska')),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Odaberite način saglasnosti';
              }
              return null;
            },
          ),
          SizedBox(height: 20),

          FormBuilderDropdown<String>(
            name: 'statusPrijave',
            decoration: InputDecoration(
              labelText: 'Status prijave',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            items: [
              DropdownMenuItem(value: 'Na čekanju', child: Text('Na čekanju')),
              DropdownMenuItem(value: 'Odobrena', child: Text('Odobrena')),
              DropdownMenuItem(value: 'Odbijena', child: Text('Odbijena')),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Odaberite status prijave';
              }
              return null;
            },
          ),
          SizedBox(height: 20),

          FormBuilderTextField(
            name: 'napomena',
            decoration: InputDecoration(
              labelText: 'Napomena',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            maxLines: 3,
          ),
          SizedBox(height: 20),

          FormBuilderTextField(
            name: "datumAzuriranja",
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Datum ažuriranja",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.calendar_today, color: Colors.blueAccent),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (selectedDate != null) {
                String formattedDate =
                    "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";

                _formKey.currentState?.fields['datumAzuriranja']
                    ?.didChange(formattedDate);
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Unesite datum ažuriranja!';
              }
              return null;
            },
          ),

          FormBuilderDropdown<String>(
            name: 'pacijentId',
            decoration: InputDecoration(
              labelText: 'Select Patient',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            items: _pacijenti
                    ?.map((pacijent) => DropdownMenuItem<String>(
                          value: pacijent.pacijentId.toString(),
                          child: Text(pacijent.ime ?? ""),
                        ))
                    .toList() ??
                [],
            onChanged: (value) {
              setState(() {
                _selectedPacijentId = value;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a patient!';
              }
              return null;
            },
          ),
          SizedBox(height: 30),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
