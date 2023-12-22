import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Widget images;
  const Category({
    @required this.id,
    @required this.title,
    @required this.images,
  });
}
