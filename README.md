dxf_to_tsv
==========

Convert/Extract point data from a DXF file.

TOC
---
  * [Background](#bkgd)
  * [Use Case](#uc)
  * [Synopsis](#syn)
  * [Disclaimer](#disc)

Background <a id="bkgd"></a>
----------

If you have a DXF file that looks like this:
```
0
SECTION
2
HEADER
9
$EXTMIN
10
89
20
89
9
$EXTMAX
10
111
20
111
9
$LIMMIN
10
89
20
89
9
$LIMMAX
10
111
20
111
0
ENDSEC
0
SECTION
2
TABLES
0
TABLE
2
LTYPE
70
255
0
LTYPE
2
1
70
0
3
SOLID
72
65
73
0
40
0
0
ENDTAB
0
TABLE
2
LAYER
70
4
0
LAYER
2
0
62
7
6
1
70
64
0
ENDTAB
0
TABLE
2
STYLE
70
1
0
STYLE
2
STD
70
0
40
0
41
1
50
0
71
0
42
.2
3
txt
0
ENDTAB
0
ENDSEC
0
SECTION
2
BLOCKS
0
BLOCK
2
CROSS
70
0
10
0
20
0
0
LINE
8
0
62
0
10
-50
20
0
11
50
21
0
0
LINE
8
0
62
0
10
0
20
-50
11
0
21
50
0
ENDBLK
0
ENDSEC
0
SECTION
2
ENTITIES
0
INSERT
8
POINT
62
2
2
CROSS
10
94.6550             
20
101.9206            
30
7.5713              
41
0.002
42
0.002
43
0.002
50
0.0
0
TEXT
8
PT_NO
62
2
7
STD
40
0.25
41
1.0
50
0.0
51
0.0
10
94.6550             
20
101.9206            
30
7.5713              
1
 1       
0
TEXT
```

you can use dxf_to_tsv.pl to extract the coordinates of the points to a Tab Separated Values format, like this:

```
95.8435                 100.7770                7.7682              
95.8017                 100.7849                7.7631              
95.7550                 100.8022                7.7522              
95.7119                 100.8051                7.7555
...
```

Use case <a id="uc"></a>
--------

This is needed if you want to use files exported in DXF format from a Leica TPS 400 (http://www.leica-geosystems.com/en/page_catalog.htm?cid=132) in QuantumGis (http://www.qgis.org/).

Synopsis <a id="syn"></a>
--------

Extract data from one file:
```sh
$ dxt_to_tsv.pl filename
```

Extract data from one file and save it to a new file:
```sh
$ dxt_to_tsv.pl filename > new_filename.tsv
```

Extract data from multiple files in same directory and save to new files in same directory:
```sh
find . -type f -iname '*.DXF' -exec sh -c '/YOUR/PATH/TO/dxf_to_tsv.pl "$0" > "$0".tsv' {} ';'
```
this will create new files named filename.dxf.tsv in the same directory. Change /YOUR/PATH/TO to where the script is located.

Disclaimer <a id="disc"></a>
----------

Script tested on Ubuntu Linux with Perl v5.10.1. Cannot guarantee it will work for you.