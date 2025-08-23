import 'package:doniranjeorgana_desktop/models/osiguranje.dart';
import 'package:doniranjeorgana_desktop/models/pacijent_osiguranje.dart';
import 'package:doniranjeorgana_desktop/providers/osiguranje_provider.dart';
import 'package:doniranjeorgana_desktop/providers/pacijent_osiguranje_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:doniranjeorgana_desktop/models/pacijent.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/pacijent_provider.dart';

class PatientInformationScreen extends StatefulWidget {
  final Pacijent? pacijent;

  PatientInformationScreen({Key? key, this.pacijent}) : super(key: key);

  @override
  State<PatientInformationScreen> createState() =>
      _PatientInformationScreenState();
}

class _PatientInformationScreenState extends State<PatientInformationScreen> {
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

  final _osiguranjeBrojController = TextEditingController();
  final _osiguranjeUstanovaController = TextEditingController();

  final _organController = TextEditingController();

  late PacijentProvider _pacijentProvider;
  late PacijentOsiguranjeProvider _pacijentOsiguranjeProvider;
  late OsiguranjeProvider _osiguranjeProvider;

  SearchResult<Pacijent>? result;
  SearchResult<Osiguranje>? osiguranjeResult;
  SearchResult<PacijentOsiguranje>? pacijentOsiguranjeResult;

  Osiguranje? _selectedOsiguranje;

  @override
  void initState() {
    super.initState();

    if (widget.pacijent != null) {
      _imeController.text = widget.pacijent!.ime ?? '';
      _prezimeController.text = widget.pacijent!.prezime ?? '';
      _telefonController.text = widget.pacijent!.telefon ?? '';
      _prebivalisteController.text = widget.pacijent!.prebivaliste ?? '';
      _spolController.text = widget.pacijent!.spol ?? '';
      _datumRodjenjaController.text =
          widget.pacijent!.datumRodjenja?.toString().split(' ').first ?? '';
      _mjestoRodjenjaController.text = widget.pacijent!.mjestoRodjenja ?? '';
      _jmbgController.text = widget.pacijent!.jmbg ?? '';

      _krvnaGrupaController.text = widget.pacijent!.krvnaGrupa ?? '';
      _rhFaktorController.text = widget.pacijent!.rhFaktor ?? '';
      _hronicneBolestiController.text = widget.pacijent!.hronicneBolesti ?? '';
      _alergijaController.text = widget.pacijent!.alergija ?? '';

      _osiguranjeBrojController.text = "";
      _osiguranjeUstanovaController.text = "";
      _organController.text =widget.pacijent!.organCekanja ?? '';
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pacijentProvider = context.read<PacijentProvider>();
    _pacijentOsiguranjeProvider = context.read<PacijentOsiguranjeProvider>();
    _osiguranjeProvider = context.read<OsiguranjeProvider>();

    _loadOsiguranja().then((_) => _loadPacijentOsiguranje());
  }

  Future<void> _loadOsiguranja() async {
    osiguranjeResult = await _osiguranjeProvider.get();
    setState(() {});
  }

  Future<void> _loadPacijentOsiguranje() async {
    if (widget.pacijent == null) return;

    pacijentOsiguranjeResult = await _pacijentOsiguranjeProvider.get();

    final pacijentOsiguranja = pacijentOsiguranjeResult?.result
        .where((po) => po.pacijentId == widget.pacijent!.pacijentId)
        .toList();

    if (pacijentOsiguranja != null && pacijentOsiguranja.isNotEmpty) {
      final po = pacijentOsiguranja.first;

      _selectedOsiguranje = osiguranjeResult?.result
          .firstWhere((o) => o.osiguranjeId == po.osiguranjeId);

      _osiguranjeUstanovaController.text = _selectedOsiguranje?.osiguranik ?? '';

      setState(() {});
    }
  }

  void _savePacijent() async {
    if (_formKey.currentState!.validate()) {
      try {
        final pacijentData = {
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
          "osiguranjeBroj": _osiguranjeBrojController.text,
          "osiguranjeUstanova": _osiguranjeUstanovaController.text,
          "organCekanja": _organController.text,
        };

        if (widget.pacijent == null) {
          await _pacijentProvider.insert(pacijentData);
        } else {
          await _pacijentProvider.update(
              widget.pacijent!.pacijentId!, pacijentData);
        }

        Navigator.pop(context, true);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Greška pri spremanju pacijenta: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final sectionStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400),
    );

    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.pacijent == null ? "Add patient" : "Patient details"),
        backgroundColor: const Color(0xFF2A9D8F),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSection("📌 Lični podaci", [
              _buildTextField("First name", _imeController, sectionStyle),
              _buildTextField("Last name", _prezimeController, sectionStyle),
              _buildTextField("Gender", _spolController, sectionStyle),
              _buildTextField(
                  "Birth date", _datumRodjenjaController, sectionStyle),
              _buildTextField(
                  "Birth city", _mjestoRodjenjaController, sectionStyle),
              _buildTextField("City", _prebivalisteController, sectionStyle),
              _buildTextField("Phone number", _telefonController, sectionStyle),
              _buildTextField("JMBG", _jmbgController, sectionStyle),
            ]),
            _buildSection("🩺 Medicinski podaci", [
              _buildTextField(
                  "Blood type", _krvnaGrupaController, sectionStyle),
              _buildTextField("Rh factor", _rhFaktorController, sectionStyle),
              _buildTextField(
                  "Hronic disease", _hronicneBolestiController, sectionStyle),
              _buildTextField("Allergy", _alergijaController, sectionStyle),
            ]),
            _buildSection("💳 Osiguranje", [
              _buildTextField("Insurance provider",
                  _osiguranjeUstanovaController, sectionStyle),
            ]),
            _buildSection("🫀 Organ čekanja", [
              _buildTextField("Organ", _organController, sectionStyle),
            ]),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: _savePacijent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2A9D8F),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                icon: Icon(Icons.save),
                label: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> fields) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87)),
            const Divider(),
            ...fields,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, InputBorder border) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
}
