# renamefolder
Powershell rename folder when it is available for rename

Reqires 2 inputs:

1. Full path to folder (network path also acceptable, like "\\server\folder\" or just "\\server\" if folder is in root directory). Must end with "\".
2. Folder name. (Without any "\").

After checking that folder is accessable - renames it, adding "_" at before the old name.

Feel free to edit to your needs.
