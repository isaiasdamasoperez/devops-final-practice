# Imagen base oficial de Node
FROM node:20-alpine

WORKDIR /app

# Copia manifest(s)
COPY package*.json ./

# Si hay lockfile usa npm ci; si no, npm install
RUN if [ -f package-lock.json ]; then \
      npm ci --omit=dev; \
    else \
      npm install --omit=dev; \
    fi

# Copia el resto del código
COPY . .

EXPOSE 3000
CMD ["node", "src/index.js"]
