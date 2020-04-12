// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/catalog.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CartModel>(context);
    var listLenght = catalog.items.length;
    catalog.shuffle();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return _MyListItem(index);
            }, childCount: listLenght),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
///      onPressed: cart.items.contains(item) ? null : () => cart.add(item),
         onPressed: cart.items.contains(item)
             ? () => cart.remove(item)
             : () => cart.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: cart.items.contains(item)
//          ? Icon(Icons.check, semanticLabel: 'ADDED')
          ? Text('1')
          : Text('ADD'),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: Text('シャッフル メンバー', style: Theme.of(context).textTheme.display4),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    //var item = catalog.getByPosition(index);
    var textTheme = Theme.of(context).textTheme.title;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: cart.items[index].color,
              ),
            ),
            SizedBox(width: 24),
            Expanded(
              child: Text(cart.items[index].name, style: textTheme),
            ),
            SizedBox(width: 24),
            //_AddButton(item: cart.items[index]),
            Text((index+1).toString() + "   ", style: textTheme),
          ],
        ),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/cart.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('メンバー', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
//            Divider(height: 4, color: Colors.black),
//            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var cart = Provider.of<CartModel>(context);

    var shuffle_index = new List.generate(cart.items.length, (i)=>i);
    shuffle_index.shuffle();
//    print("lenght: ${shuffle_index.length}");
//    shuffle_index.forEach((num) => print(num));


    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
//        leading: Icon(Icons.done),
        leading: Text((index+1).toString(), style: itemNameStyle),
        title: Text(
          cart.items[shuffle_index[index]].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.display4.copyWith(fontSize: 24);

    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not supported yet.')));
              },
              color: Colors.white,
              child: Text('ランダム', style: hugeStyle),
            ),
          ],
        ),
      ),
    );
  }
}
*/