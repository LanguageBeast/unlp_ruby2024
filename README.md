# Proyecto de Gestión de Inventario de Indumentaria

## Descripción del Proyecto
Esta aplicación de gestión de inventario está diseñada para una reconocida cadena de ropa deportiva. Permite al personal administrar el stock de productos, registrar ventas y gestionar usuarios. Además, ofrece una página pública para que los potenciales clientes puedan ver los productos disponibles.

## Apartados del Proyecto

### Storefront
El Storefront es la cara visible de la cadena de ropa. Permite a los visitantes ver los productos disponibles, su precio y su stock sin necesidad de autenticación. Incluye una pantalla de bienvenida y opciónes de navegación por el sitio.

### Administración de Productos
Permite a los empleados gestionar los productos, su stock y su precio. Es un CRUD creado en gran parte con scaffolds de Ruby on Rails, adaptado según los requisitos del proyecto.

### Administración de Ventas
Permite a los empleados registrar las ventas realizadas y los productos vendidos. Las ventas no se pueden 'editar' ni 'destruir', solo cancelar. La creación de una nueva venta requiere el número de cliente y la cantidad de productos.

### Gestión de Usuarios
Permite la creación de usuarios con diferentes roles desde la interfaz de administración. Los usuarios autenticados son los únicos que pueden acceder a las interfaces de administración. 

## Decisiones de Diseño

### Idioma
- Se optó por una interfaz 100% en inglés para estar en concordancia con con el framework Rails y las gemas (cuyas UI están todas en inglés).

### Diseño de Base de Datos
- Entidades principales: `product`, `sale`, `user`.
- Entidad intermedia entre `product` y `sale` para manejar la relación muchos a muchos.
- `user` creado con la gema Devise, adaptada para las necesidades del proyecto.
- Gema Active Storage utilizada para manejar las imágenes de los productos.

### Storefront
- Pantalla de bienvenida simple.
- Barra de navegación con enlaces útiles y botón de inicio/cierre de sesión.
- Listado de productos con funcionalidad de búsqueda y filtros, manejada con la gema Ransack.

### Administración de Productos
- CRUD creado con scaffolds de Ruby on Rails y adaptado según los requisitos.

### Administración de Ventas
- CRUD sin funcionalidad de actualización.
- Ventas no editables ni destructibles, solo cancelables.
- Creación de ventas requiere número de cliente y cantidad de productos.

### Gestión de Usuarios
- Gestión de usuarios con Devise.
- Rol de usuario manejado como un campo un string para evitar el uso de gemas de autorización complejas (considerado innecesario).

## Requisitos Técnicos

- Ruby >= 3.2.0
- Ruby on Rails >= 8.0.0
- SQLite 
- Gema Devise para gestión de usuarios
- Gema Active Storage para manejo de archivos
- Gema Ransack para operaciones de búsqueda de productos

### Pasos para probar el projecto

- Clonar el repositorio:
```sh
git clone <URL_DEL_REPOSITORIO>
cd <NOMBRE_DEL_PROYECTO>
```
- Instalar dependencias:
```sh
bundle install
```

- Configurar la base de datos:
```sh
rails db:reset
```

- Iniciar la app:
```sh
rails s
```

- Acceder a la app en el localhost correspondiente.
