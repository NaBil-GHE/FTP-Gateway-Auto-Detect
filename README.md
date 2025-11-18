# FTP Gateway Auto-Detect and Opener

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![Batch Script](https://img.shields.io/badge/language-Batch-green.svg)](https://en.wikipedia.org/wiki/Batch_file)

**Created by: NABIL GHENISSA**

A lightweight Windows batch script that automatically detects your network's default gateway IP address and establishes an FTP connection through Windows Explorer.

---

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [How It Works](#how-it-works)
- [Troubleshooting](#troubleshooting)
- [FAQ](#faq)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

---

## 🎯 Overview

This utility simplifies FTP connections to your network gateway by automatically detecting the gateway IP address and opening an FTP session in Windows Explorer. Perfect for users who frequently need to access FTP servers running on their router or network gateway device.

**Use Cases:**
- Quick access to router/gateway FTP servers
- Network administration tasks
- File transfers to/from gateway devices
- Testing FTP connectivity

---

## ✨ Features

- ✅ **Automatic Gateway Detection** - Intelligently detects your network's default gateway IP address
- ✅ **Custom Port Support** - Configurable FTP port (default: 2221)
- ✅ **Manual Fallback** - Allows manual IP entry if auto-detection fails
- ✅ **User-Friendly Interface** - Styled console with color-coded messages
- ✅ **Windows Explorer Integration** - Opens FTP directly in familiar Windows interface
- ✅ **Lightweight** - No installation required, single batch file
- ✅ **Cross-Language Support** - Works with different Windows language versions

---

## 📦 Requirements

Before using this tool, ensure you have:

- **Operating System**: Windows 7 or later (Windows 10/11 recommended)
- **Network**: Active network connection with a configured gateway
- **FTP Server**: FTP server running on your gateway device
- **Permissions**: User account with network access rights

**Optional:**
- Administrator privileges (for certain network configurations)

---

## 🚀 Installation

### Method 1: Quick Start (Recommended)

1. **Download the repository**:
   - Click the green "Code" button on GitHub
   - Select "Download ZIP"
   - Extract the ZIP file to your desired location

2. **Create a shortcut** (Optional):
   - Right-click on `open_ftp.bat`
   - Select "Create shortcut"
   - Move the shortcut to your desktop or Quick Access folder

### Method 2: Git Clone

```bash
git clone https://github.com/NaBil-GHE/FTP-Gateway-Auto-Detect.git
cd FTP-Gateway-Auto-Detect
```

### Method 3: Direct Download

Download just the `open_ftp.bat` file directly from the repository and save it to any folder.

---

## 💻 Usage

### Basic Usage

1. **Navigate** to the folder containing `open_ftp.bat`
2. **Double-click** the `open_ftp.bat` file
3. The script will:
   - Display a styled console window
   - Automatically detect your gateway IP
   - Show the detected IP address
   - Open Windows Explorer with the FTP connection

### Advanced Usage

#### Running from Command Line

```cmd
cd path\to\FTP-Gateway-Auto-Detect
open_ftp.bat
```

#### Creating a Desktop Shortcut

1. Right-click on `open_ftp.bat`
2. Select "Send to" → "Desktop (create shortcut)"
3. Rename the shortcut to "FTP Gateway Opener"
4. (Optional) Change the icon by right-clicking the shortcut → Properties → Change Icon

#### Running with Parameters

The script can be modified to accept command-line parameters for advanced users. See [Configuration](#configuration) section.

---

## ⚙️ Configuration

### Changing the FTP Port

To modify the FTP port number:

1. Open `open_ftp.bat` in a text editor (Notepad, VS Code, etc.)
2. Locate line 50:
   ```bat
   set ftpport=2221
   ```
3. Change `2221` to your desired port number:
   ```bat
   set ftpport=21
   ```
4. Save the file

### Customizing Console Appearance

To change the console colors:

1. Locate line 3 in the script:
   ```bat
   color 0A
   ```
2. Modify the color code:
   - First digit: Background color (0 = Black)
   - Second digit: Text color (A = Light Green)
   
**Common Color Codes:**
- `0A` - Black background, Light Green text (default)
- `0F` - Black background, White text
- `1F` - Blue background, White text
- `0E` - Black background, Yellow text

### Adding Authentication

For FTP servers requiring authentication, Windows will prompt you for credentials when connecting. To save credentials:

1. Connect to the FTP server
2. Enter your username and password when prompted
3. Check "Save password" if you want Windows to remember

---

## 🔧 How It Works

### Technical Overview

The script performs the following operations:

1. **Gateway Detection**:
   - Executes `ipconfig` command
   - Searches for "Passerelle" (French for Gateway) in the output
   - Extracts the IP address using token parsing
   - Handles multiple language versions of Windows

2. **IP Validation**:
   - Checks if gateway IP was successfully detected
   - Falls back to manual entry if detection fails

3. **FTP URL Construction**:
   - Builds FTP URL: `ftp://[gateway_ip]:[port]/`
   - Uses the configured port number

4. **Windows Explorer Integration**:
   - Launches Windows Explorer with the FTP URL
   - Opens in network location view

### Script Flow Diagram

```
Start
  ↓
Display Header
  ↓
Run ipconfig command
  ↓
Parse output for gateway IP
  ↓
[Gateway Found?] → No → Prompt for manual entry
  ↓ Yes
Display detected IP
  ↓
Construct FTP URL with port
  ↓
Open in Windows Explorer
  ↓
Wait 2 seconds
  ↓
End
```

---

## 🔍 Troubleshooting

### Issue: Gateway IP Not Detected

**Symptoms**: Script shows "No gateway IP detected"

**Solutions**:
1. Check your network connection is active
2. Ensure you have a default gateway configured
3. Run `ipconfig` manually to verify gateway exists
4. Try running the script as Administrator
5. Manually enter the gateway IP when prompted

### Issue: Windows Explorer Cannot Connect

**Symptoms**: Explorer opens but shows connection error

**Solutions**:
1. **Check FTP Server**: Verify the FTP server is running on your gateway
2. **Test Port**: Try changing to standard port 21
3. **Firewall**: Check if Windows Firewall is blocking FTP (port 21 or 2221)
4. **Alternative Method**: Use browser with URL: `ftp://gateway_ip:2221`

### Issue: Custom Port Not Working

**Symptoms**: Connection fails with non-standard port

**Windows Explorer Limitation**: Windows Explorer has limited support for custom FTP ports.

**Solutions**:
1. Configure your FTP server to use standard port 21
2. Use a web browser instead (Chrome, Firefox, Edge)
   - Navigate to: `ftp://your.gateway.ip:2221`
3. Use dedicated FTP clients:
   - **FileZilla** (Free, recommended)
   - **WinSCP** (Free)
   - **Cyberduck** (Free)
   - **Total Commander** (Paid)

### Issue: Permission Denied

**Symptoms**: Access denied or authentication failure

**Solutions**:
1. Verify FTP server credentials
2. Check user permissions on FTP server
3. Ensure anonymous access is enabled (if applicable)
4. Try different Windows user account

### Issue: Script Window Closes Immediately

**Symptoms**: Console window flashes and closes

**Solutions**:
1. Run from Command Prompt to see errors
2. Check if batch file is corrupted
3. Re-download the script
4. Add `pause` at the end of the script for debugging

---

## ❓ FAQ

### Q: Does this work with routers from all manufacturers?

**A:** Yes, as long as your router/gateway has an FTP server enabled and accessible.

### Q: Can I use this for remote FTP servers?

**A:** The script is designed for gateway detection, but you can modify it to connect to any IP by manually entering the address when prompted.

### Q: Is this secure?

**A:** The script itself is safe. However, FTP is an unencrypted protocol. For sensitive data, consider using SFTP or FTPS instead.

### Q: Why doesn't it work with my language version of Windows?

**A:** The script searches for "Passerelle" (French). For other languages, modify line 17 to match your language's term for "Gateway" or "Default Gateway".

**Common translations:**
- English: "Default Gateway"
- French: "Passerelle"
- German: "Standardgateway"
- Spanish: "Puerta de enlace"
- Italian: "Gateway predefinito"

### Q: Can I connect to multiple gateways?

**A:** Currently, the script connects to the default gateway only. You can create multiple copies of the script with different hardcoded IPs for different gateways.

### Q: Does this work on macOS or Linux?

**A:** No, this is a Windows batch script. For Unix-based systems, you'd need to create a shell script equivalent.

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

### Reporting Issues

1. Check existing issues first
2. Create a new issue with:
   - Clear description of the problem
   - Steps to reproduce
   - Expected vs actual behavior
   - Your Windows version
   - Screenshots if applicable

### Suggesting Enhancements

1. Open an issue with the "enhancement" tag
2. Describe your suggestion clearly
3. Explain the use case and benefits

### Submitting Pull Requests

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Make your changes
4. Test thoroughly on different Windows versions
5. Commit with clear messages: `git commit -m "Add: feature description"`
6. Push to your fork: `git push origin feature/your-feature-name`
7. Open a Pull Request with detailed description

### Code Style Guidelines

- Use clear, descriptive variable names
- Add comments for complex logic
- Maintain consistent indentation
- Test on Windows 10 and 11

---

## 📄 License

This project is free to use and modify. Feel free to adapt it to your needs.

**MIT License** - See repository for full license details.

---

## 👤 Author

**NABIL GHENISSA**

- GitHub: [@NaBil-GHE](https://github.com/NaBil-GHE)
- Repository: [FTP-Gateway-Auto-Detect](https://github.com/NaBil-GHE/FTP-Gateway-Auto-Detect)

---

## 🙏 Acknowledgments

- Thanks to the Windows command-line community
- Inspired by network administration needs
- Built for simplicity and ease of use

---

## 📞 Support

For issues, questions, or suggestions:
1. Open an issue on GitHub
2. Check the [Troubleshooting](#troubleshooting) section
3. Review the [FAQ](#faq)

---

**⭐ If you find this tool useful, please consider giving it a star on GitHub!**

---

*Last updated: November 2025*
