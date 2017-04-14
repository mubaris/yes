if ($args.Length -eq 0)
{
    $out = "y"
}
else
{
    $out = ([String]::Join(' ', $args))
}

while($true)
{
    Write-Host $out
}