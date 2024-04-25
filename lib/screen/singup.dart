import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: SingUp()));

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contraseniaController = TextEditingController();
  final TextEditingController confirmarController = TextEditingController();

  bool isVisibleObstecure = false;

  void void_submittedForm() {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Form submitted successfully"),
        ),
      );
    }
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa tu nombre';
    } else if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value)) {
      return "Porfavor, ingrese un nombre valido, con numeros o caracteres especiales";
    }
    return null;
  }

  String? validateemail(String? value) {
    if (value!.isEmpty) {
      return 'Ingresa tu correo';
    } else if (!RegExp(r"^[a,zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2.}$")
        .hasMatch(value)) {
      return "Porfaor ingresa un correo valido";
    }
    return null;
  }

  String? validatecontrasenia(String? value) {
    if (value!.isEmpty) {
      return 'Porfavor, ingresa tu contraseña';
    } else if (value.length < 6) {
      return "Tu contraseña debe de tener minimo 6 caracteres";
    } else if (!RegExp(r"^[a,zA-Z]+$").hasMatch(value)) {
      return "La contraseña solo debe de contener letras y numeros";
    }

    return null;
  }

  String? validateconfirmar(String? value) {
    if (value!.isEmpty) {
      return 'Porfavor, confirma tu contraseña';
    } else if (value != contraseniaController.text) {
      return "Tu contraseña no coincide";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(image: AssetImage("assets/imagenes/img3.PNG")),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Crea una nueva cuenta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 29,
                          fontWeight:
                              FontWeight.normal, // Aquí se corrigió el error
                          color: Color(0xff59beff),
                          height: 1,
                        ),
                      ),
                      TextFormField(
                        validator: validateName,
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: "Nombre",
                        ),
                      ),
                      TextFormField(
                        validator: validateemail,
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Correo electrónico",
                        ),
                      ),
                      TextFormField(
                        validator: validatecontrasenia,
                        controller: contraseniaController,
                        autocorrect: false,
                        enableSuggestions: false,
                        obscureText: isVisibleObstecure,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisibleObstecure = !isVisibleObstecure;
                                });
                              },
                              icon: isVisibleObstecure
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Contraseña",
                        ),
                      ),
                      TextFormField(
                        validator: validateconfirmar,
                        controller: confirmarController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Confirmar contraseña",
                        ),
                      ),
                      SizedBox(
                        height: 58,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            minimumSize: Size(400, 50)),
                        onPressed: () {
                          void_submittedForm();
                        },
                        child: Text(
                          "Crear",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
