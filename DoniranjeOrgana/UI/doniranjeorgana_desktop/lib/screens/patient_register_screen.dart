import 'package:doniranjeorgana_desktop/models/pacijent.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/pacijent_provider.dart';
import 'package:doniranjeorgana_desktop/widget/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientRegisterScreen extends StatefulWidget {
  @override
  _PatientRegisterScreenState createState() => _PatientRegisterScreenState();
}

class _PatientRegisterScreenState extends State<PatientRegisterScreen> {
  late PacijentProvider _pacijentProvider;

  int? _brojPacijenata;
  SearchResult<Pacijent>? _pacijenti;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pacijentProvider = context.read<PacijentProvider>();
    _fetchPacijenti();
  }

  Future<void> _fetchPacijenti() async {
    try {
      var pacijentiData = await _pacijentProvider.get();
      setState(() {
        _pacijenti = pacijentiData;
        _brojPacijenata = pacijentiData.count;
      });
    } catch (e) {
      print("Error fetching patient: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: MasterScreenWidget(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/images/images.jpg",
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "User app number: ${_brojPacijenata ?? 0}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.85),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: _buildUserTable(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTable() {
    if (_pacijenti == null || _pacijenti!.result.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(
                label: Text(
              'First name',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Last name',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Birth date',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
             DataColumn(
                label: Text(
              'City',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Phone number',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Blood type',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
             DataColumn(
                label: Text(
              'Rh factor',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
             DataColumn(
                label: Text(
              'Chronic diseases',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
             DataColumn(
                label: Text(
              'Allergy',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
          rows: _pacijenti!.result.map((korisnik) {
            return DataRow(cells: [
              DataCell(Text(korisnik.ime ?? "")),
              DataCell(Text(korisnik.prezime ?? "")),
              DataCell(Text(korisnik.datumRodjenja.toString() ?? "")),
              DataCell(Text(korisnik.prebivaliste ?? "")),
              DataCell(Text(korisnik.telefon ?? "")),
              DataCell(Text(korisnik.krvnaGrupa ?? "")),
              DataCell(Text(korisnik.rhFaktor ?? "")),
              DataCell(Text(korisnik.hronicneBolesti ?? "")),
              DataCell(Text(korisnik.alergija ?? "")),
            ]);
          }).toList(),
        ));
  }
}
