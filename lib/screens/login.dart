import 'package:flutter/material.dart';
import 'package:movie_app2/data/http_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  HttpHelper? _httpHelper;
  TextEditingController? _usernameController;
  TextEditingController? _passwordController;
  User? _user;
  Future<SharedPreferences>? _prefs;
  
  @override
  void initState() {
    _httpHelper = HttpHelper();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _prefs = SharedPreferences.getInstance();
    getUsername();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.dispose();
  }

  createUser() async {
    _user =  await _httpHelper?.createUser(_usernameController!.text, _passwordController!.text);
    final pref = await _prefs;
    await pref?.setString('username', _user!.username);
  }

  getUsername() async {
    //Error here
    final pref = await _prefs;
    final username = pref?.getString('username');
    if (username != null) {
      _usernameController?.text = username;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _usernameController,
          ),
          TextField(
            controller: _passwordController,
          ),
          OutlinedButton(onPressed: (){
            getUsername();
          }, child: const Text("Sign in")),
          OutlinedButton(onPressed: (){
            createUser();
          }, child: const Text("Sign up")),
          TextButton(onPressed: () {}, child: const Text("Forgot Password"))
        ]
      ),
    );
  }
}