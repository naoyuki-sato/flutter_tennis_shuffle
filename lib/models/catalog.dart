// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class CatalogModel {
  static const _itemNames = [
    '酒井',
    '渡辺',
    '榎本',
    '太田',
    '門岡',
    '佐藤',
    '小松',
    '原田',
    '山根',
    '杉山',
    '尾本',
    '三浦',
    '磯野',
    '中原',
    '小西',
    'ゲスト A',
    'ゲスト B'
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [_itemNames].
  //Item getById(int id) => Item(id, _itemNames[id % _itemNames.length]);
  Item getById(int id) => Item(id, _itemNames[id % _itemNames.length]);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }

  int getLength() {
    return _itemNames.length;
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      // To make the sample app look nicer, each item is given one of the
      // Material Design primary colors.
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
