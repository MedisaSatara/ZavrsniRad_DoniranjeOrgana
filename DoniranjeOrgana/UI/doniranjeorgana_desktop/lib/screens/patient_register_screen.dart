import 'dart:async';

import 'package:doniranjeorgana_desktop/models/pacijent.dart';
import 'package:doniranjeorgana_desktop/models/search_result.dart';
import 'package:doniranjeorgana_desktop/providers/pacijent_provider.dart';
import 'package:doniranjeorgana_desktop/screens/patient_details_screen.dart';
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
  final _imeController = TextEditingController();
  final _prezimeController = TextEditingController();
  final _gradController = TextEditingController();
  Timer? _debounce;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pacijentProvider = context.read<PacijentProvider>();
    _fetchPacijenti();
  }

  Future<void> _fetchPacijenti() async {
    try {
      final searchParams = {
        'ime': _imeController.text.trim(),
        'prezime': _prezimeController.text.trim(),
        'prebivaliste': _gradController.text.trim(),
      }..removeWhere((key, value) => value.isEmpty);

      var pacijentiData = await _pacijentProvider.get(filter: searchParams);
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
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NUMBER OF PATIENTS\nREGISTERED ON\nTHE WAITING LIST: ${_brojPacijenata ?? 0}",
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF264653),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _pacijenti == null
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 3 / 2,
                            ),
                            itemCount: _pacijenti!.result.length,
                            itemBuilder: (context, index) {
                              final pacijent = _pacijenti!.result[index];
                              return Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${pacijent.ime ?? ''} ${pacijent.prezime ?? ''}",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFB00020),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                          "Birth: ${pacijent.datumRodjenja?.toString().split(' ').first ?? ''}"),
                                      Text(
                                          "City: ${pacijent.prebivaliste ?? ''}"),
                                      Text("Phone: ${pacijent.telefon ?? ''}"),
                                      const Spacer(),
                                      Text(
                                          "Blood: ${pacijent.krvnaGrupa ?? ''}${pacijent.rhFaktor ?? ''}"),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                  const SizedBox(width: 32),
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Search Filters",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF264653),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildSearchField("First name", _imeController),
                        _buildSearchField("Last name", _prezimeController),
                        _buildSearchField("City", _gradController),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: _fetchPacijenti,
                          child: const Text(
                            "Search",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2A9D8F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: SizedBox(
                width: 600,
                height: 600,
                child: PatientDetailsScreen(),
              ),
            ),
          );

          if (result == true) {
            _fetchPacijenti();
          }
          _fetchPacijenti();
        },
        backgroundColor: const Color(0xFF2A9D8F),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSearchField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      onChanged: (_) => _onSearchChanged(),
      decoration: InputDecoration(
        labelText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
                      _pacijenti = data;
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
        _pacijenti = data;
      });
    });
  }
}
