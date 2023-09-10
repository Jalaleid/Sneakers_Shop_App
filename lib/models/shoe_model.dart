import 'package:flutter/material.dart';

class ShoeModel {
  late String name, model, imgAddress;
  late double price;
  late Color modelColor;

  ShoeModel({
    required this.imgAddress,
    required this.name,
    required this.model,
    required this.modelColor,
    required this.price,
  });
}
