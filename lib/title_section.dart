import 'package:flutter/material.dart';

titleSection(title) {
  return Padding(
    padding: const EdgeInsets.only(left: 6),
    child: Text(
      title,
      style: const TextStyle(
          color: Colors.white70, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}
