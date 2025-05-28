import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/donori.dart';
import 'package:doniranjeorgana_mobile/models/donorski_formular.dart';
import 'package:doniranjeorgana_mobile/models/korisnik.dart';
import 'package:doniranjeorgana_mobile/providers/donori_provider.dart';
import 'package:doniranjeorgana_mobile/providers/donorski_formular_provider.dart';
import 'package:doniranjeorgana_mobile/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_mobile/widgets/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:signature/signature.dart';

class DonorskiFormularScreen extends StatefulWidget {
  final Function? onDataChanged;
  final String? korisnikIme;
  Donori? donor;
  final Korisnik? korisnikData;
  final DonorskiFormular? existingFormular;

  DonorskiFormularScreen(
      {Key? key,
      this.onDataChanged,
      this.korisnikIme,
      this.donor,
      this.korisnikData,
      this.existingFormular})
      : super(key: key);

  @override
  State<DonorskiFormularScreen> createState() => _DonorskiFormularScreen();
}

class _DonorskiFormularScreen extends State<DonorskiFormularScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  late DonorskiFormularProvider _donorskiFormularProvider;
  late DonoriProvider _donoriProvider;
  late KorisnikProvider _korisnikProvider;

  List<Donori>? _donori;
  Donori? _selectedDonoriId;
  DonorskiFormular? _prethodnoPopunjen;
  late TextEditingController _datumPrijaveController;

  final controller = SignatureController(
      penColor: Colors.black,
      penStrokeWidth: 3,
      exportPenColor: Colors.red,
      exportBackgroundColor: Colors.black);

  @override
  void dispose() {
    _datumPrijaveController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _datumPrijaveController = TextEditingController();
    if (widget.existingFormular != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _formKey.currentState?.patchValue({
          'datumPrijave': widget.existingFormular!.datumPrijave,
          'datumAzuriranja': widget.existingFormular!.datumAzuriranja,
          'organiZaDonaciju': widget.existingFormular!.organiZaDonaciju,
          'saglasnost': widget.existingFormular!.saglasnost == 1,
          'napomena': widget.existingFormular!.napomena,
          'potpis': widget.existingFormular!.potpis,
        });
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _donorskiFormularProvider = context.read<DonorskiFormularProvider>();
    _donoriProvider = context.read<DonoriProvider>();
    _korisnikProvider = context.read<KorisnikProvider>();

    _fetchDonori();
  }

  Future<void> _fetchDonori() async {
    try {
      var donoriData = await _donoriProvider.get();
      setState(() {
        _donori = donoriData.result;
      });

      for (var donor in _donori!) {
        if (donor.korisnikId != null) {
          var korisnik = await _korisnikProvider.getById(donor.korisnikId!);
          donor.korisnik = korisnik;
        }
      }

      setState(() {});

      if (widget.korisnikIme != null && _donori != null) {
        try {
          _selectedDonoriId = _donori!.firstWhere(
            (p) =>
                "${p.korisnik?.ime} ${p.korisnik?.prezime}" ==
                widget.korisnikIme,
          );
        } catch (e) {
          _selectedDonoriId = null;
          print('Donor not found for korisnikIme: ${widget.korisnikIme}');
        }
      }
    } catch (e) {
      print('Error fetching donori: $e');
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
    if (_formKey.currentState?.saveAndValidate() != true) return;

    final formData = _formKey.currentState!.value;
    final mutableFormData = Map<String, dynamic>.from(formData);

    if (_selectedDonoriId != null) {
      mutableFormData['donoriId'] = _selectedDonoriId!.donorId!;
    }

    if (mutableFormData['datumPrijave'] != null &&
        mutableFormData['datumPrijave'] is DateTime) {
      DateTime date = mutableFormData['datumPrijave'];
      mutableFormData['datumPrijave'] = DateFormat('yyyy-MM-dd').format(date);
    }

    if (mutableFormData['datumAzuriranja'] != null &&
        mutableFormData['datumAzuriranja'] is DateTime) {
      DateTime date = mutableFormData['datumAzuriranja'];
      mutableFormData['datumAzuriranja'] =
          DateFormat('yyyy-MM-dd').format(date);
    }

    if (mutableFormData.containsKey('saglasnost')) {
      mutableFormData['saglasnost'] =
          mutableFormData['saglasnost'] == true ? 1 : 0;
    }

    if (controller.isNotEmpty) {
      final signatureBytes = await controller.toPngBytes();
      if (signatureBytes != null) {
        mutableFormData['potpis'] = base64Encode(signatureBytes);
      }
    }

    mutableFormData['insert'] = widget.existingFormular == null;

    try {
      if (widget.existingFormular == null) {
        await _donorskiFormularProvider
            .insert(DonorskiFormular.fromJson(mutableFormData));
        _showSuccessMessage('Donor form successfully added!');
      } else {
        mutableFormData['donorskiFormularId'] =
            widget.existingFormular!.donorskiFormularId;
        mutableFormData['insert'] = false;
        await _donorskiFormularProvider.update(
            widget.existingFormular!.donorskiFormularId!,
            DonorskiFormular.fromJson(mutableFormData));

        _showSuccessMessage('Donor form successfully updated!');
      }

      if (widget.onDataChanged != null) {
        widget.onDataChanged!();
      }

      Navigator.of(context).pop();
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save the donor. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      title: widget.existingFormular == null
          ? "Add Donor Form"
          : "Edit Donor Form",
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
                        '${widget.korisnikIme}, ${widget.existingFormular == null ? 'add your application to the donor list!' : 'edit your application'}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  buildForm(),
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
        children: [
          FormBuilderDateTimePicker(
            name: 'datumPrijave',
            inputType: InputType.date,
            format: DateFormat('yyyy-MM-dd'),
            decoration: const InputDecoration(labelText: 'Application date'),
          ),
          const SizedBox(height: 16),
          FormBuilderTextField(
            name: 'organiZaDonaciju',
            decoration: const InputDecoration(labelText: 'Organ to donate'),
          ),
          const SizedBox(height: 16),
          FormBuilderCheckbox(
            name: 'saglasnost',
            title: const Text('Do you confirm your consent to organ donation?'),
          ),
          const SizedBox(height: 16),
          FormBuilderTextField(
            name: 'napomena',
            decoration: const InputDecoration(labelText: 'Reminder'),
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          if (_selectedDonoriId != null)
            Text(
              'Donor: ${_selectedDonoriId!.korisnik?.ime} ${_selectedDonoriId!.korisnik?.prezime}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          SizedBox(height: 30),
          Text(
            'Please, add your signature',
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
                label: Text("Save"),
                onPressed: () async {
                  if (controller.isNotEmpty) {
                    final signature = await controller.toPngBytes();
                    if (signature != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Signature is saved!')),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.clear),
                label: Text("Clear"),
                onPressed: () => controller.clear(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 190, 36, 25),
                  side:
                      BorderSide(color: const Color.fromARGB(255, 190, 36, 25)),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    widget.existingFormular == null ? 'Add' : 'Update',
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
                    style: TextStyle(fontSize: 18, color: Colors.red),
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
