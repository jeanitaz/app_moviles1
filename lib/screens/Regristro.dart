import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? fotoPerfilGlobal;

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1Animation;
  late Animation<Color?> _color2Animation;

  final TextEditingController correo = TextEditingController();
  final TextEditingController contrasena = TextEditingController();
  XFile? foto;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _color1Animation = ColorTween(
      begin: Colors.black,
      end: const Color(0xFF4A0072),
    ).animate(_controller);

    _color2Animation = ColorTween(
      begin: const Color(0xFF1A237E),
      end: Colors.black,
    ).animate(_controller);
  }

  Future<void> seleccionarImagen(ImageSource fuente) async {
    final imagenSeleccionada = await ImagePicker().pickImage(source: fuente);
    if (imagenSeleccionada != null) {
      setState(() {
        foto = imagenSeleccionada;
        fotoPerfilGlobal = File(foto!.path);
      });
    }
  }

  void _mostrarOpciones(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galería'),
              onTap: () {
                seleccionarImagen(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Cámara'),
              onTap: () {
                seleccionarImagen(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    correo.dispose();
    contrasena.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: const Text(
          "Registro",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [_color1Animation.value!, _color2Animation.value!],
              ),
            ),
            child: child,
          );
        },
        child: SingleChildScrollView(
          padding:  EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white24,
                      backgroundImage: foto != null ? FileImage(File(foto!.path)) : null,
                      child: foto == null ? const Icon(Icons.person, size: 80, color: Colors.white) : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _mostrarOpciones(context),
                        child: const CircleAvatar(
                          radius: 18,
                          backgroundColor: Color(0xFF8B5CF6),
                          child: Icon(Icons.camera_alt, size: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Crea tu cuenta",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              _campoTexto("Nombres completos", Icons.person_outline),
              const SizedBox(height: 20),
              TextField(
                controller: correo,
                style: const TextStyle(color: Colors.white),
                decoration: _decoracion("Correo electrónico", Icons.email_outlined),
              ),
              const SizedBox(height: 20),
              _campoTexto("Edad", Icons.cake_outlined, tipo: TextInputType.number),
              const SizedBox(height: 20),
              TextField(
                controller: contrasena,
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: _decoracion("Contraseña", Icons.lock_outline),
              ),
              const SizedBox(height: 40),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [Color(0xFF5D2EFA), Color(0xFF8B5CF6)]),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () => registro(correo.text, contrasena.text, context),
                  child: const Text("CREAR CUENTA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _decoracion(String label, IconData icono) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icono, color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    );
  }

  Widget _campoTexto(String label, IconData icono, {TextInputType tipo = TextInputType.text}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      keyboardType: tipo,
      decoration: _decoracion(label, icono),
    );
  }
}

Future<void> registro(correo, contrasena, context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: correo, password: contrasena);
    Navigator.pushNamed(context, '/login');
  } on FirebaseAuthException catch (e) {
    String mensaje = 'Error al registrar usuario';
    if (e.code == 'weak-password') mensaje = 'Contraseña débil';
    else if (e.code == 'email-already-in-use') mensaje = 'El correo ya existe';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(mensaje),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }
}