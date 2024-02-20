import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/pets.dart';

class CatalogDetails extends StatelessWidget {
  const CatalogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: SizedBox(
              height: 410,
              child: Image.asset(
                'assets/${pets[0]['image']}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 78,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.info_circle,
                size: 30,
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
          ListView()
        ],
      ),
    );
  }
}
