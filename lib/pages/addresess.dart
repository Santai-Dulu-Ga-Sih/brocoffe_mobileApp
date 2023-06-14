import 'package:brocoffe_moba/theme.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(AddresessPage());
}

class AddresessPage extends StatelessWidget {
  const AddresessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ADDRESESS',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'GillSans',
                  color: Colors.black,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        drawer: AppDrawer(),
        body: AddresessForm(),
      ),
    );
  }
}

class AddresessForm extends StatefulWidget {
  const AddresessForm({super.key});

  @override
  State<AddresessForm> createState() => _AddresessFormState();
}

class _AddresessFormState extends State<AddresessForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _provController = TextEditingController();
  TextEditingController _kabController = TextEditingController();
  TextEditingController _kecController = TextEditingController();
  TextEditingController _kodeposController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool isEditMode = false; // Awalnya mode edit dinonaktifkan

  @override
  Widget build(BuildContext context) {
    List<TextField> textFields = [
      TextField(
        controller: _nameController,
        enabled: isEditMode,
        decoration: InputDecoration(labelText: 'Nama Lengkap'),
        style:
            TextStyle(fontFamily: 'GillSans', fontSize: 20, color: greyColor),
      ),
      TextField(
        controller: _addressController,
        enabled: isEditMode,
        decoration: InputDecoration(labelText: 'Alamat'),
        style:
            TextStyle(fontFamily: 'GillSans', fontSize: 20, color: greyColor),
      ),
      TextField(
        controller: _provController,
        enabled: isEditMode,
        decoration: InputDecoration(labelText: 'Provinsi'),
        style:
            TextStyle(fontFamily: 'GillSans', fontSize: 20, color: greyColor),
      ),
      TextField(
        controller: _kabController,
        enabled: isEditMode,
        decoration: InputDecoration(labelText: 'Kabupaten'),
        style:
            TextStyle(fontFamily: 'GillSans', fontSize: 20, color: greyColor),
      ),
      TextField(
        controller: _kecController,
        enabled: isEditMode,
        decoration: InputDecoration(labelText: 'Kecamatan'),
        style:
            TextStyle(fontFamily: 'GillSans', fontSize: 20, color: greyColor),
      ),
      TextField(
        controller: _kodeposController,
        enabled: isEditMode,
        decoration: InputDecoration(labelText: 'Kode Pos'),
        style:
            TextStyle(fontFamily: 'GillSans', fontSize: 20, color: greyColor),
      ),
      TextField(
        controller: _emailController,
        enabled: isEditMode,
        decoration: InputDecoration(labelText: 'Email'),
        style:
            TextStyle(fontFamily: 'GillSans', fontSize: 20, color: greyColor),
      ),
    ];

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ...textFields,
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isEditMode = !isEditMode;
              });
            },
            child: Text(
              isEditMode ? 'Save' : 'Edit',
            ),
            style: ElevatedButton.styleFrom(
              primary:
                  isEditMode ? Colors.green.shade600 : Colors.grey.shade600,
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'GillSans',
              ),
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
