import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_petshop_app/app_styles.dart';

import '../models/pets.dart';

class CatalogDetails extends StatelessWidget {
  const CatalogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            SizedBox(
              height: 410,
              child: Image.asset(
                'assets/${pets[0]['image']}',
                fit: BoxFit.cover,
              ),
            ),
            Container(
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
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('American Pocketbully'),
                        Row(children: [Text('Canada'), Text('')])
                      ],
                    )
                  ],
                ))
          ]),
          const SizedBox(
            height: 78,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.info_circle,
                size: 28,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'About Pocketbully',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w800),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          const SizedBox(
            height: 16,
          ),
          Text(
            'The Sphinx cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xFFA1A1A1)),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
