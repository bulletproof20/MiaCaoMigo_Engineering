python -m venv .venv

.\.venv\Scripts\Activate.ps1

pip install -r .docs\requirements.txt

Write-Host ""
Write-Host "================================="
Write-Host "MiaCaoMigo Docs Ready"
Write-Host "================================="
Write-Host ""
Write-Host "Run documentation server with:"
Write-Host ".\.docs\scripts\run_docs.ps1"
