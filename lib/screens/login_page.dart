import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isPasswordHidden = true;

  Future<void> login()async{
    if (!formKey.currentState!.validate()){
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim()
      );
      if (!mounted)return;

      Navigator.pushReplacementNamed(context, /home)
    } on FirebaseAuthException catch (e) {
      String message = 'Login Gagal!!';

      if (e.code == 'user-not-found'){
        message = 'Email Tidak Terdaftar!!';
      } if (e.code == 'wrong-password'){
        message = 'Password Salah!!!';
      } if(e.code == 'invalid-credential'){
        message = 'Email atau Password Salah!!';
      } if(e.code == 'invalid-email'){
        message = 'Email tidak valid';
      } if (e.code == 'to-many-request'){
        message = 'Terlalu banyk percobaan login!!';
      } if (e.code == 'network-request-failed'){
        message = 'Mohon periksa internet andaa';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
          )
      );

    } catch (e){
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi Kesalahan, Mohon coba lagi nanti'),
          backgroundColor: Colors.red,
          )
      );
    } finally {
      if(mounted){
        setState(() {
          isLoading=false;
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}