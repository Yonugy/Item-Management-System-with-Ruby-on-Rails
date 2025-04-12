
# 🧾 Item Management System

A simple item management web application built with **vanilla JavaScript**, **HTML/CSS**, and a **Ruby on Rails + GraphQL** backend. Users can:

- 🔍 Search and filter items
- ⬆️ Sort by name or category
- ⭐ Mark/unmark items as favorites
- 📦 Manage item categories
- ➕ Add new items via a form

Live Demo: [https://item-management-system-brown.vercel.app](https://item-management-system-brown.vercel.app)

---

## 🚀 Features

- **GraphQL API** using Ruby on Rails
- Perform **search, filter, sort**
- Toggle favorite status for each item
- Automatically populated category checkboxes and dropdown
- Lightweight frontend using only vanilla JS & HTML

---

## 📦 Tech Stack

### Frontend:
- HTML5
- CSS3
- JavaScript (Vanilla JS)
- Fetch API for interacting with GraphQL

### Backend:
- Ruby on Rails
- GraphQL (via graphql-ruby)
- PostgreSQL (hosted on Render)

---

## ✨ Sample GraphQL Queries

### Fetch Items
```graphql
query {
  items(search: "pen", filterBy: "title", sortBy: "title", sortOrder: "asc", favourite: false, categories: ["Stationery"]) {
    id
    title
    category
    isFavorite
  }
}
```

### Create Item
```graphql
mutation {
  createItem(input: { title: "Marker", category: "Office", isFavorite: false }) {
    item {
      id
      title
      category
      isFavorite
    }
  }
}
```

### Toggle Favorite
```graphql
mutation {
  toggleFavourite(input: { id: 1 }) {
    item {
      id
      isFavorite
    }
  }
}
```

---

## 📁 Project Structure

```
/backend            # Rails app with GraphQL API
/index.html         # Frontend (vanilla HTML/JS)
```

---

## 🙌 Author

Made with ❤️ by Yong Wai

---

## 📜 License

This project is licensed under the MIT License.
