// import 'package:flutter/material.dart';
// import 'main_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginScreen extends StatefulWidget {
//   final VoidCallback onToggleTheme;
//   const LoginScreen({Key? key, required this.onToggleTheme}) : super(key: key);

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _Uname = TextEditingController();
//   final _Pword = TextEditingController();
//   String? _error;

//   void _Login() {
//     final u = _Uname.text.trim();
//     final p = _Pword.text;
//     if (u == 'Admin' && p == 'admin1234') {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (_) => MainScreen(onToggleTheme: widget.onToggleTheme),
//         ),
//       );
//     } else {
//       setState(() {
//         _error = 'Invalid credentials';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _Uname.dispose();
//     _Pword.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mq = MediaQuery.of(context);
//     final Portrait = mq.orientation == Orientation.portrait;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('McJo - Login', style: GoogleFonts.pacifico( color: const Color(0xFFEB1A55), fontSize: 30,),),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.brightness_6),
//             onPressed: widget.onToggleTheme,
//           )
//         ],
//       ),
//       body:Center(
//         child: SizedBox(
//           width: Portrait ? 360 : 500,
//           child: Card(
//             color: const Color.fromARGB(255, 255, 214, 214),
//             margin: const EdgeInsets.all(16),
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: _Uname,
//                     decoration: const InputDecoration(labelText: 'Username'),
//                   ),
//                   const SizedBox(height: 8),
//                   TextField(
//                     controller: _Pword,
//                     decoration: const InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                   ),
//                   const SizedBox(height: 12),
//                   ElevatedButton(
//                     onPressed: _Login,
//                     style: ElevatedButton.styleFrom(
//                      foregroundColor: const Color(0xFFEB1A55),
//                    ),
//                     child: const Text('Login'),
//                   ),
//                   if (_error != null) ...[
//                     const SizedBox(height: 8),
//                     Text(
//                       _error!,
//                       style: TextStyle(
//                           color: Theme.of(context).colorScheme.error),
//                     ),
//                   ]
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:expense_app/login_service.dart';
import 'package:expense_app/screens/main_screen.dart';
import 'package:expense_app/user_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(
    this.switchTheme,
    this.successfulRegistration,
    this.successMessage, {
    super.key,
    required this.goToHome,
    required this.goToRegister,
  });

  final void Function() switchTheme;
  final bool successfulRegistration;
  final String successMessage;
  final void Function(BaseAppUser) goToHome;
  final void Function() goToRegister;

  @override
  State<LoginScreen> createState() => _LoginScreenState(); //
}

class _LoginScreenState extends State<LoginScreen> {
  final loginService = LoginService();
  final formKey = GlobalKey<FormState>();
  bool showPassword = false;
  var enteredUsername = '';
  var enteredPassword = '';
  var isSending = false;
  var successfulRegistratioTemp = true;

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      //  'Admin' / 'admin1234'
      final u = enteredUsername.trim();
      final p = enteredPassword;

      if (u == 'Admin' && p == 'admin1234') {
        final bypassUser = BaseAppUser(
          username: u,
          password: p,
          firstName: 'Bypass',
          lastName: 'Local',
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => MainScreen(
              onToggleTheme: () {
              },
            ),
          ),
        );
        return;
      }

      setState(() {
        isSending = true;
      });

      final loginUser = await loginService.loginRequest(
        context: context,
        username: enteredUsername,
        password: enteredPassword,
      );

      setState(() {
        isSending = false;
      });

      if (loginUser != null) {
        widget.goToHome(loginUser);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.successfulRegistration && successfulRegistratioTemp) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            content: Text(widget.successMessage),
          ),
        );
      });
      setState(() {
        successfulRegistratioTemp = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: widget.switchTheme,
          icon: const Icon(Icons.brightness_6),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(75),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  label: const Text('Username'),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 5,
                    ),
                  ),
                ),
                enabled: !isSending,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kindly enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredUsername = value!;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                style: Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      width: 5,
                    ),
                  ),
                ),
                enabled: !isSending,
                obscureText: !showPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kindly enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  enteredPassword = value!;
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: isSending ? null : login,
                child: isSending
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Login'),
              ),
              const SizedBox(height: 10),

              TextButton(
                onPressed: isSending ? null : widget.goToRegister,
                child: const Text('Does not have an account yet? Sign Up now!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
