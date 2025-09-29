This is a fantastic development\! Based on the URL you provided, your project is not a general social network, but a specialized application called **Smart Things Finder System (STFS)**, a campus Lost & Found assistant.

I've integrated the project's real purpose with the technical details I know about your PHP/MySQL code to create a comprehensive `README.md` file.

-----

# 🎓 Ritik-STFS: Smart Things Finder System 

A full-stack web application designed to serve as a **Campus Lost & Found Assistant**. This system simplifies the process of reporting, searching, and recovering lost and found items for students, staff, and campus visitors, promoting a more organized and responsible community.

The project is built as part of my IT Engineering coursework, focusing on practical database management, secure user handling, and dynamic web functionality.

## ✨ Project Highlights & Features

| Feature Category | Description | Technical Implementation |
| :--- | :--- | :--- |
| **Core Functionality** | **Report Lost Item:** Quickly submit details of a misplaced item. | `add_post.php` logic adapted for item reporting. |
| | **Report Found Item:** Upload details and images of an item found on campus. | Handles file uploads and sanitization on the server. |
| | **Search Database:** Instantly browse and filter items reported as lost or found. | Requires database querying and filtering logic. |
| **User Management** | Secure **Sign Up** and **Login/Logout** functionality. | Uses PHP Sessions and password hashing (`$2y$10...`). |
| | **Profile Editing:** Users can update their personal details and profile picture. | Implemented via AJAX using `edit_profile.php`. |
| **Interactivity** | **Post Actions:** Functionality for liking/disliking posts (which can be repurposed for verifying or confirming item reports). | Uses AJAX calls to `like_post.php`. |
| **Security Focus** | Implements basic input validation and sanitization (`htmlspecialchars`, `filter_var`) to mitigate **XSS** and ensure data integrity. | Used throughout the backend scripts. |

-----

## 🛠️ Technology Stack

| Category | Technology |
| :--- | :--- |
| **Backend** | **PHP 7.4+** (Core logic, server-side processing, file handling) |
| **Database** | **MySQL / MariaDB** (Data storage for Users and Items/Posts) |
| **Interactivity** | **jQuery / AJAX** (Dynamic updates for profile edits and item interactions) |
| **Frontend** | HTML5, CSS3, Bootstrap (Based on the live site's design) |

-----

## ⚙️ Installation and Setup

### 1\. Requirements

  * Web Server (Apache/Nginx)
  * PHP 7.4+
  * MySQL/MariaDB

### 2\. Clone the Repository

```bash
git clone https://github.com/Ritikk2110/Ritik-STFS.git
cd Ritik-STFS
```

### 3\. Database Configuration

1.  Create a new MySQL database (e.g., `stfs_db`).
2.  Import the database schema using the provided SQL file (likely `database/stfs_db.sql`).
3.  **Update Database Credentials:** Modify your database connection file (e.g., `config/db.php` or similar) with your local host, username, and password.

### 4\. Run the Application

Navigate to the project's entry point in your browser (e.g., `http://localhost/Ritik-STFS/index.php`) to start using the system.

-----

## 👨‍💻 Developed By

This project was developed by **Ritik Kumar** as an exercise in building a practical and impactful application using web technologies.

  * **Live Demo:** [https://find1now.infinityfreeapp.com/](https://find1now.infinityfreeapp.com/)
  * **Education:** IT Engineering, Ramswaroop College
  * **GitHub:** **[Ritikk2110](https://www.google.com/search?q=https://github.com/Ritikk2110)**

I welcome feedback on code structure, security enhancements (especially CSRF protection\!), and suggestions for future feature development.

-----
