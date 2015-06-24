import urllib2
import re
import os
import os.path


conn=urllib2.urlopen(wiki_url)
characters=conn.read()
conn.close()

names=re.findall(r'<title>.*?</title>',characters)
greek_names=re.findall(r'xml:lang="el">.*?</',characters)
reg1=re.findall(r'father.*? title="Deioneus">',characters)
reg2=re.findall(r'his mother was.*?Strymon',characters)
reg3=re.findall (r'sister Sete',characters)

print names, greek_names, reg1, reg2, reg3, wiki_url



wiki_url2="http://www.en.wikipedia.org/wiki/Stentor"

conn2=urllib2.urlopen(wiki_url2)
characters2=conn2.read()
conn2.close()

names2=re.findall(r'<title>.*?</title>',characters2)
greek_names2=re.findall(r'Greek</a>:.*?;',characters2)
reg4=re.findall(r'was a herald.*?>Trojan War</a>',characters2)

print names2, greek_names2, reg4, wiki_url2



wiki_url3="http://www.en.wikipedia.org/wiki/Talthybius"

conn3=urllib2.urlopen(wiki_url3)
characters3=conn3.read()
conn3.close()

names3=re.findall(r'<title>.*?</title>',characters3)
greek_names3=re.findall(r'xml:lang="el">.*?</',characters3)
reg5=re.findall(r'was.*?herald.*?>Trojan War</a>',characters3)

print names3, greek_names3, reg5, wiki_url3


wiki_url4="http://www.en.wikipedia.org/wiki/Teucer"

conn4=urllib2.urlopen(wiki_url4)
characters4=conn4.read()
conn4.close()

names4=re.findall(r'<title>.*?</title>',characters4)
greek_names4=re.findall(r'xml:lang="el">.*?</',characters4)
reg6=re.findall(r'was the son of King.*?all of whom he fought against in the Trojan War.',characters4)

print names4, greek_names4, reg6, wiki_url4


wiki_url5="http://www.en.wikipedia.org/wiki/Theano"

conn5=urllib2.urlopen(wiki_url5)
characters5=conn5.read()
conn5.close()

names5=re.findall(r'<title>.*?</title>',characters5)
greek_names5=re.findall(r'xml:lang="grc">.*?</',characters5)
reg7=re.findall(r'She was the daughter of.*?Crino', characters5)
reg8=re.findall(r'One story.*?Padua', characters5)

print names5, greek_names5, reg7, reg8, wiki_url5



wiki_url6="http://www.en.wikipedia.org/wiki/Thersites"

conn6=urllib2.urlopen(wiki_url6)
characters6=conn6.read()
conn6.close()

names6=re.findall(r'<title>.*?</title>',characters6)
greek_names6=re.findall(r'xml:lang="grc">.*?</',characters6)
reg9=re.findall(r'was a soldier.*?Trojan War',characters6)
reg10=re.findall(r'gives his.*?Agrius',characters6)

print names6, greek_names6, reg9, reg10, wiki_url6


wiki_url7="http://www.en.wikipedia.org/wiki/Thoas"

conn7=urllib2.urlopen(wiki_url7)
characters7=conn7.read()
conn7.close()

names7=re.findall(r'<title>.*?</title>',characters7)
greek_names7=re.findall(r'xml:lang="grc">.*?</',characters7)
reg11=re.findall(r'son of.*?Helen of Troy',characters7)

print names7, greek_names7, reg11, wiki_url7


wiki_url8="http://www.en.wikipedia.org/wiki/Thrasymedes_(mythology)"

conn8=urllib2.urlopen(wiki_url8)
characters8=conn8.read()
conn8.close()

names8=re.findall(r'<title>.*?</title>',characters8)
greek_names8=re.findall(r'xml:lang="el">.*?</',characters8)
reg12=re.findall(r'was a participant.*?Antilochus',characters8)



print names8, greek_names8, reg12, wiki_url8


wiki_url9="http://www.en.wikipedia.org/wiki/Tlepolemus"

conn9=urllib2.urlopen(wiki_url9)
characters9=conn9.read()
conn9.close()

names9=re.findall(r'<title>.*?</title>',characters9)
greek_names9=re.findall(r'xml:lang="grc">.*?</',characters9)
reg13=re.findall(r'was a son of.*?Trojan War',characters9)
reg14=re.findall(r'His mother.*?Ormenus',characters9)
reg15=re.findall(r'wife.*?Polyxo',characters9)
reg16=re.findall(r'founding.*?Lindus',characters9)
reg17=re.findall(r'among.*?Helen',characters9)



print names9, greek_names9, reg13, reg14, reg15, reg16, reg17, wiki_url9





wiki_url10="http://www.en.wikipedia.org/wiki/Ucalegon"

conn10=urllib2.urlopen(wiki_url10)
characters10=conn10.read()
conn10.close()

names10=re.findall(r'<title>.*?</title>',characters10)
greek_names10=re.findall(r'xml:lang="grc">.*?</span>',characters10)
reg18=re.findall(r'one of.*?Troy',characters10)


print names10, greek_names10, reg18, wiki_url10
