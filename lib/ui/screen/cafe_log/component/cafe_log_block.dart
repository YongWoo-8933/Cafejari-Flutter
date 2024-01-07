import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CafeLogBlock extends ConsumerWidget {
  final String image;

  const CafeLogBlock({
    required this.image,

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.network(image),
              // Container(
              //   child: ,
              // )
            ],
          ),
        )
      ],
    );
  }
}