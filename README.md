dxf_to_tsv
==========

Convert/Extract point data from a DXF file.

Background
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

[...]

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
```

you can use dxf_to_tsv.pl to extract the coordinates of the points to a Tab Separated Values format, like this:

```
95.8435                 100.7770                7.7682              
95.8017                 100.7849                7.7631              
95.7550                 100.8022                7.7522              
95.7119                 100.8051                7.7555
...
```

Use Case
--------

This is needed if you want to use files exported in DXF format from a Leica TPS 400 (http://www.leica-geosystems.com/en/page_catalog.htm?cid=132) in QuantumGis (http://www.qgis.org/).

Synopsis
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

Disclaimer
----------

Script tested on Ubuntu Linux with Perl v5.10.1. Cannot guarantee it will work for you.