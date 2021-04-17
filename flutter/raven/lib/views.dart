import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:raven/db_manager.dart';
import 'package:raven/models.dart';
import 'package:raven/partials.dart';

class ShopsView extends StatefulWidget {
  List<Enterprise> shops = [];

  ShopsView({Key key}) {
    shops = [
      Enterprise(
          name: 'Continente',
          imageUrl:
              'https://plasticoresponsavel.continente.pt/wp-content/uploads/2019/04/IMG_8383.jpg'),
      Enterprise(name: 'Jaquim')
    ];
  }

  @override
  _ShopsView createState() => _ShopsView();
}

class _ShopsView extends State<ShopsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Raven - Heaven's Courier"),
        ),
        body: Column(
          children: [
            TextButton(
              child: Text("Send request"),
              onPressed: () async {
                Response response = await DBManager().getInfo();
                debugPrint(response.body);
              },
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.shops.length,
              itemBuilder: (context, index) {
                return ListViewRow(
                    title: widget.shops[index].name,
                    imageUrl: widget.shops[index].imageUrl,
                    callback: goToItems);
              },
            )
          ],
        ));
  }

  void goToItems() {
    Navigator.pushNamed(
      context,
      '/items',
      //arguments: PokemonArgs(pokemon),
    );
  }
}

class ItemsView extends StatefulWidget {
  List<Item> items = [];

  ItemsView({Key key}) {
    items = [
      Item(
          name: 'bread',
          imageUrl:
              'https://thecreativecrops.com/wp-content/uploads/2018/06/01_breadRoll_semmel02_p01.jpg'),
    ];
  }

  @override
  _ItemsView createState() => _ItemsView();
}

class _ItemsView extends State<ItemsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Buy"),
        ),
        body: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListViewRow(
                  title: widget.items[index].name,
                  imageUrl: widget.items[index].imageUrl,
                );
              },
            )
          ],
        ));
  }
}

class CheckoutView extends StatefulWidget {
  List<Item> items = [];

  CheckoutView({Key key}) {
    items = [
      Item(
          name: 'bread',
          imageUrl:
              'https://thecreativecrops.com/wp-content/uploads/2018/06/01_breadRoll_semmel02_p01.jpg'),
    ];
  }

  @override
  _CheckoutView createState() => _CheckoutView();
}

class _CheckoutView extends State<ItemsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Buy"),
        ),
        body: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListViewRow(
                  title: widget.items[index].name,
                  imageUrl: widget.items[index].imageUrl,
                );
              },
            )
          ],
        ));
  }
}
