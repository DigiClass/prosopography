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
            "http://www.en.wikipedia.org/wiki/Gegenees",
            "http://www.en.wikipedia.org/wiki/Gelin",
            "http://www.en.wikipedia.org/wiki/Gello",
            "http://www.en.wikipedia.org/wiki/Gorgon",
            "http://www.en.wikipedia.org/wiki/Griffin",
            "http://www.en.wikipedia.org/wiki/Harpy",
            "http://www.en.wikipedia.org/wiki/Hekatonkheires",
            "http://www.en.wikipedia.org/wiki/Hellhound",
            "http://www.en.wikipedia.org/wiki/Hippalectryon",
            "http://www.en.wikipedia.org/wiki/Hippocampus_(mythology)",
            "http://www.en.wikipedia.org/wiki/Ichthyocentaurs",
            "http://www.en.wikipedia.org/wiki/Ipotane",
            "http://www.en.wikipedia.org/wiki/Kallikantzaros",
            "http://www.en.wikipedia.org/wiki/Keres_(mythology)",
            "http://www.en.wikipedia.org/wiki/Khalkotauroi",
            "http://www.en.wikipedia.org/wiki/Kobalos",
            "http://www.en.wikipedia.org/wiki/Laelaps_(mythology)",
            "http://www.en.wikipedia.org/wiki/Laestrygonians",
            "http://www.en.wikipedia.org/wiki/Lamia",
            "http://www.en.wikipedia.org/wiki/Lampad",
            "http://www.en.wikipedia.org/wiki/Leimakid",
            "http://www.en.wikipedia.org/wiki/Maenad",
            "http://www.en.wikipedia.org/wiki/Makhai",
            "http://www.en.wikipedia.org/wiki/Maliades",
            "http://www.en.wikipedia.org/wiki/Mares_of_Diomedes",
            "http://www.en.wikipedia.org/wiki/Medusa",
            "http://www.en.wikipedia.org/wiki/Meliae",
            "http://www.en.wikipedia.org/wiki/Minotaur",
            "http://www.en.wikipedia.org/wiki/Monopod_(creature)",
            "http://www.en.wikipedia.org/wiki/Mormo",
            "http://www.en.wikipedia.org/wiki/Mormolykeia",
            "http://www.en.wikipedia.org/wiki/Muse",
            "http://www.en.wikipedia.org/wiki/Myrmekes",
            "http://www.en.wikipedia.org/wiki/Napaeae",
            "http://www.en.wikipedia.org/wiki/Nemean_lion",
            "http://www.en.wikipedia.org/wiki/Nereid",
            "http://www.en.wikipedia.org/wiki/Nymph",
            "http://www.en.wikipedia.org/wiki/Oceanid",
            "http://www.en.wikipedia.org/wiki/Ocypete",
            "http://www.en.wikipedia.org/wiki/Odontotyrannos",
            "http://www.en.wikipedia.org/wiki/Onocentaur",
            "http://www.en.wikipedia.org/wiki/Ophiotaurus",
            "http://www.en.wikipedia.org/wiki/Oread",
            "http://www.en.wikipedia.org/wiki/Orthrus",
            "http://www.en.wikipedia.org/wiki/Parthenope_(Siren)",
            "http://www.en.wikipedia.org/wiki/Podarge",
            "http://www.en.wikipedia.org/wiki/Polybotes",
            "http://www.en.wikipedia.org/wiki/Potamides_(mythology)",
            "http://www.en.wikipedia.org/wiki/Psychai",
            "http://www.en.wikipedia.org/wiki/Pygmy_(Greek_mythology)",
            "http://www.en.wikipedia.org/wiki/Satyr",
            "http://www.en.wikipedia.org/wiki/Satyress",
            "http://www.en.wikipedia.org/wiki/Scylla",
            "http://www.en.wikipedia.org/wiki/Silenus",
            "http://www.en.wikipedia.org/wiki/Siren_(mythology)",
            "http://www.en.wikipedia.org/wiki/Sphinx",
            "http://www.en.wikipedia.org/wiki/Stheno",
            "http://www.en.wikipedia.org/wiki/Stymphalian_birds",
            "http://www.en.wikipedia.org/wiki/Sybaris_(mythology)",
            "http://www.en.wikipedia.org/wiki/Talos",
            "http://www.en.wikipedia.org/wiki/Taraxippus",
            "http://www.en.wikipedia.org/wiki/Teumessian_fox",
            "http://www.en.wikipedia.org/wiki/Titan_(mythology)",
            "http://www.en.wikipedia.org/wiki/Triton_(mythology)",
            "http://www.en.wikipedia.org/wiki/Winged_unicorn",]       










for wiki_url in wikiurls: 

    conn=urllib2.urlopen(wiki_url)
    characters=conn.read()
    conn.close()
    
    
    
    

    


    
    names=re.findall(r'<title>.*?</title>',characters)

    gr_names1=re.findall(r'xml:lang="grc">.*?</',characters)
    gr_names2=re.findall(r'xml:lang="el">.*?</',characters)
    gr_names3=re.findall(r'Greek</a>.*?<a',characters)
    gr_names4=re.findall(r'Gr.</a>.*?<i>',characters)
    gr_names5=re.findall(r'comes directly from Ancient Greek ".*?",',characters)
    gr_names6=re.findall(r'</span></span>;.*?protectress"',characters)

    print names, gr_names1, gr_names2, gr_names3, gr_names4, gr_names5, gr_names6, '<idno type="wikipedia">', wiki_url, "</idno>" 


    
    
    
      
    



