import 'package:flutter/material.dart';

import 'log_in_controller.dart';
import 'log_in_model.dart';

class LoginScreen extends StatefulWidget {
  final Map<String, dynamic> layoutType;

  const LoginScreen({super.key, required this.layoutType});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LogInController formProvider = LogInController();
  final Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    formProvider.loadForm('anarock-host-poc.vercel.app', 'login');
  }

  @override
  void dispose() {
    controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Widget _buildTextField(KeyDetail keyDetail) {
    final controller = TextEditingController();
    controllers[keyDetail.key] = controller;

    final isPassword = keyDetail.key.toLowerCase().contains("password");
    final isEmail = keyDetail.key.toLowerCase().contains("email");

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        style: const TextStyle(fontSize: 16.0),
        decoration: InputDecoration(
          labelText: keyDetail.value.capitalize(),
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "Enter ${keyDetail.value}",
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
            borderSide: const BorderSide(color: Colors.deepPurple, width: 2.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
      ),
    );
  }


  void _submitForm() {
    // final formValues =
    // controllers.map((key, controller) => MapEntry(key, controller.text));
  }

  Widget _buildUI1(List<KeyDetail> keys) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE0ECFF), Color(0xFFF2F7FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "Welcome Back",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: keys.map(_buildTextField).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade100,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text("Login Form 1", style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildUI2(List<KeyDetail> keys) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 12,
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          const Text(
            "Login to Continue",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: keys.map(_buildTextField).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.login),
                label: const Text("Login Form 2", style: TextStyle(fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUI3(List<KeyDetail> keys) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top Banner Image
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            child: Image.network(
              getValueFromConfigList(null, targetKey: "SIGNIN_IMAGE"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(height: 16),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "Sign in to Your Account",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 8),

        // Form Fields
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: keys.map(_buildTextField).toList(),
          ),
        ),

        // Submit Button
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text("Login Form 3", style: TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getValueFromConfigList(null, targetKey:"PLATFORM_NAME"))),
      body: AnimatedBuilder(
        animation: formProvider,
        builder: (_, __) {
          if (formProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (formProvider.loginData == null) {
            return const Center(child: Text("No data found"));
          }

          final keys = formProvider.loginData!.masterKeyDetails;

          switch (int.parse(
            getValueFromConfigList(
              widget.layoutType["configKeys"],
              targetKey: "TEMPLATE_NAME",
            ),
          )) {
            case 1:
              return _buildUI1(keys);
            case 2:
              return _buildUI2(keys);
            case 3:
              return _buildUI3(keys);
            default:
              return _buildUI3(keys);
          }
        },
      ),
    );
  }

  String getValueFromConfigList(List<Map<String, dynamic>>? configList,
      {required String targetKey}) {
    final tempConfig = configList ?? (widget.layoutType["configKeys"] as List).cast<Map<String, dynamic>>();

    final config = tempConfig.firstWhere(
          (item) => item['key'] == targetKey,
      orElse: () => <String, dynamic>{},
    );

    if (config.isEmpty) return '';

    final domainConfigs = config['domainSpecificConfig'] as List?;

    if (domainConfigs != null && domainConfigs.isNotEmpty) {
      return (domainConfigs.first as Map<String, dynamic>)['value'] ?? '';
    }

    return config['value'] ?? '';
  }

}

extension StringCapitalize on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
