#!/bin/bash

echo "Updating Ollama instance..."
curl -fsSL https://ollama.com/install.sh | sh

echo "Updating OpenWebUI container..."
docker run --rm --volume /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower --run-once open-webui
