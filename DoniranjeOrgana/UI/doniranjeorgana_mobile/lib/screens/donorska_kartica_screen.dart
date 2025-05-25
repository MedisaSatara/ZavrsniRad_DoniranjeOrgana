import 'package:doniranjeorgana_mobile/models/donori.dart';
import 'package:doniranjeorgana_mobile/models/korisnik.dart';
import 'package:doniranjeorgana_mobile/providers/korisnik_provider.dart';
import 'package:doniranjeorgana_mobile/widgets/master_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DonorskaKarticaScreen extends StatefulWidget {
  final Donori donori;
  DonorskaKarticaScreen({required this.donori});

  @override
  State<DonorskaKarticaScreen> createState() => _DonorskaKarticaScreenState();
}

class _DonorskaKarticaScreenState extends State<DonorskaKarticaScreen> {
  late KorisnikProvider _korisnikProvider;
  Korisnik? _korisnik;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _korisnikProvider = context.read<KorisnikProvider>();
    _fetchKorisnici();
  }

  Future<void> _fetchKorisnici() async {
    try {
      var korisnikData =
          await _korisnikProvider.getById(widget.donori.korisnikId!);

      setState(() {
        _korisnik = korisnikData;
        isLoading = false;
      });
    } catch (e) {
      print('Greška prilikom učitavanja korisnika: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenWidget(
      title: 'Donor card',
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : _korisnik == null
              ? Center(child: Text("User not found"))
              : Center(
                  child: Card(
                    elevation: 8,
                    margin: EdgeInsets.all(24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Container(
                      padding: EdgeInsets.all(24),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red.shade700, Colors.red.shade300],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite, size: 48, color: Colors.white),
                          SizedBox(height: 16),
                          Text(
                            'Donor card',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Divider(color: Colors.white54, height: 32),
                          Text(
                            '${_korisnik!.ime} ${_korisnik!.prezime}',
                            style: GoogleFonts.poppins(
                                fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'JMBG: ${widget.donori.jmbg ?? "N/A"}',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Birth date: ${_korisnik!.datumRodjenja != null ? DateFormat('dd.MM.yyyy').format(DateFormat('yyyyMM/dd').parse(_korisnik!.datumRodjenja!)) : "N/A"}',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Thank you for being a donor!',
                            style: GoogleFonts.poppins(
                                fontStyle: FontStyle.italic,
                                color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
