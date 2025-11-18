# FTP Gateway Auto-Detect and Opener

**Created by: NABIL GHENISSA**  

## Description
This batch script automatically detects your network's default gateway IP address and opens it as an FTP connection in Windows Explorer.

## Features
- ✅ Automatic detection of default gateway (Passerelle par défaut)
- ✅ Opens FTP connection with custom port (2221)
- ✅ Fallback to manual IP entry if auto-detection fails
- ✅ Styled console interface with colors

## Usage
1. Double-click `open_ftp.bat`
2. The script will automatically detect your gateway IP
3. FTP connection will open in Windows Explorer

## Configuration
To change the FTP port, edit line 38 in the script:
```bat
set ftpport=2221
```

## Requirements
- Windows OS
- Network connection with configured gateway
- FTP server running on the gateway

## Notes
⚠️ **Important**: Windows Explorer has limited support for custom FTP ports. If you experience issues, consider:
- Using a web browser (Chrome, Firefox, Edge) instead
- Configuring the FTP server on standard port 21
- Using a dedicated FTP client (FileZilla, WinSCP)

## Author
**NABIL GHENISSA**

## License
Free to use and modify

---
*For issues or suggestions, contact the author.*
