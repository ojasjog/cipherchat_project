# 🧑‍💻 CipherChat: DevSync Pro

**CipherChat: DevSync Pro** is a lightweight, developer-focused chat system built on the Internet Computer (IC).
It enables encrypted, context-tagged conversations where developers can sync messages globally while retaining identity with usernames.

---

## ✨ Features

* 🔐 **Set a Username** – Identify yourself uniquely in the chat (stored per Principal).
* 💬 **Global Chat** – All messages are visible to everyone (global history).
* 🏷 **Context Tagging** – Attach a tag to each message (e.g., `commit:abc123`, `feature:login`, etc.).
* 🧩 **Encryption (simulated)** – Messages are Base64-encoded (placeholder for future AES/real encryption).
* 🎨 **Modern UI** – Hacker-friendly interface with monospace fonts and dark theme.
* ⏳ **Timestamps** – Every message stored with time of submission.

---

## 🛠️ Tech Stack

* **Backend:** [Motoko](https://internetcomputer.org/docs/current/references/motoko-ref/) on Internet Computer
* **Frontend:** Pure **HTML + CSS + JavaScript** (no frameworks)
* **Storage:** Stable variables (persist data across upgrades)

---

## 📂 Project Structure

```
cipherchat_project/
│
├── src/
│   └── cipherchat_project_backend/
│       └── main.mo        # Motoko backend logic
│
├── frontend/
│   └── index.html         # Chat UI
│
├── dfx.json               # DFX canister config
└── README.md              # Project documentation
```

---

## 🔧 Backend (Motoko)

The backend (`main.mo`) manages **usernames** and **messages**.

### Core Types

```motoko
public type Message = {
  id : Nat;
  sender : Text;
  content : Text;
  timestamp : Time.Time;
};
```

### Functions

* `setUsername(name : Text)` → Assign a display name to your Principal.
* `getUsername(p : Principal)` → Lookup username of a given user.
* `sendMessage(content : Text)` → Send a new message, auto-linked to caller’s username.
* `getMessages()` → Return all global messages.

### Persistence

* Messages (`[Message]`) and usernames (`HashMap<Principal, Text>`) are stored in stable variables.
* `preupgrade` / `postupgrade` hooks preserve state across canister upgrades.

---

## 🎨 Frontend (HTML + JS)

The `index.html` file provides a simple interface.

### Features:

* Username input box with persistence (`localStorage`).
* Input for **context tags** (commit IDs, topics, etc.).
* Message box with Base64 **encrypt/decrypt** simulation.
* Display of messages with context, sender, and content.

### Screenshot (conceptual):

```
🧑‍💻 CipherChat: DevSync Pro

👤 Current user: ojas

🔖 commit:abc123
👤 ojas
fix: added encryption handler
```

---

## 🚀 Running the Project

### Prerequisites

* [DFX SDK](https://internetcomputer.org/docs/current/references/cli-reference/dfx-parent) installed.
* Node.js (optional, for tooling).

### Steps

1. **Start local replica:**

   ```bash
   dfx start --background
   ```

2. **Deploy backend canister:**

   ```bash
   dfx deploy
   ```

3. **Serve frontend:**

   * Open `frontend/index.html` in your browser
   * (Or, integrate it into a frontend canister via `dfx.json`)

---

## 🔮 Roadmap

* [ ] Replace Base64 with **real AES-GCM encryption**.
* [ ] Add **private chat channels**.
* [ ] UI: Improve styling & live auto-refresh.
* [ ] Backend: Add pagination for chat history.

---

## 🤝 Contributing

1. Fork & clone this repo.
2. Work on a feature branch.
3. Submit a PR with detailed description.

---

## 📜 License

MIT License © 2025 CipherChat Team

---

⚡ *CipherChat: DevSync Pro – secure, developer-first global collaboration.*

---


