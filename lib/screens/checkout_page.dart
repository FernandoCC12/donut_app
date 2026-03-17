import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import '../models/cart.dart';
import 'success_page.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  // Clave global para validar el formulario completo
  final _formKey = GlobalKey<FormState>();
  // Clave global para el formulario de la tarjeta (evita perder el foco)
  final _tarjetaFormKey = GlobalKey<FormState>();

  // Controladores para Datos de Envío
  final _nombreCtrl = TextEditingController();
  final _direccionCtrl = TextEditingController();
  final _cpCtrl = TextEditingController();
  final _telefonoCtrl = TextEditingController();

  // Variables para la Tarjeta (flutter_credit_card)
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  bool isCargando = false;

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _direccionCtrl.dispose();
    _cpCtrl.dispose();
    _telefonoCtrl.dispose();
    super.dispose();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void _mostrarError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _procesarPago() async {
    // 1. Validar que el formulario y la tarjeta estén llenos
    if (_formKey.currentState!.validate()) {
      // 2. Validar el formulario de la tarjeta
      if (!_tarjetaFormKey.currentState!.validate()) {
        _mostrarError('Por favor, completa los datos de la tarjeta correctamente.');
        return;
      }

      // 2. Mostrar diálogo de carga (Procesamiento Asíncrono)
      setState(() {
        isCargando = true;
      });

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(color: Colors.red),
        ),
      );

      // Simular petición a servidor bancario por 2.5 segundos
      await Future.delayed(const Duration(milliseconds: 2500));

      // Quitar diálogo
      if (mounted) Navigator.pop(context);

      setState(() {
        isCargando = false;
      });

      // Simular un 25% de probabilidad de que el banco rechace la tarjeta
      final random = Random().nextInt(100);
      if (random < 25) {
        if (mounted) {
          _mostrarError('Pago declinado por el banco. Intenta con otra tarjeta.');
        }
        return; // Detiene el flujo, no avanza a la página de éxito
      }

      // 3. Mover a pantalla de éxito si el pago pasó
      if (mounted) {
        // Obtenemos un resumen de lo pagado antes de vaciar
        final totalPagado = context.read<Cart>().totalFinal;
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessPage(totalPagado: totalPagado),
          ),
        );
      }
    }
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType type, {int? maxLength}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        keyboardType: type,
        maxLength: maxLength,
        inputFormatters: type == TextInputType.phone ? [FilteringTextInputFormatter.digitsOnly] : null,
        decoration: InputDecoration(
          labelText: label.toUpperCase(),
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
          counterText: '',
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[800]!)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red[600]!, width: 2)),
          errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
          focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent, width: 2)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          filled: true,
          fillColor: const Color(0xFF1E1E1E),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Obligatorio';
          }
          if (type == TextInputType.phone && value.length < 10) {
            return 'Mín. 10 dg';
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('FINALIZAR ÓRDEN', 
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 18, color: Colors.white)),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'DATOS DE ENVÍO',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                      ),
                      const SizedBox(height: 20),
                      
                      _buildTextField('Nombre Completo', _nombreCtrl, TextInputType.name),
                      _buildTextField('Dirección Completa', _direccionCtrl, TextInputType.streetAddress),
                      
                      Row(
                        children: [
                          Expanded(child: _buildTextField('Código Postal', _cpCtrl, TextInputType.number, maxLength: 5)),
                          const SizedBox(width: 12),
                          Expanded(child: _buildTextField('Teléfono', _telefonoCtrl, TextInputType.phone, maxLength: 10)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                child: Divider(color: Colors.grey, thickness: 0.5),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MÉTODO DE PAGO',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2),
                  ),
                ),
              ),

              // Widget visual de la tarjeta
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange: (CreditCardBrand brand) {},
                isHolderNameVisible: true,
                cardBgColor: const Color(0xFFB0BEC5), // Plata / Gris Azulado claro (Máximo contraste)
                isSwipeGestureEnabled: true,
                
                // Traducción de etiquetas dentro de la tarjeta
                labelCardHolder: 'NOMBRE DEL TITULAR',
                labelValidThru: 'EXPIRACIÓN',
                
                // Placeholders ya están en el formulario (CreditCardForm)
              ),

              // Formulario para ingresar la tarjeta (Ajustado para Dark Mode)
              Theme(
                data: ThemeData.dark().copyWith(
                  inputDecorationTheme: InputDecorationTheme(
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red[600]!, width: 2)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[800]!)),
                    labelStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
                child: CreditCardForm(
                  formKey: _tarjetaFormKey, 
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumber: cardNumber,
                  cvvCode: cvvCode,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardHolderName: cardHolderName,
                  expiryDate: expiryDate,
                  onCreditCardModelChange: onCreditCardModelChange,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      labelText: 'NÚMERO DE TARJETA',
                      hintText: 'Número de tarjeta',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    expiryDateDecoration: InputDecoration(
                      labelText: 'FECHA DE EXPIRACIÓN',
                      hintText: 'MM/AA',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    cvvCodeDecoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: 'Código de seguridad',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    cardHolderDecoration: InputDecoration(
                      labelText: 'NOMBRE DEL TITULAR',
                      hintText: 'Nombre completo',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      
      // Botón Inferior
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E), 
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 10, offset: const Offset(0, -2))],
          border: Border.all(color: Colors.grey[850]!, width: 1),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[700], 
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
          ),
          onPressed: isCargando ? null : _procesarPago,
          child: const Text('CONFIRMAR PAGO', 
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
        ),
      ),
    );
  }
}
