import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_desktop/widget/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersScreens extends StatefulWidget {
  @override
  _UsersScreensState createState() => _UsersScreensState();
}

class _UsersScreensState extends State<UsersScreens> {
  late KorisnikProvider _korisnikProvider;

  int? _brojKorisnika;
  SearchResult<Korisnik>? _korisnici;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _korisnikProvider = context.read<KorisnikProvider>();
    _fetchKorisnici();
  }

  Future<void> _fetchKorisnici() async {
    try {
      var korisniciData = await _korisnikProvider.get();
      setState(() {
        _korisnici = korisniciData;
        _brojKorisnika = korisniciData.count;
      });
    } catch (e) {
      print("Error fetching users: $e");
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
                        "User app number: ${_brojKorisnika ?? 0}",
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
    if (_korisnici == null || _korisnici!.result.isEmpty) {
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
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Phone number',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Username',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ],
          rows: _korisnici!.result.map((korisnik) {
            return DataRow(cells: [
              DataCell(Text(korisnik.ime ?? "")),
              DataCell(Text(korisnik.prezime ?? "")),
              DataCell(Text(korisnik.email ?? "")),
              DataCell(Text(korisnik.telefon ?? "")),
              DataCell(Text(korisnik.korisnickoIme ?? "")),
            ]);
          }).toList(),
        ));
  }
}
