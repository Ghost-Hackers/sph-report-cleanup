$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$readmePath = Join-Path $scriptDir "..\..\..\README.md"
$contribPath = Join-Path $scriptDir "..\..\..\CONTRIBUTING.md"
$licensePath = Join-Path $scriptDir "..\..\..\LICENSE.md"
$markedJsPath = Join-Path $scriptDir "..\..\..\assets\scripts\marked.min.js"
$cssPath = Join-Path $scriptDir "..\..\..\assets\styles\github-markdown.css"

function Convert-ToFileUrl($path) {
    return "file:///" + ($path -replace '\\', '/')
}
$cssFileUrl = Convert-ToFileUrl((Resolve-Path $cssPath))
$markedJsFileUrl = Convert-ToFileUrl((Resolve-Path $markedJsPath))

$tempHtml = [System.IO.Path]::GetTempFileName() -replace '.tmp$', '.html'

$readmeContent = Get-Content $readmePath -Raw
if ($readmeContent -is [array]) { $readmeContent = $readmeContent -join "`n" }
if ($readmeContent -isnot [string]) { $readmeContent = [string]$readmeContent }

$contribContent = Get-Content $contribPath -Raw
if ($contribContent -is [array]) { $contribContent = $contribContent -join "`n" }
if ($contribContent -isnot [string]) { $contribContent = [string]$contribContent }

$licenseContent = Get-Content $licensePath -Raw
if ($licenseContent -is [array]) { $licenseContent = $licenseContent -join "`n" }
if ($licenseContent -isnot [string]) { $licenseContent = [string]$licenseContent }

$readmeEscaped = $readmeContent | Out-String | ConvertTo-Json -Compress
$contribEscaped = $contribContent | Out-String | ConvertTo-Json -Compress
$licenseEscaped = $licenseContent | Out-String | ConvertTo-Json -Compress

$projectRoot = Resolve-Path (Join-Path $scriptDir '..\..\..')
$projectRootUrl = "file:///" + ($projectRoot -replace '\\', '/') + "/"
$projectRootUrl = [System.Uri]::EscapeUriString($projectRootUrl)

$html = @"
<!DOCTYPE html>
<html>
<head>
  <meta charset='utf-8'>
  <base href='$projectRootUrl'>
  <title>SPH Report Cleanup - Docs</title>
  <link rel='stylesheet' href='$cssFileUrl'>
  <style>
    body { background:rgb(0, 0, 0); }
    .tab-btns { text-align:center; margin: 1em 0; }
    .tab-btns button { margin: 0 0.5em; padding: 0.5em 1.5em; font-size:1em; border-radius:6px; border:1px solid #333; background:#222; color:#1aff66; cursor:pointer; }
    .tab-btns button.active { background:#1aff66; color:#222; font-weight:bold; }
  </style>
</head>
<body>
  <div class='tab-btns'>
    <button id='btn-readme' class='active'>README</button>
    <button id='btn-contrib'>CONTRIBUTING</button>
    <button id='btn-license'>LICENSE</button>
  </div>
  <article id='content' class='markdown-body'></article>
  <script>
    var docs = {
      readme: $readmeEscaped,
      contrib: $contribEscaped,
      license: $licenseEscaped
    };
    var current = 'readme';
    function render(md) {
      if (typeof marked !== 'undefined') {
        marked.setOptions({
          gfm: true,
          headerIds: true,
          headerPrefix: '',
          mangle: false
        });
      }
      document.getElementById('content').innerHTML = marked.parse(md);
      var headings = document.querySelectorAll('#content h1, #content h2, #content h3, #content h4, #content h5, #content h6');
      headings.forEach(function(heading) {
        if (!heading.id) {
          var id = heading.textContent.trim().toLowerCase().replace(/[^\w\- ]+/g, '').replace(/\s+/g, '-');
          heading.id = id;
        }
      });
    }
    function setTab(tab) {
      current = tab;
      render(docs[tab]);
      document.getElementById('btn-readme').classList.remove('active');
      document.getElementById('btn-contrib').classList.remove('active');
      document.getElementById('btn-license').classList.remove('active');
      document.getElementById('btn-' + tab).classList.add('active');
    }
    document.getElementById('btn-readme').onclick = function() { setTab('readme'); };
    document.getElementById('btn-contrib').onclick = function() { setTab('contrib'); };
    document.getElementById('btn-license').onclick = function() { setTab('license'); };
    function loadScript(src, onload, onerror) {
      var s = document.createElement('script');
      s.src = src;
      s.onload = function() { onload(docs[current]); };
      s.onerror = onerror;
      document.head.appendChild(s);
    }
    loadScript('https://cdn.jsdelivr.net/npm/marked/marked.min.js', render, function() {
      loadScript('$markedJsFileUrl', render, function() {
        document.getElementById('content').innerHTML = '<p style="color:red">Failed to load marked.js from CDN and local backup.</p>';
      });
    });
  </script>
</body>
</html>
"@

Set-Content -Path $tempHtml -Value $html -Encoding UTF8
Start-Process $tempHtml
