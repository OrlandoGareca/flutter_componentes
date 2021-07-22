import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _checkSwich(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'tamaño de la imagen',
        //divisions: 20,
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                  print(valor);
                });
              });
  }

  _checkSwich() {
    return SwitchListTile(
      title: Text('bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor as bool;
        });
      },
    );
  }

  _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://areajugones.sport.es/wp-content/uploads/2020/12/tobey-maguire-sera-spider-man-otra-vez-en-doctor-strange-2-1080x609.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _checkBox() {
    /*return Checkbox(
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor as bool;
          });
        });*/
    return CheckboxListTile(
      title: Text('bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor as bool;
        });
      },
    );
  }
}
