import 'package:flutter/material.dart';

class DetailAttribute extends StatelessWidget {
  const DetailAttribute({super.key, required this.value, required this.name});

  final dynamic value;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Text(
            '$name: ',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}