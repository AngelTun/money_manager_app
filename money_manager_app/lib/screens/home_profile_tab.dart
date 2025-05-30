import 'package:flutter/material.dart';

// Importa constantes (colores, tamaños, etc.)
import '../utils/constants.dart';
// Importa widget personalizado para mostrar información de perfil
import '../widget/profile_account_info_tile.dart';

// Este widget representa la pantalla/tab del perfil de usuario
class HomeProfileTab extends StatelessWidget {
  const HomeProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado en la parte superior de la pantalla
      appBar: AppBar(
        elevation: 0, // Sin sombra
        backgroundColor: background, // Color de fondo personalizado
        leading: const Icon(
          Icons.arrow_back_ios, // Icono de regresar
          color: fontSubHeading, // Color personalizado
        ),
        actions: const [
          // Icono de configuración a la derecha
          Padding(
            padding: EdgeInsets.only(right: defaultSpacing),
            child: Icon(
              Icons.settings,
              color: fontSubHeading,
            ),
          )
        ],
      ),
      // Cuerpo principal del perfil, protegido por SafeArea
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultSpacing), // Padding general
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: defaultSpacing, // Espacio superior
              ),
              // Sección superior con la foto y los datos del usuario
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    children: [
                      // Imagen del avatar del usuario, con bordes redondeados
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(defaultRadius)),
                        child: Image.asset(
                          "assets/images/avatar.jpeg",
                          width: 100,
                        ),
                      ),
                      const SizedBox(height: defaultSpacing / 3),
                      // Nombre del usuario
                      Text(
                        "Jacob Timberline",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700, color: fontHeading),
                      ),
                      // Correo electrónico del usuario
                      Text(
                        "jacobtimberline@gmail.com",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: fontSubHeading),
                      ),
                      const SizedBox(
                        height: defaultSpacing / 2,
                      ),
                      // Botón tipo chip para editar el perfil
                      const Chip(
                        backgroundColor: primaryLight,
                        label: Text("Edit Profile"),
                      ),
                    ],
                  ),
                ),
              ),
              // Sección inferior con la información general y de cuenta
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Título: General
                    Padding(
                      padding: const EdgeInsets.only(left: defaultSpacing),
                      child: Text(
                        "General",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700, color: fontHeading),
                      ),
                    ),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    // Información general de cuenta: ubicación del banco
                    const GeneralAccountInfoTile(
                        title: "Bank Location",
                        subTitle: "7307 Grand Avenue, Flushing NY3293",
                        imageUrl: "assets/icons/location-1.png"),
                    // Información general de cuenta: billetera
                    const GeneralAccountInfoTile(
                        title: "My Wallet",
                        subTitle: "Manage your saved wallet",
                        imageUrl: "assets/icons/wallet.png"),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    // Título: Account
                    Padding(
                      padding: const EdgeInsets.only(left: defaultSpacing),
                      child: Text(
                        "Account",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700, color: fontHeading),
                      ),
                    ),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    // Opciones de la cuenta de usuario: Mi cuenta, Notificaciones, Privacidad, Acerca de
                    const ProfileAccountInfoTile(
                        iconUrl: "assets/icons/user-1.png",
                        heading: "My Account"),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    const ProfileAccountInfoTile(
                        iconUrl: "assets/icons/bell.png",
                        heading: "Notification"),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    const ProfileAccountInfoTile(
                        iconUrl: "assets/icons/lock-on.png", heading: "Privacy"),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    const ProfileAccountInfoTile(
                        iconUrl: "assets/icons/info-circle.png",
                        heading: "About"),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
