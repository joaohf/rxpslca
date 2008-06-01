#!/usr/bin/tclsh8.5
# Script para processar emails do gmane e gerar texto

foreach mailfile  [glob -type f *{0,1,2,3,4,5,6,7,8,9}*] { 

	file delete $mailfile.txt

	if { [catch {set mail [open $mailfile]} results options] } {
		return -code error -errorinfo $options $results 
	}	
	set mail_html [read $mail]
	close $mail

	if { [catch {set mailtxt [open "$mailfile.html" w]} results options] } {
		return -code error -errorinfo $options $results 
	}
		
	set flag off

	foreach line [split $mail_html "\n"] {
	
		if { [string match *From:* $line] } {
			set flag on 
		}
		if { [string match "*This SF.net email is sponsored by:*" $line] } {
			set flag off
		}
		if { [string match "*SF.Net email is sponsored by:*" $line] } {
			set flag off
		}
		if { [string match "-------------------------------------------------------------------------" $line] } {
			set flag off
		}
		if { [string match "_______________________________________________" $line] } {
			set flag off
		}

		if { $flag } {
			puts $mailtxt $line
		}

	}
	
	flush $mailtxt
	close $mailtxt		

	if { [catch {exec html2text -nobs -ascii -o "$mailfile.txt" "$mailfile.html"} results options] } {
		return -code error -errorinfo $options $results
	}
	file delete $mailfile.html
}


