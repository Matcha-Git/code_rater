Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationFramework

$global:progressForm = New-Object System.Windows.Forms.Form
$progressForm.Text = "Rating your code..."
$progressForm.Size = New-Object System.Drawing.Size(350, 150)
$progressForm.StartPosition = "CenterParent"
$progressForm.FormBorderStyle = "FixedDialog"
$progressForm.MaximizeBox = $false
$progressForm.MinimizeBox = $false

$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Minimum = 0
$progressBar.Maximum = 4
$progressBar.Value = 0
$progressBar.Style = 'Continuous'
$progressBar.Width = 300
$progressBar.Height = 30
$progressBar.Location = New-Object System.Drawing.Point(20, 20)
$progressForm.Controls.Add($progressBar)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.AutoSize = $true
$statusLabel.Location = New-Object System.Drawing.Point(20, 60)
$statusLabel.Text = "Start Rating..."
$progressForm.Controls.Add($statusLabel)

$progressForm.Show()

$statusLabel.Text = "Rating Syntax..."
$progressForm.Refresh()
Start-Sleep -Seconds 1.5
$progressBar.Value = 1

$statusLabel.Text = "Rating Logic..."
$progressForm.Refresh()
Start-Sleep -Seconds 1.5
$progressBar.Value = 2

$statusLabel.Text = "Searching Mistakes..."
$progressForm.Refresh()
Start-Sleep -Seconds 2
$progressBar.Value = 3

$statusLabel.Text = "Rating Mistakes..."
$progressForm.Refresh()
Start-Sleep -Seconds 3
$progressBar.Value = 4

$progressForm.Close()

[System.Windows.MessageBox]::Show(
    "Sorry but, your code is absoulte trash.`n0/10`n$_",
    "Rating your code",
    'OK',
    'Error'
)