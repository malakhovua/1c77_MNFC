cd C:\1C_Base\repository\1c77_MNFC
.\gcomp_bin_2.2.15\Release\gcomp.exe -vv  -d  -F .\1CV7.md -D .\conf
del .\1CV7.md
git add .
git commit 
.\gcomp_bin_2.2.15\Release\gcomp.exe -vv  -c -F .\MD_compile\1Cv7.MD  -DD .\conf
git push