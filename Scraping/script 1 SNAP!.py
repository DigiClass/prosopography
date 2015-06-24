import urllib2
import re
import os
import os.path


wiki_url="http://www.en.wikipedia.org/wiki/Pyraechmes"




conn=urllib2.urlopen(wiki_url)
characters=conn.read()
conn.close()


names=re.findall(r'<title>.*?-', characters)
greek_names=re.findall(r'xml:lang="grc">.*?</', characters)
greek_names2=re.findall(r'Greek:.*; <', characters)
greek_names3=re.findall(r'<sup/>.*son', characters)
latin_names=re.findall(r'xml:lang="la">.*</i>', characters)
reg1=re.findall(r'.*Axius', characters)
reg2=re.findall(r'.*Polyxena', characters)
reg5=re.findall(r'.*Lamia', characters)
reg3=re.findall(r'.*Hesperides', characters)
reg4=re.findall(r'.*Thoosa',characters)



print names, greek_names, reg1, wiki_url




                       
