import 'package:flutter/material.dart';

class BottonSearch extends StatefulWidget {
  final Function(String) onSearch;
  
  const BottonSearch({
    super.key, 
    required this.onSearch,
  });

  @override
  State<BottonSearch> createState() => _BottonSearchState();
}

class _BottonSearchState extends State<BottonSearch> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    _searchController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            // This ensures the input field isn't hidden by the keyboard
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 18.0,
                right: 18.0,
                top: 18.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Buscar recetas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Introduce el nombre..',
                      prefixIcon: const Icon(Icons.search, color: Color(0xFF21BFBD)),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xFF21BFBD), width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      // You can add search functionality here
                      setState(() {
                        // Trigger update if needed
                      });
                    },                    onSubmitted: (value) {
                      // Handle search submission
                      print('Searching for: $value');
                      if (value.isNotEmpty) {
                        widget.onSearch(value);
                      } else {
                        widget.onSearch('');
                      }
                      Navigator.pop(context);
                      _searchController.text = '';
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),                      ElevatedButton(
                        onPressed: () {
                          final searchQuery = _searchController.text;
                          if (searchQuery.isNotEmpty) {
                            print('Searching for: $searchQuery');
                            widget.onSearch(searchQuery);
                          } else {
                            // If search is empty, pass empty string to show all foods
                            widget.onSearch('');
                          }
                          Navigator.pop(context);
                          _searchController.text = '';
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF21BFBD),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Buscar'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          },
        );
      },
      backgroundColor: const Color(0xFF21BFBD),
      child: const Icon(Icons.search, color: Colors.white),
    );
  }
}
