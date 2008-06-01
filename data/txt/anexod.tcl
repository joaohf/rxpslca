#!/usr/bin/tclsh

file mkdir tex

foreach i [glob  -type f *.txt] {
	puts "Processando arquivo $i"
	set anexo_xxx [open "tex/[lindex [split $i .] 0].tex" w]
	puts $anexo_xxx "\\begin\{VerbatimInput\}\[frame=single, fontsize=\\tiny, numbers=left, label=\{\[[lindex [split $i .] 0]\]\\url\{http://article.gmane.org/gmane.comp.sysutils.backup.bacula.devel/[lindex [split $i .] 0]\}\}\]"
	puts $anexo_xxx "\{../../data/$i\}"
	#puts $anexod "\{$i\}"
	puts $anexo_xxx "\\end\{VerbatimInput\}"

	flush $anexo_xxx
	close $anexo_xxx
}
