# FilmSonar

**FilmSonar** es una plataforma web para sugerencias personalizadas de películas. Permite explorar un catálogo de películas, obtener recomendaciones basadas en preferencias personales y gestionar listas como "vistas" y "favoritas".

---

## Tecnologías Principales

- **Backend:** Ruby on Rails 8.0.2  
- **Frontend:** Hotwire (Turbo / Stimulus), Importmaps, Sass  
- **Base de Datos:** PostgreSQL 15  
- **Entorno de Desarrollo:** Docker, Docker Compose  
- **Servidor:** Puma  
- **Gestor de Procesos (Dev):** Foreman  
- **Assets:** Propshaft, dartsass-rails  
- **Versión de Ruby:** 3.3.7

---

## Prerrequisitos

Asegúrate de tener instalados:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [Git](https://git-scm.com/)

---

## Instalación y Ejecución (Entorno de Desarrollo)

### 1. Clonar el Repositorio

```bash
git clone https://github.com/daniel-vizcarra/film_sonar.git
cd film_sonar
```

### 2. Configuración Inicial

Si necesitas configurar variables de entorno:

```bash
cp .env.example .env
```

### 3. Construir la Imagen Docker

Construir las imágenes (necesario la primera vez o si se modifican Dockerfile/Gemfile):

```bash
docker-compose build
```

### 4. Iniciar los Servicios

Iniciar todos los servicios (aplicación, base de datos, compilador Sass):

```bash
docker-compose up
```

### 5. Preparar la Base de Datos

En una nueva terminal, desde la carpeta del proyecto:

```bash
docker-compose exec app bundle exec rails db:create
docker-compose exec app bundle exec rails db:migrate
docker-compose exec app bundle exec rails db:seed
```

### 6. Acceder a la Aplicación

Abre tu navegador y visita: [http://localhost:3000](http://localhost:3000)

---

## Comandos Útiles

### Gestión de Servicios

```bash
docker-compose up              # Iniciar en primer plano
docker-compose up -d          # Iniciar en segundo plano
docker-compose down           # Detener servicios
docker-compose down -v        # Detener y eliminar volúmenes (¡cuidado: borra la BD!)
docker-compose logs -f
docker-compose logs -f app    # Solo logs de la aplicación
docker-compose logs -f db     # Solo logs de la base de datos
```

### Comandos Rails

```bash
docker-compose exec app bundle exec rails console       # Consola Rails
docker-compose exec app bundle exec rails test          # Ejecutar tests
docker-compose exec app bundle exec rails routes        # Ver rutas disponibles
docker-compose exec app bundle exec rails db:migrate    # Migraciones pendientes
docker-compose exec app bundle exec rails db:rollback   # Revertir última migración
```

### Mantenimiento

```bash
docker-compose build app      # Reconstruir imagen específica
docker system prune           # Limpiar imágenes no utilizadas
docker-compose ps             # Ver estado de los contenedores
```

---


---

¡Listo!Ya puedes empezar a usar **FilmSonar** y disfrutar de una experiencia cinéfila totalmente personalizada.


