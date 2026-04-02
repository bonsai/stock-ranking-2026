# Simple HTTP Server for Local Testing
# Run this to avoid file:// security restrictions

Write-Host "Starting local server..." -ForegroundColor Cyan
Write-Host "Open: http://localhost:8080/setup-api-key.html" -ForegroundColor Green
Write-Host "Press Ctrl+C to stop`n" -ForegroundColor Gray

# Start HTTP server on port 8080
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8080/")
$listener.Start()

Write-Host "Server running at http://localhost:8080/" -ForegroundColor Green

# Serve files
while($listener.IsListening) {
  $context = $listener.GetContext()
  $request = $context.Request
  $response = $context.Response
  
  $path = $request.Url.LocalPath.TrimStart('/')
  if([string]::IsNullOrEmpty($path)) { $path = 'setup-api-key.html' }
  
  $filePath = Join-Path $PSScriptRoot $path
  
  if(Test-Path $filePath) {
    $content = Get-Content $filePath -Raw -Encoding UTF8
    $ext = [System.IO.Path]::GetExtension($filePath)
    
    $contentType = switch($ext) {
      '.html' { 'text/html' }
      '.js'   { 'application/javascript' }
      '.css'  { 'text/css' }
      '.json' { 'application/json' }
      default { 'text/plain' }
    }
    
    $buffer = [System.Text.Encoding]::UTF8.GetBytes($content)
    $response.ContentType = $contentType
    $response.ContentLength64 = $buffer.Length
    $response.OutputStream.Write($buffer, 0, $buffer.Length)
  } else {
    $response.StatusCode = 404
    $response.StatusDescription = 'Not Found'
  }
  
  $response.Close()
}
