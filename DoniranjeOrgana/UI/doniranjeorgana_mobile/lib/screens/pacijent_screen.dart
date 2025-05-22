import 'dart:convert';

import 'package:doniranjeorgana_mobile/models/korisnik.dart';
import 'package:doniranjeorgana_mobile/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_mobile/widgets/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:doniranjeorgana_mobile/models/pacijent.dart';
import 'package:provider/provider.dart';

class PacijentPodaciScreen extends StatefulWidget {
  final Pacijent pacijent;

  PacijentPodaciScreen({Key? key, required this.pacijent}) : super(key: key);

  @override
  _PacijentPodaciScreenState createState() => _PacijentPodaciScreenState();
}

class _PacijentPodaciScreenState extends State<PacijentPodaciScreen> {
  bool personalInfoExpanded = false;
  bool medicalConditionExpanded = false;
  bool allergiesExpanded = false;
  bool diseaseHistoryExpanded = false;
  late KorisnikProvider _korisnikProvider;
  List<Korisnik>? korisnikResult;

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

  Widget _buildSectionTitle(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.teal),
        SizedBox(width: 10),
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.teal[700])),
      ],
    );
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

  @override
  @override
  Widget build(BuildContext context) {
    final p = widget.pacijent;
    final korisnik = korisnikResult?.first;

    return MasterScreenWidget(
      title: "User profile",
      child: korisnik != null
          ? SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        _buildProfilePicture(korisnik.slika),
                        SizedBox(height: 12),
                        Text(korisnik.korisnickoIme!,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromARGB(255, 255, 255, 255))),
                        SizedBox(height: 4),
                        Text(korisnik.email!,
                            style: TextStyle(
                                fontSize: 14, color:  const Color.fromARGB(255, 90, 22, 6))),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  ExpansionTile(
                    leading: Icon(Icons.person, color:  const Color.fromARGB(255, 90, 22, 6)),
                    title: Text('Personal Information',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 90, 22, 6),
                            fontSize: 16)),
                    initiallyExpanded: personalInfoExpanded,
                    onExpansionChanged: (val) {
                      setState(() => personalInfoExpanded = val);
                    },
                    children: [
                      _buildInfoRow('First Name:', p.ime),
                      _buildInfoRow('Last Name:', p.prezime),
                      _buildInfoRow('Spol:', p.spol),
                      _buildInfoRow('Birth date:', p.datumRodjenja),
                      _buildInfoRow('Birth city:', p.mjestoRodjenja),
                      _buildInfoRow('JMBG:', p.jmbg),
                      _buildInfoRow('Phone number:', p.telefon),
                      _buildInfoRow('Home city:', p.prebivaliste),
                    ],
                  ),
                  Divider(),
                  ExpansionTile(
                    leading: Icon(Icons.medical_services, color:  const Color.fromARGB(255, 90, 22, 6)),
                    title: Text('Medical Condition',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:  const Color.fromARGB(255, 90, 22, 6),
                            fontSize: 16)),
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
                    leading:
                        Icon(Icons.warning_amber_rounded, color:  const Color.fromARGB(255, 90, 22, 6)),
                    title: Text('Allergy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:  const Color.fromARGB(255, 90, 22, 6),
                            fontSize: 16)),
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
                    leading: Icon(Icons.history_edu, color:  const Color.fromARGB(255, 90, 22, 6)),
                    title: Text('Disease History',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 90, 22, 6),
                            fontSize: 16)),
                    initiallyExpanded: diseaseHistoryExpanded,
                    onExpansionChanged: (val) {
                      setState(() => diseaseHistoryExpanded = val);
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                            p.hronicneBolesti ?? 'No disease',
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
