import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petshop_app/app_styles.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';
import '../models/pet.dart';

class CatalogDetails extends StatelessWidget {
  final Pet pet;

  const CatalogDetails({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 410,
                  child: Image.asset(
                    pet.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 78,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/pet.png', width: 26),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'About ${pet.name}',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      detailContainer('Weight', '${pet.weight} kg', goldYellow),
                      detailContainer('Height', '${pet.height} cm', goldYellow),
                      detailContainer('Color', pet.color, goldYellow),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Text(
                    pet.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Color(0xFFA1A1A1)),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    var cart = Provider.of<Cart>(context, listen: false);
                    cart.add(pet);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${pet.name} added to cart!'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(
                    CupertinoIcons.cart_badge_plus,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: goldYellow,
                    minimumSize: const Size(342, 58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      CupertinoIcons.back,
                      size: 30.0,
                      color: Colors.white,
                    ))),
            Positioned(
              top: 358,
              left: 9,
              child: Container(
                  height: 105,
                  width: 366,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.12),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pet.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF141415),
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(children: [
                              Text(pet.location),
                              const Text(' • '),
                              Text('${pet.eta}m')
                            ])
                          ],
                        ),
                        Image.asset(
                          'assets/gender.png',
                          width: 40,
                        )
                      ],
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }

  Widget detailContainer(String title, String value, Color color) {
    return Container(
      width: 100,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFF98FF98).withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          Text(
            value,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.0, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }
}
