# FreeGames-iOS
Application about buisness's course by Esther Huecas

# PODS:
pod 'Kingfisher', '~> 7.0'
pod 'Alamofire', '~> 5.5'
- Descargar el proyecto y en la terminal agregar "pod install"

Tres pantallas distintas con un TabBar para una correcta navegación y utilizado arquitectura VIPER.

# Contenido:
- # Videojuegos
- Listado general de elementos. Alimentado a través de la API: https://www.freetogame.com/api-doc.
- Detalle de dichos elementos donde muestra la imagen, título y una descripción más detallada según el id del juego pulsado.

- # Formulario de usuario
- Contiene los campos: Nombre, Apellidos, Teléfono, Correo y Bibiografía.
- Validación de campos.
- El botón de guardar no se habilita hasta que todos los campos contiene los datos correctos.
- Persistencia de datos.

- # Notificaciones push:
- Pedir permisos cuando el usuario pulsa sobre el botón "enviar notificación".
- En caso de que el usuario acepte los permisos, se habilitará el botón de "enviar notificación" y para mostrar dichas notificaciones se deberá o bloquear la pantalla del dispositivo o salir de la aplicación para que se ejecute en segundo plano.
- En caso de que el usuario rechace los permisos, se deshabilitará el botón de "enviar notificación" y se habilitará el de "cambiar permisos". Si el usuario pulsa sobre este botón, se le llevará a la pantalla de ajustes para que pueda cambiar los permisos.

- # Test Unitarios
- Videojuegos: Interactor y Provider.
- Formulario de Usuario: Interactor, Provider y Modelo.
