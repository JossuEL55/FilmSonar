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
**2. Configuración Inicial**  
Si necesitas configurar variables de entorno:
```bash
cp .env.example .env

## 2. Configuración Inicial
Si necesitas configurar variables de entorno:

```bash
cp .env.example .env

## 3. Construir la Imagen Docker
# Construir las imágenes (necesario la primera vez o si se modifican Dockerfile/Gemfile)
docker-compose build

## 4. Iniciar los Servicios
# Iniciar todos los servicios (aplicación, base de datos, compilador Sass)
docker-compose up

## 5. Preparar la base de datos
En una nueva terminal, desde la carpeta del proyecto:
# Crear bases de datos
docker-compose exec app bundle exec rails db:create

# Aplicar migraciones
docker-compose exec app bundle exec rails db:migrate

# Cargar datos iniciales
docker-compose exec app bundle exec rails db:seed

## 6. Acceder a la Aplicación

Abre tu navegador y visita: http://localhost:3000

##Comandos útiles
Gestión de Servicios
# Iniciar servicios en primer plano (con logs)
docker-compose up

# Iniciar servicios en segundo plano
docker-compose up -d

# Detener servicios
docker-compose down

# Detener servicios y eliminar volúmenes (¡cuidado: borra la BD!)
docker-compose down -v

# Ver logs
docker-compose logs -f
docker-compose logs -f app    # Solo logs de la aplicación
docker-compose logs -f db     # Solo logs de la base de datos

Comandos Rails
# Consola Rails
docker-compose exec app bundle exec rails console

# Ejecutar tests
docker-compose exec app bundle exec rails test

# Ver rutas disponibles
docker-compose exec app bundle exec rails routes

# Ejecutar migraciones pendientes
docker-compose exec app bundle exec rails db:migrate

# Revertir última migración
docker-compose exec app bundle exec rails db:rollback

Mantenimiento
# Reconstruir una imagen específica
docker-compose build app

# Limpiar imágenes no utilizadas
docker system prune

# Ver estado de los contenedores
docker-compose ps
