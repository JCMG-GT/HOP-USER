import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hopapp/src/config/app_colors.dart';
import 'package:hopapp/src/logic/bloc/dicover/discover_bloc.dart';
import 'package:hopapp/src/routes/routes.dart';

import 'package:hopapp/src/utils/responsive.dart';

part 'custom_tab_bar.dart';
part 'search_bar.dart';
part 'title_tab.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class ItemTitle extends StatelessWidget {
  const ItemTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
