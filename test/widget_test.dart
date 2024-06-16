// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/entities/cat.dart';
import 'package:pragma_jmancilla/features/search_cats/domain/entities/weight.dart';

import 'package:pragma_jmancilla/main.dart';

void main() {
  group('Cat', () {
    test('contiene todas las propiedades', () {
      final weight = Weight(imperial: '10 - 15', metric: '4.5 - 6.8');
      final cat = Cat(
        weight: weight,
        id: 'id',
        name: 'name',
        cfaUrl: 'cfaUrl',
        vetstreetUrl: 'vetstreetUrl',
        vcahospitalsUrl: 'vcahospitalsUrl',
        temperament: 'temperament',
        origin: 'origin',
        countryCodes: 'countryCodes',
        countryCode: 'countryCode',
        description: 'description',
        lifeSpan: 'lifeSpan',
        indoor: 1,
        lap: 1,
        altNames: 'altNames',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 5,
        dogFriendly: 5,
        energyLevel: 5,
        grooming: 2,
        healthIssues: 1,
        intelligence: 5,
        sheddingLevel: 2,
        socialNeeds: 3,
        strangerFriendly: 4,
        vocalisation: 3,
        experimental: 0,
        hairless: 0,
        natural: 1,
        rare: 0,
        rex: 0,
        suppressedTail: 0,
        shortLegs: 0,
        wikipediaUrl: 'wikipediaUrl',
        hypoallergenic: 0,
        referenceImageId: 'referenceImageId',
      );

      expect(cat.props, [
        weight,
        'id',
        'name',
        'cfaUrl',
        'vetstreetUrl',
        'vcahospitalsUrl',
        'temperament',
        'origin',
        'countryCodes',
        'countryCode',
        'description',
        'lifeSpan',
        1,
        1,
        'altNames',
        5,
        5,
        5,
        5,
        5,
        2,
        1,
        5,
        2,
        3,
        4,
        3,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        'wikipediaUrl',
        0,
        'referenceImageId',
      ]);
    });

    test('supports value equality', () {
      final weight1 = Weight(imperial: '10 - 15', metric: '4.5 - 6.8');
      final cat1 = Cat(
        weight: weight1,
        id: 'id',
        name: 'name',
        cfaUrl: 'cfaUrl',
        vetstreetUrl: 'vetstreetUrl',
        vcahospitalsUrl: 'vcahospitalsUrl',
        temperament: 'temperament',
        origin: 'origin',
        countryCodes: 'countryCodes',
        countryCode: 'countryCode',
        description: 'description',
        lifeSpan: 'lifeSpan',
        indoor: 1,
        lap: 1,
        altNames: 'altNames',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 5,
        dogFriendly: 5,
        energyLevel: 5,
        grooming: 2,
        healthIssues: 1,
        intelligence: 5,
        sheddingLevel: 2,
        socialNeeds: 3,
        strangerFriendly: 4,
        vocalisation: 3,
        experimental: 0,
        hairless: 0,
        natural: 1,
        rare: 0,
        rex: 0,
        suppressedTail: 0,
        shortLegs: 0,
        wikipediaUrl: 'wikipediaUrl',
        hypoallergenic: 0,
        referenceImageId: 'referenceImageId',
      );

      final weight2 = Weight(imperial: '10 - 15', metric: '4.5 - 6.8');
      final cat2 = Cat(
        weight: weight2,
        id: 'id',
        name: 'name',
        cfaUrl: 'cfaUrl',
        vetstreetUrl: 'vetstreetUrl',
        vcahospitalsUrl: 'vcahospitalsUrl',
        temperament: 'temperament',
        origin: 'origin',
        countryCodes: 'countryCodes',
        countryCode: 'countryCode',
        description: 'description',
        lifeSpan: 'lifeSpan',
        indoor: 1,
        lap: 1,
        altNames: 'altNames',
        adaptability: 5,
        affectionLevel: 5,
        childFriendly: 5,
        dogFriendly: 5,
        energyLevel: 5,
        grooming: 2,
        healthIssues: 1,
        intelligence: 5,
        sheddingLevel: 2,
        socialNeeds: 3,
        strangerFriendly: 4,
        vocalisation: 3,
        experimental: 0,
        hairless: 0,
        natural: 1,
        rare: 0,
        rex: 0,
        suppressedTail: 0,
        shortLegs: 0,
        wikipediaUrl: 'wikipediaUrl',
        hypoallergenic: 0,
        referenceImageId: 'referenceImageId',
      );

      expect(cat1, equals(cat2));
    });
  });
}
