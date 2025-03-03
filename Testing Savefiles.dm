/*
mob/verb/Read_TestFile()
	var/View={""}
	var/XXX=file("Grapha.txt")
	var/ISF = file2text(XXX)
	View+=ISF
	usr<<browse(View,"window=Log;size=500x350")


mob/verb/Write_To_TestFile()
	var/XXX=file("Grapha.txt")
	var/ISF = file2text(XXX)
	var/output=input(usr,"Edit","Edit Rules",ISF)as message
	fdel("Grapha.txt")
	text2file(output,"Grapha.txt")
*/



mob/verb/Read_Rumors()
	var/View={""}
	var/XXX=file("Rumors.txt")
	var/ISF = file2text(XXX)
	View+=ISF
	usr<<browse(View,"window=Rumors;size=500x350")

mob/proc/AutoRumors()
	var/View={""}
	var/XXX=file("Rumors.txt")
	var/ISF = file2text(XXX)
	View+=ISF
	usr<<browse(View,"window=Rumors;size=500x350")

mob/Admin3/verb/Edit_Rumors()
	set category = "Admin"
	var/XXX=file("Rumors.txt")
	var/ISF = file2text(XXX)
	var/output=input(usr,"Edit","Edit Rumors",ISF)as message
	fdel("Rumors.txt")
	text2file(output,"Rumors.txt")




mob/verb/View_Jutsu_Ranks()
	var/View={""}
	var/XXX=file("Jutsu Ranks.txt")
	var/ISF = file2text(XXX)
	View+=ISF
	usr<<browse(View,"window=Jutsu Ranks;size=500x350")
mob/Admin3/verb/Edit_Jutsu_Ranks()
	set category = "Admin"
	var/XXX=file("Jutsu Ranks.txt")
	var/ISF = file2text(XXX)
	var/output=input(usr,"Edit","Edit Jutsu Ranks",ISF)as message
	fdel("Jutsu Ranks.txt")
	text2file(output,"Jutsu Ranks.txt")





mob/verb/Read_Chronicle()
	var/View={""}
	var/XXX=file("Chronicle.txt")
	var/ISF = file2text(XXX)
	View+=ISF
	usr<<browse(View,"window=Chronicle;size=500x350")
mob/Admin3/verb/Edit_Chronicle()
	set category = "Admin"
	var/XXX=file("Chronicle.txt")
	var/ISF = file2text(XXX)
	var/output=input(usr,"Edit","Edit Chronicle",ISF)as message
	fdel("Chronicle.txt")
	text2file(output,"Chronicle.txt")





mob/verb/Rules()
	var/View={""}
	var/XXX=file("Rules.txt")
	var/ISF = file2text(XXX)
	View+=ISF
	usr<<browse(View,"window=Rules;size=500x350")
mob/Admin3/verb/Edit_Rules()
	set category = "Admin"
	var/XXX=file("Rules.txt")
	var/ISF = file2text(XXX)
	var/output=input(usr,"Edit","Edit Rules",ISF)as message
	fdel("Rules.txt")
	text2file(output,"Rules.txt")

mob/verb/Ranks_Page()
	var/View={""}
	var/XXX=file("Ranks.txt")
	var/ISF = file2text(XXX)
	View+=ISF
	usr<<browse(View,"window=Ranks;size=500x350")	//Look @ This, Nick.











/*mob/verb/Read_Testfile()
	var/wtf=0
	var/list/Blah=new
	var/View={"{"<html>
<head><title></head></title><body>
<body bgcolor="#000000"><font size=8><font color="#0099FF"><b><i>
<font color="#00FFFF">**[M]'s Logged Activities**<br><font size=4>
</body><html>"}

	LOLWTF
	wtf+=1
	var/XXX=file("SSO/ChatLogs/[M.ckey]/[M.ckey][wtf].txt")
	if(fexists(XXX))
		Blah.Add(XXX)
		goto LOLWTF
		else
		if(Blah&&wtf>1)
			var/lawl=input("What one do you want to read?") in Blah
			var/ISF=file2text(lawl)
					View+=ISF
					usr<<"[File_Size(lawl)] File [lawl]"
					usr<<browse(View,"window=Log;size=500x350")
				else
					usr<<"No logs found for [M.ckey]"
*/