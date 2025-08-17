# Imagen base oficial de Node
FROM node:20-alpine

# Crear directorio de la app
WORKDIR /app

# Instalar dependencias primero (mejor cache)
COPY package.json package-lock.json* /app/
RUN npm ci --omit=dev

# Copiar código
COPY . /app

# Puerto expuesto
EXPOSE 3000

# Comando de inicio
CMD ["node", "src/index.js"]
