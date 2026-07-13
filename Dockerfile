# ============================================================
# Multi-Sport Workout Tracker — Docker Image
# Serves static files via Nginx Alpine (image ~7MB)
# ============================================================
# Build:  docker build -t workout-tracker .
# Run:    docker run -d -p 9999:80 workout-tracker
# Access: http://localhost:9999
# ============================================================

FROM nginx:alpine

# Hapus default Nginx welcome page
RUN rm -rf /usr/share/nginx/html/*

# Copy app files ke Nginx document root
COPY index.html /usr/share/nginx/html/
COPY firebase-config.js /usr/share/nginx/html/
COPY logo.svg /usr/share/nginx/html/

# Custom Nginx config untuk SPA (optional tapi good practice)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
