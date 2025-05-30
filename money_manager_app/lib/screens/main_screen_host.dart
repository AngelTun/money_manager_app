import 'package:flutter/material.dart';
// Importa las pantallas/tabs personalizados usados en el home
import 'package:money_manager_app/screens/home_profile_tab.dart';
import 'package:money_manager_app/screens/home_screen_tab.dart';
// Importa constantes de color y estilos usados en el app
import 'package:money_manager_app/utils/constants.dart';

// Widget principal que contiene la navegación inferior y el contenido principal
class MainScreenHost extends StatefulWidget {
  const MainScreenHost({super.key});

  @override
  State<MainScreenHost> createState() => _MainScreenHostState();
}

class _MainScreenHostState extends State<MainScreenHost> {

  // Guarda el índice actual de la pestaña seleccionada
  var currentIndex = 0;

  // Método que retorna el widget correspondiente según la pestaña seleccionada
  Widget buildTabContent(int index) {
    switch (index){
      case 0:
        // Muestra la pantalla principal (Home)
        return const HomeScreenTab();
      case 1: 
        // En este caso aún no hay contenido para la pestaña 2
        return Container();
      case 2: 
        // En este caso aún no hay contenido para la pestaña 3
        return Container();
      case 3: 
        // Muestra el perfil de usuario
        return HomeProfileTab();
      default:
        // Por defecto muestra la pantalla principal
        return HomeScreenTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El cuerpo de la app depende de la pestaña seleccionada
      body: buildTabContent(currentIndex),
      // Barra de navegación inferior con las diferentes pestañas
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Índice de la pestaña seleccionada
        onTap: (index){
          // Cambia la pestaña seleccionada cuando el usuario toca una opción
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: secondaryDark, // Color para la pestaña seleccionada
        unselectedItemColor: fontLight,   // Color para las pestañas no seleccionadas

        items: [
          // Iconos y etiquetas de cada pestaña
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/home-1.png"), label: "Home"),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/chart-vertical.png"), label: "Stat"),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/wallet.png"), label: "Wallet"),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/user-1.png"), label: "Profile"),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/user-1.png"), label: "Profile")
        ],
      ),
    );
  }
}
