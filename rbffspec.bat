REM rbffspec
REM SROM
copy 38AC8F 223-s1.s1
copy /b 223-s1.s1+

REM MROM PROM
romcutter 222200 223-m1.m1 0 20000

romcutter 222200 223-p1.p1 20000 100000
romcutter 222200 223-p2.sp2 120000 400000

REM PROM
REM romcutter 231B45 223-p1.p1 0 100000
REM romcutter 231B45 223-p2.sp2 100000 200000

REM VROM
romcutter F8927C 223-v1.v1 0 400000
romcutter F8927C 223-v2.v2 400000 400000
romcutter F8927C 223-v3.v3 800000 400000

REM CROM
copy /b 3A46CC+71D290+9EE088+D36960 crom
romcutter crom c1c2 0 800000
romcutter crom c3c4 800000 800000
romcutter crom c5c6 1000000 800000
romcutter crom c7c8 1800000 800000

BSwap.exe d B c1c2 oddeven.txt 223-c1.c1 223-c2.c2
BSwap.exe d B c3c4 oddeven.txt 223-c3.c3 223-c4.c4
BSwap.exe d B c5c6 oddeven.txt 223-c5.c5 223-c6.c6
BSwap.exe d B c7c8 oddeven.txt 223-c7.c7 223-c8.c8

REM delete
del c1c2 c3c4 c5c6 c7c8
del crom

REM compress
powershell Compress-Archive 223*.* -Force -DestinationPath rbffspec.zip
