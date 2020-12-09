import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var form = Form(
      child: 
        Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                      Text('Sistema de mozos',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      Text('INICIAR SESIÓN',
                          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                      SizedBox(height: 10.0),
                      Container(
                          height: 200.0,
                          decoration:
                              BoxDecoration(color: Color.fromRGBO(238, 238, 238, 1)),
                          child: Center(child: Text('Logo de tu empresa aqui'))),
                      SizedBox(height: 10.0),
                      Text('Ingresa tu numero de DNI',
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5.0),
                      createTextField(),
                      SizedBox(height: 10.0),
                      Text('Ingresa tu contraseña',
                          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5.0),
                      createTextField(),
                      SizedBox(height: 15.0),
                      Visibility(
                        visible: false, //TODO: Statefull variable
                        child: Text('Algun mensaje de error', //TODO: Variable Error Text
                          style: TextStyle(fontSize: 14.0, color: Colors.red)),
                      ),
                      Expanded(child: SizedBox()),
                      createSubmitButton(),
                      SizedBox(height: 30.0),
                ])
      
    );
    return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              fit:  StackFit.expand,
              children: [
                Positioned(
                  bottom: 0.0,
                  child: Image(image: AssetImage('assets/login_bg.png'), fit: BoxFit.fitWidth)
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    child:
                        form,
                ),
              ],
            ),
      ),
    );
  }

  Widget createTextField(){
    return Container(
      height: 50.0,
      width: double.infinity,
      child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(50.0)),
                      ),
                    )
              ),
    );
  }

  Widget createSubmitButton(){
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 7),
            color: Color.fromRGBO(31,53,91,.9),
          ),
        ]
      ),
      child: RaisedButton(
        color: Color.fromRGBO(0, 93, 255, 1),
        onPressed: () { print("Probando"); },
        child: Text('INGRESAR', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white)),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(50.0),
        ),
      ),
    );
  }

}
