# build-site.ps1
Write-Host "`nSetting up ThreeWay Mobile Evidence Services site..." -ForegroundColor Cyan

# Step 1: Create folder structure
$folders = @("content\about", "content\services", "content\packages", "content\contact", "content\posts")
foreach ($folder in $folders) {
    if (-not (Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder | Out-Null
        Write-Host "Created folder: $folder" -ForegroundColor Green
    }
}

# Step 2: Create and populate content files

# About
Set-Content "content\about\_index.md" @"
---
title: "About"
draft: false
---

ThreeWay Mobile Evidence Services helps attorneys and clients recover key digital evidence from mobile phones in a clear, reviewable format.
"@

# Services
Set-Content "content\services\_index.md" @"
---
title: "Services"
draft: false
---

- 📱 Text Message Extraction  
- 💬 App Data (Messenger, WhatsApp, etc.)  
- 📞 Call Logs  
- 📷 Photo & Attachment Recovery  
- 🧾 Printable Report & Thumb Drive
"@

# Packages
Set-Content "content\packages\_index.md" @"
---
title: "Packages"
draft: false
---

**Basic Report** – SMS & call logs  
**Full App Review** – Adds Messenger/WhatsApp  
**Attorney Bundle** – All data + labeled report + USB export
"@

# Contact
Set-Content "content\contact\_index.md" @"
---
title: "Contact"
draft: false
---

📞 Phone: (Add your number)  
📧 Email: (Add your email)  

We offer free consultations and fast, attorney-friendly exports.
"@

# Blog Post
$date = Get-Date -Format "yyyy-MM-dd"
Set-Content "content\posts\launch.md" @"
---
title: "We're Live!"
date: $date
draft: false
---

ThreeWay Mobile Evidence Services is now live! We help attorneys and clients recover digital evidence cleanly and securely.
"@

Write-Host "`nContent created successfully." -ForegroundColor Cyan

# Step 3: Start Hugo server
Write-Host "`nStarting Hugo server..." -ForegroundColor Yellow
hugo server
