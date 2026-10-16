import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const new();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
        ),

        ExpansionTile(
          title: Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioGroup(
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = value!;
                });
              },
              child: Column(
                children: [
                  RadioListTile(
                    value: Transportation.car,
                    title: Text('By Car'),
                    subtitle: Text('Viajar por carro'),
                  ),
                  RadioListTile(
                    value: Transportation.plane,
                    title: Text('By Plane'),
                    subtitle: Text('Viajar por avión'),
                  ),
                  RadioListTile(
                    value: Transportation.boat,
                    title: Text('By Boat'),
                    subtitle: Text('Viajar por bote'),
                  ),
                  RadioListTile(
                    value: Transportation.submarine,
                    title: Text('By Submarine'),
                    subtitle: Text('Viajar por submarino'),
                  ),
                ],
              ),
            ),
          ],
        ),

        CheckboxListTile(
          value: wantsBreakfast,
          title: Text('¿Desayuno?'),
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          value: wantsLunch,
          title: Text('Almuerzo?'),
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          value: wantsDinner,
          title: Text('¿Cena?'),
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
