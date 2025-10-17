import 'package:flutter/material.dart';
import 'main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const LoginScreen({Key? key, required this.onToggleTheme}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _Uname = TextEditingController();
  final _Pword = TextEditingController();
  String? _error;

  void _Login() {
    final u = _Uname.text.trim();
    final p = _Pword.text;
    if (u == 'Admin' && p == 'admin1234') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MainScreen(onToggleTheme: widget.onToggleTheme),
        ),
      );
    } else {
      setState(() {
        _error = 'Invalid credentials';
      });
    }
  }

  @override
  void dispose() {
    _Uname.dispose();
    _Pword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final Portrait = mq.orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text('McJo - Login', style: GoogleFonts.pacifico( color: const Color(0xFFEB1A55), fontSize: 30,),),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: widget.onToggleTheme,
          )
        ],
      ),
      body:Center(
        child: SizedBox(
          width: Portrait ? 360 : 500,
          child: Card(
            color: const Color.fromARGB(255, 255, 214, 214),
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _Uname,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _Pword,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _Login,
                    style: ElevatedButton.styleFrom(
                     foregroundColor: const Color(0xFFEB1A55),
                   ),
                    child: const Text('Login'),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      _error!,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
