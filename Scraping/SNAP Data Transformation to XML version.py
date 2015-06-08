infileobj =open ("c:/users/DigiHum/desktop/documents/SNAP GREEK MYTHICAL CREATURES.docx","r")
text = infileobj.read()
linelist=infileobj.readlines()
infileobj.close()




newtext1 = text.replace("<title>", "<persName xml:lang=en>")
newtext2 = text.replace("</title>", "</persName>")

for line in linelist:
    print line

 



                       
    


