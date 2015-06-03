import urllib2
import re
import os
import os.path

wikiurls= ["http://www.en.wikipedia.org/wiki/Agreus_%26_Nomios",
            "http://www.en.wikipedia.org/wiki/Aloadae",
            "http://www.en.wikipedia.org/wiki/Ampelos",
            "http://www.en.wikipedia.org/wiki/Amphisbaena",
            "http://www.en.wikipedia.org/wiki/Anemoi",
            "http://www.en.wikipedia.org/wiki/Anthropophage",
            "http://www.en.wikipedia.org/wiki/Argus_Panoptes",
            "http://www.en.wikipedia.org/wiki/Arion_(mythology)",
            "http://www.en.wikipedia.org/wiki/Astomi",
            "http://www.en.wikipedia.org/wiki/Calydonian_Boar",
            "http://www.en.wikipedia.org/wiki/Campe",
            "http://www.en.wikipedia.org/wiki/Centaur",
            "http://www.en.wikipedia.org/wiki/Centaurus_(Greek_mythology)",
            "http://www.en.wikipedia.org/wiki/Cerastes",
            "http://www.en.wikipedia.org/wiki/Cerberus",
            "http://www.en.wikipedia.org/wiki/Cercopes",
            "http://www.en.wikipedia.org/wiki/Ceryneian_Hind",
            "http://www.en.wikipedia.org/wiki/Cetus_(mythology)",
            "http://www.en.wikipedia.org/wiki/Charybdis",
            "http://www.en.wikipedia.org/wiki/Chimera_(mythology)",
            "http://www.en.wikipedia.org/wiki/Cretan_Bull",
            "http://www.en.wikipedia.org/wiki/Crommyonian_Sow",
            "http://www.en.wikipedia.org/wiki/Cyclops",
            "http://www.en.wikipedia.org/wiki/Dactyl_(mythology)",
            "http://www.en.wikipedia.org/wiki/Daemon_(classical_mythology)",
            "http://www.en.wikipedia.org/wiki/Echidna_(mythology)",
            "http://www.en.wikipedia.org/wiki/Eleionomae",
            "http://www.en.wikipedia.org/wiki/Empusa",
            "http://www.en.wikipedia.org/wiki/Erinyes",
            "http://www.en.wikipedia.org/wiki/Erymanthian_Boar",
            "http://www.en.wikipedia.org/wiki/Eudaemon_(mythology)",
            "http://www.en.wikipedia.org/wiki/Euryale",
            "http://www.en.wikipedia.org/wiki/Eurynomos"]

for wiki_url in wikiurls: 

    conn=urllib2.urlopen(wiki_url)
    characters=conn.read()
    conn.close()
    names=re.findall(r'<title>.*?</title>',characters)
    greek_names=re.findall(r'xml:lang="grc">.*?</',characters)
    greek_names2=re.findall(r'xml:lang="el">.*?</',characters)
    print names, greek_names, greek_names2, wiki_url
    



