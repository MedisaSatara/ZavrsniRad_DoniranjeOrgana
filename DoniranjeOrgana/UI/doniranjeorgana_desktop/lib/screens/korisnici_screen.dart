import 'package:doniranjeorgana_desktop/models/korisnik.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/korisnik_provider.dart';
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
  String _searchTerm = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _korisnikProvider = context.read<KorisnikProvider>();
    _fetchKorisnici();
  }

  Future<void> _fetchKorisnici() async {
    try {
      var korisniciData =
          await _korisnikProvider.get(filter: {'search': _searchTerm});
      setState(() {
        _korisnici = korisniciData;
        _brojKorisnika = korisniciData.count;
      });
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  void _onSearchChanged(String value) {
    setState(() {
      _searchTerm = value;
    });
    _fetchKorisnici();
  }

  void _deleteUser(Korisnik korisnik) async {
    print("Delete user: ${korisnik.korisnickoIme}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User app\nnumber: ${_brojKorisnika ?? 0}",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF264653),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by name or username...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color(0xFFF4F4F4),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: _onSearchChanged,
            ),
            const SizedBox(height: 24),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildUserTable(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTable() {
    if (_korisnici == null || _korisnici!.result.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2,
      ),
      itemCount: _korisnici!.result.length,
      itemBuilder: (context, index) {
        final korisnik = _korisnici!.result[index];
        return Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${korisnik.ime ?? ''} ${korisnik.prezime ?? ''}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text("📧 ${korisnik.email ?? ''}"),
                    Text("📱 ${korisnik.telefon ?? ''}"),
                    Text("👤 ${korisnik.korisnickoIme ?? ''}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteUser(korisnik),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
