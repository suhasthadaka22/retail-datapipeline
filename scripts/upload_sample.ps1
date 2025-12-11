param(
    [string]$storageAccount,
    [string]$container = "retail",
    [string]$folder = "landing/retail"
)

Write-Host "Uploading sample files to ADLS Gen2..."

az storage fs directory create `
    --account-name $storageAccount `
    --file-system $container `
    --name $folder `
    --auth-mode login

az storage fs file upload `
    --account-name $storageAccount `
    --file-system $container `
    --path "$folder/retail_sales_sample.json" `
    --source "samples/retail_sales_sample.json" `
    --auth-mode login `
    --overwrite true

az storage fs file upload `
    --account-name $storageAccount `
    --file-system $container `
    --path "$folder/retail_sales_sample.csv" `
    --source "samples/retail_sales_sample.csv" `
    --auth-mode login `
    --overwrite true

Write-Host "Upload complete."
