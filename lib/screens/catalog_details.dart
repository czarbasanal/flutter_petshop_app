import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petshop_app/app_styles.dart';
import '../models/pets.dart';

class CatalogDetails extends StatelessWidget {
  const CatalogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'assets/${pets[0]['image']}',
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
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'About Pocketbully',
                      style: TextStyle(
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
                    Container(
                      width: 100,
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFF98FF98).withOpacity(0.1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                          ),
                          Text(
                            '3.5 kg',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: goldYellow),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFF98FF98).withOpacity(0.1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                          ),
                          Text(
                            '22 cm',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: goldYellow),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFF98FF98).withOpacity(0.1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Color'),
                          Text(
                            'Light Brown',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: goldYellow),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  'The Sphinx cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xFFA1A1A1)),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle button press
                },
                icon: const Icon(
                  CupertinoIcons.cart_badge_plus,
                  color: Colors.white,
                ),
                label: const Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: goldYellow,
                  minimumSize: const Size(366, 50),
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
                            'American Pocketbully',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF141415),
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            Text('Canada'),
                            Text(' • '),
                            Text('8m')
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
    );
  }
}
