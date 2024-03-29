import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petshop_app/app_styles.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/pet.dart';
import 'catalog_details.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<Pet> filteredPets = pets;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    updateSearchQuery(_searchController.text);
  }

  void updateSearchQuery(String query) {
    final suggestions = pets.where((pet) {
      final petNameLower = pet.name.toLowerCase();
      final searchLower = query.toLowerCase();
      return petNameLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredPets = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            const Text('Store',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Pet or Breed',
                  hintStyle: const TextStyle(fontSize: 14),
                  prefixIcon: const Icon(CupertinoIcons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF2F3F2),
                ),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemCount: filteredPets.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final pet = filteredPets[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatalogDetails(pet: pet),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.12),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(
                                pet.image,
                                fit: BoxFit.cover,
                                height: 140,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              pet.name,
                              style: const TextStyle(fontSize: 14),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$${pet.price.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                IconButton(
                                  icon: const Icon(
                                      CupertinoIcons.cart_fill_badge_plus,
                                      color: goldYellow),
                                  onPressed: () {
                                    final cart = Provider.of<Cart>(context,
                                        listen: false);
                                    cart.add(pet);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content:
                                            Text('${pet.name} added to cart!'),
                                        duration: const Duration(seconds: 1),
                                        behavior: SnackBarBehavior.floating,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        margin: const EdgeInsets.all(10),
                                        elevation: 6.0,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
