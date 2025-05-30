import 'package:flutter/material.dart';

// Importa constantes (colores, tamaños, etc.)
import '../utils/constants.dart';

// Widget para mostrar información general de la cuenta en forma de tile/lista
class GeneralAccountInfoTile extends StatelessWidget {
  final String title;      // Título principal del tile (ej: "Bank Location")
  final String subTitle;   // Subtítulo (ej: dirección del banco)
  final String imageUrl;   // Ruta del icono que se muestra a la izquierda

  const GeneralAccountInfoTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imageUrl
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0, // Elimina el espacio entre el icono y el texto
      leading: Padding(
        // Añade padding alrededor del icono para centrarlo mejor
        padding: const EdgeInsets.symmetric(
          horizontal: defaultSpacing / 4, 
          vertical: defaultSpacing / 2
        ),
        child: Image.asset(imageUrl),
      ),
      // Título del tile, en negrita y con color personalizado
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: fontHeading),
      ),
      // Subtítulo, en un tono más claro
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
          .textTheme
          .titleSmall
          ?.copyWith(color: fontSubHeading),
      ),
      // Icono de flecha a la derecha
      trailing: const Icon(Icons.keyboard_arrow_right_rounded, color: fontSubHeading),
    );
  }
}

// Widget para mostrar opciones de perfil en la pantalla de cuenta/perfil
class ProfileAccountInfoTile extends StatelessWidget {
  final String iconUrl;   // Ruta del icono a mostrar
  final String heading;   // Texto que describe la opción

  const ProfileAccountInfoTile({
    super.key, 
    required this.iconUrl, 
    required this.heading
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Icono de la opción, con padding a la izquierda
          Padding(
            padding: const EdgeInsets.only(left: defaultSpacing + 4),
            child: Image.asset(iconUrl),
          ),
          // Texto que describe la opción, con padding lateral
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
            child: Text(
              heading, 
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: fontHeading)
            ),
          ),
          // Flecha alineada a la derecha
          const Expanded(
            flex: 1, 
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: defaultSpacing),
                child: Icon(Icons.keyboard_arrow_right_rounded, color: fontSubHeading),
              )
            )
          )
        ],
      ),
    );
  }
}
