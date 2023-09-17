import 'dart:io';

import 'package:flutter/material.dart';

class ShowImages extends StatefulWidget {
  final List<dynamic> data;
  const ShowImages({super.key, required this.data});

  @override
  State<ShowImages> createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  late List<dynamic> data;

  @override
  void initState() {
    super.initState();
    data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: data.map((singleData) {
                return Column(children: [
                  Image.network("${singleData['image']}"),
                  const SizedBox(height: 8.0, ),
                ]);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
