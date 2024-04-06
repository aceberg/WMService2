import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:pref/pref.dart';

class PrefColor extends StatelessWidget {
  const PrefColor({
    Key? key,
    this.title,
    required this.pref,
    this.subtitle,
    this.onChange,
    this.disabled,
  }) : super(key: key);

  final Widget? title;

  final Widget? subtitle;

  final String pref;

  final bool? disabled;

  final ValueChanged<Color>? onChange;

  @override
  Widget build(BuildContext context) {
    return PrefCustom<int>(
      pref: pref,
      title: title,
      subtitle: subtitle,
      onChange:
          onChange == null ? null : (v) => onChange!(Color(v ?? 0xffffffff)),
      disabled: disabled,
      onTap: _tap,
      builder: (c, v) => Container(
        color: Color(v ?? 0xffffffff),
        width: 20,
        height: 20,
      ),
    );
  }

  Future<int?> _tap(BuildContext context, int? value) async {
    var newValue = value ?? 0xffffffff;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: Color(newValue),
            onColorChanged: (v) => newValue = v.value,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    );

    return result == true ? newValue : value;
  }
}

