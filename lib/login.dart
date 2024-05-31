import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
 File? _image;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  TextEditingController preController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController numController = TextEditingController();
  bool _isChecked = false;

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> submitData() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (_image == null) {
        print('No image selected.');
        return;
      }

      if (!_isChecked) {
        print('Conditions must be accepted.');
        return;
      }

      String base64Image = base64Encode(_image!.readAsBytesSync());
      String url = 'http://192.168.43.148:81/APK/insertuser.php';

      var response = await http.post(
        Uri.parse(url),
        body: {
          "prenom": preController.text,
          "postnom": postController.text,
          "email": emailController.text,
          "passwords": passController.text,
          "profil": base64Image,
        },
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData == "success") {
          print("Data submitted successfully");
        } else {
          print("Failed to submit data");
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              GestureDetector(
                onTap: getImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null ? const Icon(Icons.person) : null,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: preController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    fillColor: Colors.white54,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Prénom',
                    labelText: 'Votre prénom',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: postController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    fillColor: Colors.white54,
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Postnom',
                    labelText: 'Postnom',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    fillColor: Colors.white54,
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Votre Adresse mail',
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: passController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    fillColor: Colors.white54,
                    filled: true,
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Votre Mot de passe',
                    labelText: 'Mot de passe',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  controller: numController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),
                    fillColor: Colors.white54,
                    filled: true,
                    prefixIcon: Icon(Icons.add),
                    hintText: 'Votre Numero de telephone',
                    labelText: 'Numero Telephone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CheckboxListTile(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  title: const Text('Vous acceptez les conditions de notre application'),
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: !_isChecked
                      ? const Text(
                          'Ce champ est obligatoire',
                          style: TextStyle(color: Colors.red),
                        )
                      : null,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40),
              ),
              GestureDetector(
                onTap: submitData,
                child: Container(
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text('Enregistrer'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}