import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/donori.dart';
import 'package:doniranjeorgana_mobile/models/korisnik.dart';
import 'package:doniranjeorgana_mobile/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_mobile/widgets/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class PacijentPodaciScreen extends StatefulWidget {
  final Donori donori;
  final Korisnik korisnik;

  PacijentPodaciScreen({Key? key, required this.donori, required this.korisnik})
      : super(key: key);

  @override
  _PacijentPodaciScreenState createState() => _PacijentPodaciScreenState();
}

class _PacijentPodaciScreenState extends State<PacijentPodaciScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool personalInfoExpanded = false;
  bool medicalConditionExpanded = false;
  bool allergiesExpanded = false;
  bool diseaseHistoryExpanded = false;
  late KorisnikProvider _korisnikProvider;
  List<Korisnik>? korisnikResult;

  late TextEditingController _imeController;
  late TextEditingController _prezimeController;
  late TextEditingController _mjestoRodjenjaController;
  late TextEditingController _datumRodjenjaController;
  late TextEditingController _jmbgController;
  late TextEditingController _telefonController;
  late TextEditingController _prebivalisteController;
  late TextEditingController _korisnickoImeController;
  late TextEditingController _emailController;
  late TextEditingController _krvnaGrupaController;
  late TextEditingController _rhFaktorController;
  late TextEditingController _hronickeBolestiController;
  late TextEditingController _alergijaController;
  late TextEditingController _spolController;


  @override
  void initState() {
    super.initState();
    final p = widget.korisnik;
    final pd = widget.donori;
    _imeController = TextEditingController(text: p?.ime);
    _prezimeController = TextEditingController(text: p?.prezime);
    _korisnickoImeController = TextEditingController(text: p?.korisnickoIme);
    _emailController = TextEditingController(text: p?.email);
    _spolController = TextEditingController(text: p?.spol);
    _mjestoRodjenjaController = TextEditingController(text: pd?.mjestoRodjenja);
    _datumRodjenjaController = TextEditingController(text: p?.datumRodjenja);
    _jmbgController = TextEditingController(text: pd?.jmbg);
    _telefonController = TextEditingController(text: p?.telefon);
    _prebivalisteController = TextEditingController(text: pd?.prebivaliste);
    _krvnaGrupaController = TextEditingController(text: pd?.krvnaGrupa);
    _rhFaktorController = TextEditingController(text: pd?.rhFaktor);
    _hronickeBolestiController =
        TextEditingController(text: pd?.hronicneBolesti);
    _alergijaController = TextEditingController(text: pd?.alergija);

    if (widget.donori != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _formKey.currentState?.patchValue({
          'ime': widget.korisnik!.ime,
          'prezime': widget.korisnik!.prezime,
          'korisnickoIme': widget.korisnik!.korisnickoIme,
          'email': widget.korisnik!.email,
          'spol': widget.korisnik!.spol,
          'alergija': widget.donori!.alergija,
          'datumRodjenja': widget.donori!.datumRodjenja,
          'hronicneBolesti': widget.donori!.hronicneBolesti,
          'prebivaliste': widget.donori!.prebivaliste,
          'krvnaGrupa': widget.donori!.krvnaGrupa,
          'rhFaktor': widget.donori!.rhFaktor,
        });
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _korisnikProvider = context.read<KorisnikProvider>();
    _fetchKorisnici();
  }

  Future<void> _fetchKorisnici() async {
    try {
      var data = await _korisnikProvider.get();
      setState(() {
        korisnikResult = data.result.where((korisnik) {
          return korisnik.korisnikUlogas.any((uloga) => uloga.ulogaId == 2);
        }).toList();
      });
    } catch (e) {
      print('Error fetching korisnici: $e');
    }
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 130,
              child: Text(label,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))),
          Expanded(child: Text(value ?? '-', style: TextStyle(fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildProfilePicture(String? profilnaSlika) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.blueAccent,
      backgroundImage: profilnaSlika != null
          ? (profilnaSlika.startsWith('http')
              ? NetworkImage(profilnaSlika)
              : MemoryImage(base64Decode(profilnaSlika))) as ImageProvider
          : null,
      child: profilnaSlika == null
          ? Text(
              "N/A",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
              ),
            )
          : null,
    );
  }

  void _editPersonalInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Personal Information"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _imeController,
                  decoration: InputDecoration(labelText: 'First name'),
                ),
                TextField(
                  controller: _prezimeController,
                  decoration: InputDecoration(labelText: 'Last name'),
                ),
                TextField(
                  controller: _korisnickoImeController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _spolController,
                  decoration: InputDecoration(labelText: 'Gender'),
                ),
                TextField(
                  controller: _mjestoRodjenjaController,
                  decoration: InputDecoration(labelText: 'Birth city'),
                ),
                TextField(
                  controller: _datumRodjenjaController,
                  decoration: InputDecoration(labelText: 'Birth date'),
                ),
                TextField(
                  controller: _jmbgController,
                  decoration: InputDecoration(labelText: 'JMBG'),
                ),
                TextField(
                  controller: _telefonController,
                  decoration: InputDecoration(labelText: 'Phone number'),
                ),
                TextField(
                  controller: _prebivalisteController,
                  decoration: InputDecoration(labelText: 'City'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(
                onPressed: () async {
                  await _saveChanges();
                  Navigator.pop(context);
                  _fetchKorisnici();
                },
                child: Text("Save")),
          ],
        );
      },
    );
  }

  void _editAllergiesInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Allergies Information"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _alergijaController,
                  decoration: InputDecoration(labelText: 'Allergy'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(
                onPressed: () async {
                  await _saveChanges();
                  Navigator.pop(context);
                  _fetchKorisnici();
                },
                child: Text("Save")),
          ],
        );
      },
    );
  }
   void _editDiseaseHistoryInfo(){
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Disease History Information"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _hronickeBolestiController,
                  decoration: InputDecoration(labelText: 'Disease history'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(
                onPressed: () async {
                  await _saveChanges();
                  Navigator.pop(context);
                  _fetchKorisnici();
                },
                child: Text("Save")),
          ],
        );
      },
    );

   }

  void _editMedicalInfoInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Medical Information"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _krvnaGrupaController,
                  decoration: InputDecoration(labelText: 'Blood type'),
                ),
                TextField(
                  controller: _rhFaktorController,
                  decoration: InputDecoration(labelText: 'Rh factor'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Cancel")),
            ElevatedButton(
                onPressed: () async {
                  await _saveChanges();
                  Navigator.pop(context);
                  _fetchKorisnici();
                },
                child: Text("Save")),
          ],
        );
      },
    );
  }

  Future<void> _saveChanges() async {
    try {
      final updatedData = {
        'ime': _imeController.text,
        'prezime': _prezimeController.text,
        'korisnickoIme': _korisnickoImeController.text,
        'email': _emailController.text,
        'mjestoRodjenja': _mjestoRodjenjaController.text,
        'datumRodjenja': _datumRodjenjaController.text,
        'jmbg': _jmbgController.text,
        'telefon': _telefonController.text,
        'prebivaliste': _prebivalisteController.text,
        'alergija': _alergijaController.text,
        'krvnaGrupa': _krvnaGrupaController.text,
        'rhFaktor': _rhFaktorController.text,
        'hronicneBolesti': _hronickeBolestiController.text,
        'spol': _spolController.text,

      };

      await context
          .read<KorisnikProvider>()
          .update(widget.donori.korisnikId!, updatedData);

      setState(() {
        widget.korisnik?.ime = _imeController.text;
        widget.korisnik?.prezime = _prezimeController.text;
        widget.korisnik?.email = _emailController.text;
        widget.korisnik?.korisnickoIme = _korisnickoImeController.text;
        widget.korisnik?.spol = _spolController.text;
        widget.donori.mjestoRodjenja = _mjestoRodjenjaController.text;
        widget.donori.datumRodjenja = _datumRodjenjaController.text;
        widget.donori.jmbg = _jmbgController.text;
        widget.donori.telefon = _telefonController.text;
        widget.donori.prebivaliste = _prebivalisteController.text;
        widget.donori.hronicneBolesti = _hronickeBolestiController.text;
        widget.donori.krvnaGrupa = _krvnaGrupaController.text;
        widget.donori.rhFaktor = _rhFaktorController.text;
        widget.donori.alergija = _alergijaController.text;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User data successufully added.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error while editing data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.donori;
    final korisnik =
        korisnikResult?.firstWhere((k) => k.korisnikId == p.korisnikId);

    return MasterScreenWidget(
      title: "User profile",
      child: korisnikResult != null
          ? SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        _buildProfilePicture(korisnik?.slika),
                        SizedBox(height: 12),
                        Text(korisnik?.korisnickoIme ?? "",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color:
                                    const Color.fromARGB(255, 255, 255, 255))),
                        SizedBox(height: 4),
                        Text(korisnik?.email ?? "",
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 90, 22, 6))),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  ExpansionTile(
                    leading: Icon(Icons.person,
                        color: const Color.fromARGB(255, 90, 22, 6)),
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Personal Information',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 90, 22, 6),
                                fontSize: 16,
                              )),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.teal),
                            onPressed: () {
                              _editPersonalInfo();
                            },
                          ),
                        ]),
                    initiallyExpanded: personalInfoExpanded,
                    onExpansionChanged: (val) {
                      setState(() => personalInfoExpanded = val);
                    },
                    children: [
                      _buildInfoRow('First Name:', korisnik?.ime),
                      _buildInfoRow('Last Name:', korisnik?.prezime),
                      _buildInfoRow('Gender:', korisnik?.spol),
                      _buildInfoRow('Birth date:', korisnik?.datumRodjenja),
                      _buildInfoRow('Birth city:', p.mjestoRodjenja),
                      _buildInfoRow('JMBG:', p.jmbg),
                      _buildInfoRow('Phone number:', p.telefon),
                      _buildInfoRow('Home city:', p.prebivaliste),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    leading: Icon(Icons.medical_services,
                        color: const Color.fromARGB(255, 90, 22, 6)),
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Medical Condition',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 90, 22, 6),
                                  fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.teal),
                            onPressed: () {
                              _editMedicalInfoInfo();
                            },
                          ),
                        ]),
                    initiallyExpanded: medicalConditionExpanded,
                    onExpansionChanged: (val) {
                      setState(() => medicalConditionExpanded = val);
                    },
                    children: [
                      _buildInfoRow('Blood type:', p.krvnaGrupa),
                      _buildInfoRow('Rh factor:', p.rhFaktor),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    leading: Icon(Icons.warning_amber_rounded,
                        color: const Color.fromARGB(255, 90, 22, 6)),
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Allergy',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 90, 22, 6),
                                  fontSize: 16)),
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.teal),
                            onPressed: () {
                              _editAllergiesInfo();
                            },
                          ),
                        ]),
                    initiallyExpanded: allergiesExpanded,
                    onExpansionChanged: (val) {
                      setState(() => allergiesExpanded = val);
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(p.alergija ?? 'No Allergy',
                            style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    leading: Icon(Icons.history_edu,
                        color: const Color.fromARGB(255, 90, 22, 6)),
                    title:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                    Text('Disease History',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 90, 22, 6),
                            fontSize: 16)),
                           IconButton(
                            icon: Icon(Icons.edit, color: Colors.teal),
                            onPressed: () {
                              _editDiseaseHistoryInfo();
                            },
                          ),
                      ],
                    ) ,
                    initiallyExpanded: diseaseHistoryExpanded,
                    onExpansionChanged: (val) {
                      setState(() => diseaseHistoryExpanded = val);
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(p.hronicneBolesti ?? 'No disease',
                            style: TextStyle(fontSize: 14)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
