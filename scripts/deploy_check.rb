#!/usr/bin/env ruby

# Script de verificación para despliegue en Render
# Ejecutar: ruby scripts/deploy_check.rb

puts "🔍 Verificando configuración para despliegue en Render..."
puts "=" * 50

# Verificar archivos necesarios
required_files = [
  'Dockerfile',
  'render.yaml',
  'config/master.key',
  'config/database.yml',
  'config/environments/production.rb',
  'bin/docker-entrypoint',
  'config/puma.rb'
]

puts "\n📁 Verificando archivos necesarios:"
required_files.each do |file|
  if File.exist?(file)
    puts "✅ #{file}"
  else
    puts "❌ #{file} - FALTANTE"
  end
end

# Verificar configuración de base de datos
puts "\n🗄️ Verificando configuración de base de datos:"
db_config = File.read('config/database.yml')
if db_config.include?('DATABASE_URL')
  puts "✅ DATABASE_URL configurado para producción"
else
  puts "❌ DATABASE_URL no encontrado en database.yml"
end

# Verificar configuración de producción
puts "\n⚙️ Verificando configuración de producción:"
prod_config = File.read('config/environments/production.rb')
checks = [
  ['config.force_ssl = true', 'SSL forzado'],
  ['config.assume_ssl = true', 'SSL asumido'],
  ['config.logger = ActiveSupport::TaggedLogging.logger(STDOUT)', 'Logging a STDOUT'],
  ['config.cache_store = :solid_cache_store', 'Solid Cache configurado'],
  ['config.active_job.queue_adapter = :solid_queue', 'Solid Queue configurado']
]

checks.each do |check, description|
  if prod_config.include?(check)
    puts "✅ #{description}"
  else
    puts "❌ #{description} - FALTANTE"
  end
end

# Verificar Dockerfile
puts "\n🐳 Verificando Dockerfile:"
dockerfile = File.read('Dockerfile')
docker_checks = [
  ['FROM docker.io/library/ruby:', 'Imagen base Ruby'],
  ['ENV RAILS_ENV="production"', 'Entorno de producción'],
  ['EXPOSE 80', 'Puerto expuesto'],
  ['ENTRYPOINT ["/rails/bin/docker-entrypoint"]', 'Entrypoint configurado']
]

docker_checks.each do |check, description|
  if dockerfile.include?(check)
    puts "✅ #{description}"
  else
    puts "❌ #{description} - FALTANTE"
  end
end

# Verificar entrypoint
puts "\n🚀 Verificando entrypoint:"
entrypoint = File.read('bin/docker-entrypoint')
if entrypoint.include?('rails db:prepare')
  puts "✅ Migraciones automáticas configuradas"
else
  puts "❌ Migraciones automáticas no configuradas"
end

if entrypoint.include?('rails db:seed')
  puts "✅ Seeds automáticos configurados"
else
  puts "❌ Seeds automáticos no configurados"
end

if entrypoint.include?('import:movies')
  puts "✅ Importación de películas configurada"
else
  puts "❌ Importación de películas no configurada"
end

# Verificar render.yaml
puts "\n📋 Verificando render.yaml:"
render_config = File.read('render.yaml')
render_checks = [
  ['type: web', 'Servicio web definido'],
  ['env: docker', 'Entorno Docker'],
  ['healthCheckPath: /up', 'Health check configurado'],
  ['RAILS_MASTER_KEY', 'Variable RAILS_MASTER_KEY'],
  ['type: web', 'Servicio web'],
  ['databases:', 'Base de datos definida']
]

render_checks.each do |check, description|
  if render_config.include?(check)
    puts "✅ #{description}"
  else
    puts "❌ #{description} - FALTANTE"
  end
end

puts "\n" + "=" * 50
puts "🎯 Resumen de verificación completado!"
puts "\n📝 Próximos pasos:"
puts "1. Asegúrate de que todos los archivos marcados con ✅ estén presentes"
puts "2. Verifica que tu RAILS_MASTER_KEY esté configurado"
puts "3. Haz commit y push de todos los cambios"
puts "4. Conecta tu repositorio a Render"
puts "5. Configura las variables de entorno en Render"
puts "\n🚀 ¡Tu aplicación está lista para desplegar!" 