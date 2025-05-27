# 💠 Batch Script Collection

This repository contains a set of batch (`.bat`) scripts designed to automate common Windows tasks. Each script serves a specific purpose and is written for ease of use, with simple logic and minimal dependencies.

---

## 📁 Available Scripts

| Script Name            | Description                                             |
| ---------------------- | ------------------------------------------------------- |
| `zip_images.bat`       | Zips all image files from a specified user folder.      |
| `cleanup_temp.bat`     | Deletes temporary files and folders to free up space.   |
| `backup_documents.bat` | Archives and timestamps your `Documents` folder.        |
| `launch_tools.bat`     | Opens commonly used tools and apps with one click.      |
| `wifi_passwords.bat`   | Displays saved Wi-Fi passwords (admin rights required). |

---

## ▶️ How to Use

1. **Download or Clone** the repository:

   ```bash
   git clone https://github.com/yourusername/batch-scripts.git
   ```

2. **Navigate to the directory**:

   ```cmd
   cd batch-scripts
   ```

3. **Run a script**:

   - Double-click the `.bat` file, or
   - Run it from `cmd.exe`:

     ```cmd
     zip_images.bat
     ```

---

## ⚙️ Requirements

- Windows 10 or later
- PowerShell (included with Windows)
- Some scripts may require Administrator access

---

## ✏️ Customization

- Modify paths, file extensions, and logic inside the `.bat` files to suit your needs.
- Environment variables like `%USERPROFILE%` and `%CD%` are used for flexibility.

---

## 🗂️ Logging

Scripts like `zip_images.bat` generate logs (`log.txt`) to keep a history of operations:

```
YYYY-MM-DD-HHMM Zipped files from C:\Users\Username\Pictures
```

---

## 📌 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋‍♂️ Contributions

Feel free to fork this repo and submit pull requests for improvements or additional batch scripts. Feedback is always welcome!
