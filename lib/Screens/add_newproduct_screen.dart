import 'package:ecommerce_app/providers/Product.dart';
import 'package:ecommerce_app/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routeName = '/editScreen';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: '',
    title: ' ',
    price: 0,
    imageUrl: '',
    description: '',
  );

  void dispose() {
    _priceFocusNode.dispose();
    _imageController.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    _formKey.currentState!.validate();
    _formKey.currentState!.save();
   Provider.of<Products>(context,listen: false).addProduct(_editedProduct);
   Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                validator: (value){
                  if(value!.isEmpty){
                    return 'please enter the title';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      id: _editedProduct.id,
                      title: value.toString(),
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              const Divider(),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'please enter valid price';
                  }
                  if (double.parse(value)<=0) {
                    return 'please enter valid price greater than 0';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value!),
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                focusNode: _descriptionFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the description';
                  }
                  if (value.length < 10) {
                    return 'please enter valid description of length atleast 10';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description:value.toString(),
                      price:  _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black12,
                        width: 2,
                      )),
                      child: _imageController.text.isEmpty
                          ? const Text('Add Image Url')
                          : FittedBox(
                              child: Image.network(_imageController.text),
                              fit: BoxFit.fill,
                            )),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Image Url'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageController,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter the imageUrl';
                        }
                        if (!value.startsWith('http')&&!value.startsWith('https')) {
                          return 'please enter valid imageUrl';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            description:_editedProduct.description,
                            price:  _editedProduct.price,
                            imageUrl: value.toString());
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
