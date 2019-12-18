Powershell.exe -executionpolicy remotesigned -File  .\install_applications.ps1
Powershell.exe -executionpolicy remotesigned -File  .\install_python_lib.ps1
Powershell.exe -Command python download_requirements.py
Powershell.exe -executionpolicy remotesigned -File unzip_files.ps1
