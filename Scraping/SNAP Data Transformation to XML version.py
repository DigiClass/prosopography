infileobj =open ("c:/users/DigiHum/desktop/documents/SNAP GREEK MYTHICAL CREATURES.docx","r")
text = infileobj.read()
linelist=infileobj.readlines()
infileobj.close()




text = text.replace("<title>", '<persName xml:lang="en">')
text = text.replace("</title>", "</persName>")
text = text.replace('xml:lang="grc"', '<persName xml:lang="el">')
text = text.replace('xml:lang="el"', '<persName xml:lang="el">')
text = text.replace('<span lang="grc"', "")
text = text.replace('<span lang="el"', "")
text = text.replace("</span>", "<persName>")
text = text.replace("Greek</a>", '<pesrsName xml:lang="el">')
text = text.replace("Gr.</a>", '<persName xml:lang="el">')


for line in linelist:
    print line

 



                       
    


