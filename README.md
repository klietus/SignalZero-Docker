# SignalZero Docker Stack

This repository contains the Docker orchestration configuration for **SignalZero**, a recursive symbolic cognition system. It provides a complete, pre-configured stack including the backend kernel, frontend chat interface, and necessary databases.

## 🚀 Quick Start

Run the entire SignalZero environment with a single command:

```bash
docker-compose -f docker-compose.release.yml up
```

Access the application at: **[http://localhost:3000](http://localhost:3000)**

## 📦 Stack Components

*   **SignalZero Node (Kernel):** The core backend service (Node.js/Express).
*   **SignalZero Chat (Frontend):** The React-based web interface.
*   **Redis:** High-performance storage for symbolic memory and caching.
*   **ChromaDB:** Vector database for semantic search and retrieval.

## 🛠 Prerequisites

*   **Docker** and **Docker Compose** installed on your machine.
*   (Optional) An inference provider API key (e.g., OpenAI, Gemini) if you are not using a local LLM runner like LM Studio.

## ⚙️ Configuration

The stack comes with default settings optimized for local development.

### Inference Provider
By default, the system is configured to look for a **Local Inference Server** (like LM Studio) running on your host machine at port `1234`.

To change this (e.g., to use OpenAI or Gemini), you can use the **Setup Wizard** in the web interface upon first launch, or modify the `docker-compose.release.yml` environment variables:

```yaml
  localnode:
    environment:
      - INFERENCE_PROVIDER=openai  # or 'gemini' or 'local'
      - INFERENCE_ENDPOINT=https://api.openai.com/v1
      # API Keys are securely managed via the UI/Settings API
```

### Persistence
Data is persisted in Docker volumes:
*   `redis_data`: Symbolic memory and domains.
*   `chroma_data`: Vector embeddings.
*   `node_data`: System settings and configuration.
*   `node_logs`: Application logs.

## 🔄 Updates

To update to the latest version of SignalZero:

```bash
docker-compose -f docker-compose.release.yml pull
docker-compose -f docker-compose.release.yml up -d
```

## 📜 License

**Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)**

Commercial use of this software is strictly prohibited under this license. To obtain a license for commercial use, please contact: `klietus@gmail.com`.
