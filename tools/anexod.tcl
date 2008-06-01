#!/usr/bin/tclsh
set anexod [open AnexoD.tex w]


puts $anexod "\\documentclass\[12pt\]\{article\}
\\usepackage\{graphicx,url\}
\\usepackage\[latin1,utf8\]\{inputenc\}
\\usepackage\{fancyvrb\}
\\begin\{document\}
"

foreach i [glob  -type f *{0,1,2,3,4,5,6,7,8,9}*.txt] {
	puts $anexod "\\begin\{VerbatimInput\}\[frame=single, fontsize=\\tiny, numbers=left, label=$i\]"
	#puts $anexod "\{../../data/$i\}"
	puts $anexod "\{$i\}"
	puts $anexod "\\end\{VerbatimInput\}"
}
puts $anexod " "
puts $anexod " "
puts $anexod "\\begin\{end\}"
puts $anexod " "

flush $anexod
close $anexod
