import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pragma_jmancilla/core/CatColors.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/entities/cat.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.cat, required this.imageUrl});

  final Cat cat;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    TextStyle _headerStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        color: CatsColors.blue,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
    TextStyle _bodyStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
        color: CatsColors.gray800,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text(
                cat.name!,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: CatsColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          : AppBar(
              backgroundColor: CatsColors.blueLight,
              centerTitle: true,
              elevation: 0,
              title: Text(
                cat.name!,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: CatsColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: 'item-${cat.id}',
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: CatsColors.gray800),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Text("Description:",
                      style: _headerStyle, textAlign: TextAlign.justify),
                  Text(cat.description!,
                      style: _bodyStyle, textAlign: TextAlign.justify),
                  const SizedBox(height: 12),
                  Text("Origin country:", style: _headerStyle),
                  Text(cat.origin!, style: _bodyStyle),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Inteligence:", style: _headerStyle),
                      Text(cat.intelligence.toString(), style: _bodyStyle),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("LifeSpan: ", style: _headerStyle),
                      Text(cat.lifeSpan!, style: _bodyStyle),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Adaptability: ", style: _headerStyle),
                      Text(cat.adaptability.toString(), style: _bodyStyle),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
