import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_moviles1/main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _nombre;
  String? _email;
  String? _avatarUrl;
  bool _cargando = true;
  bool _subiendoFoto = false;

  @override
  void initState() {
    super.initState();
    _obtenerDatosPerfil();
  }

  Future<void> _obtenerDatosPerfil() async {
    try {
      final supabase = Supabase.instance.client;
      final user = supabase.auth.currentUser;

      if (user == null) return;

      final data = await supabase
          .from('perfiles')
          .select()
          .eq('id', user.id)
          .single();

      if (mounted) {
        setState(() {
          _nombre = data['nombre'];
          _email = data['email'];
          _avatarUrl = data['avatar_url'];
          _cargando = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _cargando = false);
      }
    }
  }

  Future<void> _cambiarFotoPerfil() async {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final ImagePicker picker = ImagePicker();
    final XFile? imagen = await picker.pickImage(source: ImageSource.gallery);

    if (imagen == null) return;

    setState(() => _subiendoFoto = true);

    try {
      final file = File(imagen.path);
      final fileExt = imagen.path.split('.').last;
      final fileName =
          '${user.id}/${DateTime.now().millisecondsSinceEpoch}.$fileExt';

      await supabase.storage.from('avatars').upload(
            fileName,
            file,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );

      final imageUrl = supabase.storage.from('avatars').getPublicUrl(fileName);

      await supabase.from('perfiles').update({
        'avatar_url': imageUrl,
      }).eq('id', user.id);

      if (mounted) {
        setState(() {
          _avatarUrl = imageUrl;
          _subiendoFoto = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Foto actualizada con éxito!')),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() => _subiendoFoto = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al subir imagen: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Mi Perfil",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A005C), Colors.black],
          ),
        ),
        child: _cargando
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF8B5CF6)))
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xFF8B5CF6), width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF8B5CF6).withOpacity(0.5),
                                blurRadius: 20,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[900],
                            backgroundImage:
                                _avatarUrl != null && _avatarUrl!.isNotEmpty
                                    ? NetworkImage(_avatarUrl!)
                                    : null,
                            child: _subiendoFoto
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : (_avatarUrl == null || _avatarUrl!.isEmpty
                                    ? const Icon(Icons.person,
                                        size: 60, color: Colors.white54)
                                    : null),
                          ),
                        ),
                        GestureDetector(
                          onTap: _subiendoFoto ? null : _cambiarFotoPerfil,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Color(0xFF8B5CF6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.edit,
                                color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _nombre ?? "Usuario",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _email ?? "Sin email",
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: const Text("PREMIUM",
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const _StatItem(count: "24", label: "Mi Lista"),
                        _containerDivisor(),
                        const _StatItem(count: "12", label: "Reseñas"),
                        _containerDivisor(),
                        const _StatItem(count: "158", label: "Vistas"),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const _MenuOption(
                        icon: Icons.download_done_rounded,
                        title: "Descargas Inteligentes",
                        subtitle: "Gestionar calidad y espacio"),
                    const _MenuOption(
                        icon: Icons.language,
                        title: "Idioma del contenido",
                        subtitle: "Español (Latino)"),
                    const _MenuOption(
                        icon: Icons.notifications_active_outlined,
                        title: "Notificaciones",
                        subtitle: "Estrenos y recomendaciones"),
                    const _MenuOption(
                        icon: Icons.card_membership,
                        title: "Plan de Suscripción",
                        subtitle: "ACJmax Estándar"),
                    const _MenuOption(
                        icon: Icons.help_outline,
                        title: "Ayuda y Soporte",
                        subtitle: ""),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          await Supabase.instance.client.auth.signOut();
                          if (context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Cuerpo()),
                              (route) => false,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.withOpacity(0.1),
                          side: const BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        child: const Text("Cerrar Sesión",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _containerDivisor() {
    return Container(
        height: 30, width: 1, color: Colors.grey.withOpacity(0.3));
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}

class _MenuOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _MenuOption(
      {required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF8B5CF6).withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF8B5CF6)),
        ),
        title: Text(title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: subtitle.isNotEmpty
            ? Text(subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 12))
            : null,
        trailing:
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {},
      ),
    );
  }
}