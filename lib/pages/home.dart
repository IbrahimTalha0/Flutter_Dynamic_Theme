// @dart=2.9
import 'package:dynamic_theme_and_language/core/provider/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _openFullMaterialColorPicker(themeColor) async {
    _openDialog(
      "Renk seç",
      MaterialColorPicker(
        colors: materialColors,
        onColorChange: (color) async {
          var prefs = await SharedPreferences.getInstance();
          prefs.setInt("color", color.value);
          themeColor.setColor(color);
        },
      ),
    );
  }

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: Text('İptal'),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text('Kaydet'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor.getColor(),
        centerTitle: true,
        title: Text("Dil Ve Tema Deneme"),
        leading: IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              _openFullMaterialColorPicker(themeColor);
            }),
      ),
      body: ListView(children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          height: 80,
          color: themeColor.getColor(),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          height: 80,
          color: themeColor.getColor(),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          height: 80,
          color: themeColor.getColor(),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          height: 80,
          color: themeColor.getColor(),
        ),
      ]),
    );
  }
}
