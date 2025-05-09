import 'package:example_menu/domain/models/food.dart';
import 'package:example_menu/presentations/provider/prices_for_quantity.dart';
import 'package:example_menu/presentations/provider/select_card_provider.dart';
import 'package:example_menu/presentations/widgets/build_info_card.dart';
import 'package:example_menu/presentations/widgets/custom_text.dart';
import 'package:example_menu/presentations/widgets/header.dart';
import 'package:example_menu/presentations/widgets/tamplate_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Pantalla que muestra los detalles de un alimento.
class DetailFood extends StatefulWidget {
  /// Objeto `Food` que contiene la información del alimento.
  final Food food;

  /// Constructor de la clase `DetailFood`.
  const DetailFood({super.key, required this.food});

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

/// Estado asociado a la pantalla `DetailFood`.
class _DetailFoodState extends State<DetailFood> with Header, CustomText {
  /// Primera parte del nombre del alimento.
  late String firstName;

  /// Segunda parte del nombre del alimento (si existe).
  late String secondName;

  /// Precio del alimento en formato numérico.
  late double price;

  @override
  void initState() {
    super.initState();
    // Inicializa los detalles del alimento.
    _initializeFoodDetails();

    // Ejecuta acciones después de que el primer fotograma haya sido renderizado.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Inicializa la tarjeta seleccionada.
      context.read<SelectCardProvider>().initSelectedCard();
      // Reinicia los valores relacionados con precios y cantidades.
      context.read<PricesForQuantity>().resetValues();
    });
  }

  /// Método para inicializar los detalles del alimento.
  /// Divide el nombre del alimento en partes y convierte el precio a un número.
  void _initializeFoodDetails() {
    final foodNameParts = widget.food.foodName.split(' ');
    firstName = foodNameParts[0];
    secondName = foodNameParts.length > 1 ? foodNameParts[1] : '';
    price = double.parse(widget.food.price.replaceAll('\$', '').trim());
  }

  @override
  void dispose() {
    // Limpia las variables antes de destruir el estado.
    firstName = '';
    secondName = '';
    price = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TamplateScreens(
      backgroundColor: const Color(0xFF7A9BEE),
      header: getHeader(
        widgetChildText: getHeaderText(text: 'Details', fontSize: 18.0),
        context: context,
      ),
      isDetailScreen: true,
      body: _buildBody(context),
    );
  }

  /// Construye el cuerpo principal de la pantalla.
  Widget _buildBody(BuildContext context) {
    // Obtiene el proveedor de precios y cantidades.
    final pricesForQuantity = context.watch<PricesForQuantity>();

    // Establece el precio inicial.
    pricesForQuantity.setPrice(price);

    return Stack(
      children: [
        _buildBackground(context),
        _buildHeroImage(),
        _buildDetailsSection(context, pricesForQuantity),
      ],
    );
  }

  /// Construye el fondo de la pantalla.
  Widget _buildBackground(BuildContext context) {
    return Positioned(
      top: 75.0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.0),
            topRight: Radius.circular(45.0),
          ),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  /// Construye la imagen principal del alimento con un efecto de héroe.
  Widget _buildHeroImage() {
    return Positioned(
      left: (MediaQuery.of(context).size.width / 2) - 100.0,
      child: Hero(
        tag: widget.food.imgPath,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.food.imgPath),
              fit: BoxFit.cover,
            ),
          ),
          height: 200.0,
          width: 200.0,
        ),
      ),
    );
  }

  /// Construye la sección de detalles del alimento.
  Widget _buildDetailsSection(
    BuildContext context,
    PricesForQuantity pricesForQuantity,
  ) {
    return Positioned(
      top: 250.0,
      left: 25.0,
      right: 25.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFoodName(),
          const SizedBox(height: 20.0),
          _buildPriceAndQuantity(pricesForQuantity),
          const SizedBox(height: 20.0),
          _buildInfoCards(),
          const SizedBox(height: 20.0),
          _buildTotalPrice(pricesForQuantity),
        ],
      ),
    );
  }

  /// Construye el nombre del alimento.
  Widget _buildFoodName() {
    return Row(
      children: [
        getBodyText(text: firstName, fontWeight: FontWeight.bold),
        const SizedBox(width: 10.0),
        getBodyText(text: secondName),
      ],
    );
  }

  /// Construye la sección de precio y selector de cantidad.
  Widget _buildPriceAndQuantity(PricesForQuantity pricesForQuantity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getBodyText(
          text: widget.food.price,
          fontSize: 20,
          colorText: Colors.grey,
        ),
        Container(height: 25.0, color: Colors.grey, width: 1.0),
        _buildQuantitySelector(pricesForQuantity),
      ],
    );
  }

  /// Construye el selector de cantidad.
  Widget _buildQuantitySelector(PricesForQuantity pricesForQuantity) {
    return Container(
      width: 125.0,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        color: const Color(0xFF7A9BEE),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildQuantityButton(
            icon: Icons.remove,
            color: const Color(0xFF7A9BEE),
            onTap: pricesForQuantity.removeQuantity,
          ),
          getBodyText(
            text: '${pricesForQuantity.quantity}',
            fontSize: 15,
            colorText: Colors.white,
          ),
          _buildQuantityButton(
            icon: Icons.add,
            color: Colors.white,
            iconColor: const Color(0xFF7A9BEE),
            onTap: pricesForQuantity.addQuantity,
          ),
        ],
      ),
    );
  }

  /// Construye un botón para ajustar la cantidad.
  Widget _buildQuantityButton({
    required IconData icon,
    required Color color,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 25.0,
        width: 25.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: color,
        ),
        child: Center(
          child: Icon(icon, color: iconColor ?? Colors.white, size: 20.0),
        ),
      ),
    );
  }

  /// Construye las tarjetas de información del alimento.
  Widget _buildInfoCards() {
    return SizedBox(
      height: 260.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.food.infoCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: BuildInfoCard(infoCard: widget.food.infoCards[index]),
          );
        },
      ),
    );
  }

  /// Construye la sección que muestra el precio total.
  Widget _buildTotalPrice(PricesForQuantity pricesForQuantity) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.black,
        ),
        height: 60.0,
        child: Center(
          child: Text(
            '\$${pricesForQuantity.getTotalPrice().toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
      ),
    );
  }
}
