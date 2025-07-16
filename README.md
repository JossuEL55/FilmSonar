# Film Sonar 🎬

Una aplicación de recomendación de películas construida con Ruby on Rails 8, que utiliza patrones de diseño avanzados para proporcionar recomendaciones personalizadas basadas en preferencias de géneros y directores.

## 🚀 Despliegue en Render

### Configuración Automática

1. **Fork o clona este repositorio**
2. **Conecta tu repositorio a Render:**
   - Ve a [render.com](https://render.com)
   - Crea una nueva cuenta o inicia sesión
   - Haz clic en "New +" → "Blueprint"
   - Conecta tu repositorio de GitHub
   - Render detectará automáticamente el `render.yaml`

### Configuración Manual (Alternativa)

Si prefieres configurar manualmente:

1. **Crear Base de Datos PostgreSQL:**
   - New + → PostgreSQL
   - Nombre: `film-sonar-db`
   - Plan: Starter (gratis)
   - Región: Oregon (o la más cercana)

2. **Crear Servicio Web:**
   - New + → Web Service
   - Conecta tu repositorio
   - Configuración:
     - **Environment**: Docker
     - **Build Command**: `echo "Build handled by Docker"`
     - **Start Command**: `echo "Start handled by Docker"`
     - **Health Check Path**: `/up`

3. **Variables de Entorno:**
   ```
   RAILS_MASTER_KEY=tu_master_key_aqui
   RAILS_ENV=production
   RAILS_LOG_LEVEL=info
   RAILS_MAX_THREADS=5
   WEB_CONCURRENCY=2
   SOLID_QUEUE_IN_PUMA=true
   DATABASE_URL=postgresql://user:pass@host:port/database
   ```

### Obtener RAILS_MASTER_KEY

```bash
# En tu máquina local
cat config/master.key
```

## 🏗️ Arquitectura y Patrones de Diseño

### Patrones Implementados:

- **🎯 Strategy Pattern**: Sistema de recomendaciones intercambiable
- **🗄️ Repository Pattern**: Abstracción del acceso a datos
- **🏗️ Template Method**: Reutilización en controladores
- **🔗 Observer Pattern**: Actualización automática de puntuaciones

### Estructura del Proyecto:

```
app/
├── models/          # Entidades del dominio
├── services/        # Lógica de negocio
│   └── recommendation_strategies/  # Patrón Strategy
├── repositories/    # Patrón Repository
├── controllers/     # Capa de presentación
└── views/          # Templates
```

## 🛠️ Desarrollo Local

### Prerrequisitos:
- Ruby 3.3.7
- PostgreSQL
- Node.js (para assets)

### Instalación:

```bash
# Clonar repositorio
git clone <tu-repo>
cd film_sonar

# Instalar dependencias
bundle install

# Configurar base de datos
rails db:create
rails db:migrate
rails db:seed

# Importar datos de películas
rails import:movies

# Iniciar servidor
bin/dev
```

### Variables de Entorno Local:

Crea un archivo `.env` en la raíz:

```env
DATABASE_URL=postgresql://localhost/film_sonar_development
RAILS_MASTER_KEY=tu_master_key_aqui
```

## 📊 Características

- **Sistema de Recomendaciones**: Basado en preferencias de géneros y directores
- **API RESTful**: Endpoints para películas, usuarios y recomendaciones
- **Autenticación**: Sistema de usuarios con Devise
- **Filtros Avanzados**: Por género, director, año, puntuación
- **Puntuación Ponderada**: Combina calificaciones de IMDb, Rotten Tomatoes y Letterboxd
- **Interacciones de Usuario**: Favoritos, películas vistas, watchlist

## 🔧 Tecnologías

- **Backend**: Ruby on Rails 8
- **Base de Datos**: PostgreSQL
- **Cache**: Solid Cache
- **Jobs**: Solid Queue
- **WebSockets**: Solid Cable
- **Frontend**: Hotwire (Turbo + Stimulus)
- **Estilos**: Sass
- **Autenticación**: Devise
- **Paginación**: Pagy

## 📈 Monitoreo y Logs

En Render, puedes monitorear tu aplicación desde el dashboard:
- **Logs**: Ver logs en tiempo real
- **Métricas**: CPU, memoria, requests
- **Health Checks**: Estado de la aplicación

## 🔒 Seguridad

- SSL/TLS habilitado automáticamente
- Variables de entorno seguras
- Validaciones de entrada
- Protección CSRF
- Headers de seguridad

## 📝 Licencia

Este proyecto está bajo la Licencia MIT.

---

**¡Disfruta explorando películas con Film Sonar!** 🎬✨

