FROM node:16 AS build
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
