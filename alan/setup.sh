#!/bin/bash

echo "Installing Ollama instance..."
curl -fsSL https://ollama.com/install.sh | sh

echo "Installing and starting OpenWebUI container..."
docker run -d \
  -p 3030:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v ollama:/root/.ollama \
  -v /home/patrick/github.com/davidsneighbour/dotfiles/modules/containers/_protected/alan:/app/backend/data \
  -e WEBUI_AUTH=false \
  -e WEBUI_NAME=Alan \
  -e ENABLE_COMMUNITY_SHARING=false \
  -e OLLAMA_BASE_URL=http://127.0.0.1:11434 \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main
