arkadia_references = arkadia_references or {
    state = {}
}

function arkadia_references:createPortalShorts()
    arPor = tempAlias("/ar por$", [[
        cecho("<reset>+------------------------------------+\n")
        cecho("<reset>|   <green>           <magenta>HOB,ZYW              <reset> |\n")
        cecho("<reset>|        <red>BRO  <green>NW  N  NE<magenta>  WEZ,CPM,GEL<reset> |\n")
        cecho("<reset>|   <green>            \\ | /               <reset> |\n")
        cecho("<reset>|   <magenta> KAS,<royal_blue>ROZ  <green>W---X---E  <green>PUC<magenta>,SIN    <reset> |\n")
        cecho("<reset>|   <green>            / | \\               <reset> |\n")
        cecho("<reset>|   <magenta> KHE,<red>???  <green>SW  S  SE  <magenta>VAL        <reset> |\n")
        cecho("<reset>|   <green>           <magenta>MAH,XAV              <reset> |\n")
        cecho("<reset>+------------------------------------+\n")
    ]])
end
--🢀 🢂 🢁 🢃 🢄 🢅 🢆 🢇

function arkadia_references:help()
    chaosforge:debug_print("info", "Pomoc do skryptow referencji")
    cecho("/ar elf        - przedrostki elfa, jak ktos chce dla swojej rasy to prosze o liste\n")
    cecho("/ar por        - opisy przejsc w portalu\n")
    cecho("/ar kamienie   - opisy efektow dzialania kamieni\n")
    cecho("/ar umy        - statyczna porownania umiejetnosci zawodow\n")
end


function arkadia_references:createElfShorts()
	arElf = tempAlias("^/ar elf$", [[
		cecho("<yellow>Przymiotniki w kategorii <green>'skora':<reset> bladoskory, ciemnoskory, gladkoskory, opalony, smagly\n\n")

		cecho("<yellow>Przymiotniki w kategorii <green>'budowa':<reset> chudy, dlugonogi, gibki, lekki, niewysoki, pajakowaty, smukly, szczuply, szkieletowaty, tyczkowaty, watly, wiotki, wysoki, wychudzony, zaglodzony, zgrabny, zylasty\n\n")

		cecho("<yellow>Przymiotniki w kategorii <green>'wiek':<reset> dojrzaly, leciwy, mlody, podrastajacy, stary, szczawikowaty, wiekowy\n\n")

		cecho("<yellow>Przymiotniki w kategorii <green>'ogolne':<reset> apatyczny, arogancki, bezwzgledny, butny, charakterny, chwacki, czujny, dostojny, dumny, energiczny, frasobliwy, hardy, malomowny, melancholijny, nerwowy, niesmialy, nieustepliwy, opanowany, ponury, porywczy, powazny, przyjacielski, rozmowny, roztropny, spokojny, stanowczy, surowy, smialy, wesoly, wyniosly, zaczepny, zadziorny, zawadiacki, zlosliwy, zuchwaly\n\n")

		cecho("<yellow>Przymiotniki w kategorii <green>'zarost':<reset> gladkolicy\n\n")

		cecho("<yellow>Przymiotniki w kategorii <green>'wlosy':<reset> bialowlosy, czarnowlosy, ciemnowlosy, czerwonowlosy, dlugowlosy, jasnowlosy, kasztanowowlosy, kedzierzawy, krotkowlosy, kruczowlosy, lysy, ognistowlosy, rudowlosy, rudy, srebrnowlosy, zielonowlosy, zlotowlosy\n\n")

		cecho("<yellow>Przymiotniki w kategorii <green>'twarz':<reset> dlugonosy, dlugouchy, krotkonosy, krzywonosy, ogorzaly, ostronosy, ostrouchy, piegowaty, puculowaty, spiczastouchy, waskousty\n\n")

		cecho("<yellow>Przymiotniki w kategorii <green>'oczy':<reset> blekitnooki, brazowooki, bystrooki, ciemnooki, czarnooki, fiolkowooki, jasnooki, jednooki, kociooki, kosooki, modrooki, niebieskooki, plomiennooki, roznooki, promiennooki, skosnooki, srebrnooki, szarooki, wielkooki, zimnooki, zielonooki, zlotooki\n\n")
    ]])
end

function arkadia_references:createStonesAlias()
    arStones = tempAlias("^/ar kamienie$", [[
        cecho("<gray>+------------------------------------------------------------+<reset>\n")
        cecho("<gray>|  <yellow>                     .: Kamyczki :.                       <gray>|<reset>\n")
        cecho("<gray>|                                                            <gray>|<reset>\n")
        cecho("<gray>|          OBRAZENIA i ODPORNOSCI                            <gray>|<reset>\n")
        cecho("<gray>| <light_slate_blue>WODA<reset>   : akwamaryn, iolit, czarna perła, biała perła       <gray>|<reset>\n")
        cecho("<gray>| <blue>LOD<reset>    : almandyn, turkus, zoisyt                          <gray>|<reset>\n")
        cecho("<gray>| <white>ISKRY<reset>  : granat, onyks, turmalin                           <gray>|<reset>\n")
        cecho("<gray>| <yellow>WIATR<reset>  : azuryt, lazuryt, nefryt, szafir                   <gray>|<reset>\n")
        cecho("<gray>| <red>OGIEN<reset>  : agat, apatyt, rubin, rodolit, topaz               <gray>|<reset>\n")
        cecho("<gray>| <brown>ZIEMIA<reset> : kwarc, kryształ, monacyt, obsydian, spinel,       <gray>|<reset>\n")
        cecho("<gray>|          tytanit                                           <gray>|<reset>\n")
        cecho("<gray>| <green>MAŹ<reset>    : awenturyn, chryzoberyl, chryzopraz, diopsyd,      <gray>|<reset>\n")
        cecho("<gray>|          malachit, serpentyn, szmaragd                     <gray>|<reset>\n")
        cecho("<gray>| <white>MAGIA<reset>  : oliwin, kyanit, aleksandryt, ametyst, labrador    <gray>|<reset>\n")
        cecho("<gray>| <white>MROK<reset>   : jaspis, gagat, hematyt, karneol, czarny opal      <gray>|<reset>\n")
        cecho("<gray>|                                                            <gray>|<reset>\n")
        cecho("<gray>|          REGENERACJA                                       <gray>|<reset>\n")
        cecho("<gray>| <light_slate_blue>MANA<reset>   : fluoryt (10%), piryt (10%), biały opal (20%),     <gray>|<reset>\n") 
        cecho("<gray>|          ortoklaz (20%), diament (20%)                     <gray>|<reset>\n")
        cecho("<gray>| <red>HAPE<reset>   : celestyn (10%), bursztyn (10%), cytryn (10%),     <gray>|<reset>\n")
        cecho("<gray>|          cyrkon (20%), heliodor (20%)                      <gray>|<reset>\n")
        cecho("<gray>+------------------------------------------------------------+<reset>\n")
    ]])
end

function arkadia_references:createSkillsAlias()
    arSkills = tempAlias("^/ar umy$", [[
        local arc =
        {
          ["Partyzant"] = "<grey>",
          ["Fanatyk"] = "<grey>",
          ["Legionista"] = "<grey>",
          ["Gladiator"] = "<grey>",
          ["Korsarz"] = "<grey>",
          ["Straznik"] = "<grey>",
          ["Miecznik"] = "<grey>",
          ["Nozownik"] = "<grey>",
          ["Barbarzynca"] = "<grey>",
          ["Mysliwy"] = "<grey>",
          ["Kupiec"] = "<grey>",
          ["Odkrywca"] = "<grey>",
          ["Gildia Podroznikow"] = "<grey>"
        }

        arc[gmcp.char.info.guild_occ] = "<red>"
        
        cecho("Umiejętność     " .. arc["Partyzant"] .. "SC<reset> " .. arc["Fanatyk"] .. "MC<reset> " .. arc["Legionista"] .. "OH<reset> " .. arc["Gladiator"] .. "VR<reset> " .. arc["Korsarz"] .. "KS<reset> " .. arc["Straznik"] .. "WK<reset> " .. arc["Miecznik"] .. "KG<reset> " .. arc["Nozownik"] .. "RA<reset> " .. arc["Barbarzynca"] .. "OK<reset> " .. arc["Mysliwy"] .. "OS<reset> " .. arc["Kupiec"] .. "CK<reset> " .. arc["Odkrywca"] .. "SG<reset> GP<reset>\n")
        cecho("akrobatyka      " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("alchemia        " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("blokowanie      " .. arc["Partyzant"] .. "38<reset> " .. arc["Fanatyk"] .. "44<reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "41<reset> " .. arc["Straznik"] .. "55<reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "51<reset> " .. arc["Barbarzynca"] .. "45<reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("broń            " .. arc["Partyzant"] .. "70<reset> " .. arc["Fanatyk"] .. "74<reset> " .. arc["Legionista"] .. "71<reset> " .. arc["Gladiator"] .. "75<reset> " .. arc["Korsarz"] .. "73<reset> " .. arc["Straznik"] .. "74<reset> " .. arc["Miecznik"] .. "71<reset> " .. arc["Nozownik"] .. "72<reset> " .. arc["Barbarzynca"] .. "71<reset> " .. arc["Mysliwy"] .. "65<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "60<reset> 30<reset>\n")
        cecho("kieszonkostwo   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("ocena obiektu   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "50<reset> " .. arc["Gladiator"] .. "50<reset> " .. arc["Korsarz"] .. "45<reset> " .. arc["Straznik"] .. "55<reset> " .. arc["Miecznik"] .. "50<reset> " .. arc["Nozownik"] .. "50<reset> " .. arc["Barbarzynca"] .. "35<reset> " .. arc["Mysliwy"] .. "40<reset> " .. arc["Kupiec"] .. "85<reset> " .. arc["Odkrywca"] .. "70<reset> 30<reset>\n")
        cecho("ocena przeciw   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "50<reset> " .. arc["Legionista"] .. "65<reset> " .. arc["Gladiator"] .. "85<reset> " .. arc["Korsarz"] .. "60<reset> " .. arc["Straznik"] .. "61<reset> " .. arc["Miecznik"] .. "65<reset> " .. arc["Nozownik"] .. "85<reset> " .. arc["Barbarzynca"] .. "55<reset> " .. arc["Mysliwy"] .. "54<reset> " .. arc["Kupiec"] .. "50<reset> " .. arc["Odkrywca"] .. "50<reset> 30<reset>\n")
        cecho("opieka nad zw   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "74<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "50<reset> 30<reset>\n")
        cecho("otwieranie za   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "50<reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("łowiectwo       " .. arc["Partyzant"] .. "40<reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "77<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "41<reset> 30<reset>\n")
        cecho("parowanie       " .. arc["Partyzant"] .. "40<reset> " .. arc["Fanatyk"] .. "45<reset> " .. arc["Legionista"] .. "50<reset> " .. arc["Gladiator"] .. "41<reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "71<reset> " .. arc["Miecznik"] .. "71<reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "55<reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "45<reset> 25<reset>\n")
        cecho("pływanie        " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "85<reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "55<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "71<reset> 50<reset>\n")
        cecho("rozkazy         " .. arc["Partyzant"] .. "30<reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "55<reset> " .. arc["Gladiator"] .. "30<reset> " .. arc["Korsarz"] .. "41<reset> " .. arc["Straznik"] .. "50<reset> " .. arc["Miecznik"] .. "55<reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "22<reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("skradanie       " .. arc["Partyzant"] .. "80<reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "70<reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "80<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 30<reset>\n")
        cecho("spostrzegawcz   " .. arc["Partyzant"] .. "70<reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "65<reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "70<reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "75<reset> " .. arc["Kupiec"] .. "60<reset> " .. arc["Odkrywca"] .. "71<reset> 50<reset>\n")
        cecho("szacowanie      " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "80<reset> " .. arc["Odkrywca"] .. "50<reset> 30<reset>\n")
        cecho("tarczownictwo   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset>7" .. arc["Legionista"] .. "5 <reset>6" .. arc["Gladiator"] .. "0 <reset>7" .. arc["Korsarz"] .. "1 <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 25<reset>\n")
        cecho("targowanie      " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "55<reset> " .. arc["Odkrywca"] .. "41<reset> 30<reset>\n")
        cecho("tropienie       " .. arc["Partyzant"] .. "60<reset> " .. arc["Fanatyk"] .. "50<reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "75<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "41<reset> 30<reset>\n")
        cecho("ukrywanie       " .. arc["Partyzant"] .. "80<reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "70<reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "80<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 30<reset>\n")
        cecho("uniki           " .. arc["Partyzant"] .. "60<reset> " .. arc["Fanatyk"] .. "45<reset> " .. arc["Legionista"] .. "30<reset> " .. arc["Gladiator"] .. "42<reset> " .. arc["Korsarz"] .. "40<reset> " .. arc["Straznik"] .. "50<reset> " .. arc["Miecznik"] .. "51<reset> " .. arc["Nozownik"] .. "70<reset> " .. arc["Barbarzynca"] .. "45<reset> " .. arc["Mysliwy"] .. "55<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "35<reset> 25<reset>\n")
        cecho("walka bez bro   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "60<reset> " .. arc["Gladiator"] .. "55<reset> " .. arc["Korsarz"] .. "55<reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "61<reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 17<reset>\n")
        cecho("walka dwiema    " .. arc["Partyzant"] .. "50<reset> " .. arc["Fanatyk"] .. "65<reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "55<reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 19<reset>\n")
        cecho("walka w ciemn   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "60<reset> " .. arc["Gladiator"] .. "55<reset> " .. arc["Korsarz"] .. "55<reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "40<reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("walka w szyku   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "35<reset> " .. arc["Legionista"] .. "75<reset> " .. arc["Gladiator"] .. "35<reset> " .. arc["Korsarz"] .. "45<reset> " .. arc["Straznik"] .. "55<reset> " .. arc["Miecznik"] .. "50<reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "33<reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 15<reset>\n")
        cecho("wspinaczka      " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "60<reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "60<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "71<reset> 50<reset>\n")
        cecho("wyczucie        " .. arc["Partyzant"] .. "60<reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "45<reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "60<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "85<reset> 30<reset>\n")
        cecho("wykrywanie pu   " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "55<reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "55<reset> 30<reset>\n")
        cecho("zasłanianie     " .. arc["Partyzant"] .. "45<reset> " .. arc["Fanatyk"] .. "35<reset> " .. arc["Legionista"] .. "45<reset> " .. arc["Gladiator"] .. "40<reset> " .. arc["Korsarz"] .. "60<reset> " .. arc["Straznik"] .. "60<reset> " .. arc["Miecznik"] .. "40<reset> " .. arc["Nozownik"] .. "40<reset> " .. arc["Barbarzynca"] .. "41<reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "  <reset> " .. arc["Odkrywca"] .. "  <reset> 20<reset>\n")
        cecho("zielarstwo      " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "59<reset> " .. arc["Kupiec"] .. "55<reset> " .. arc["Odkrywca"] .. "41<reset> 20<reset>\n")
        cecho("jezyki          " .. arc["Partyzant"] .. "  <reset> " .. arc["Fanatyk"] .. "  <reset> " .. arc["Legionista"] .. "  <reset> " .. arc["Gladiator"] .. "  <reset> " .. arc["Korsarz"] .. "  <reset> " .. arc["Straznik"] .. "  <reset> " .. arc["Miecznik"] .. "  <reset> " .. arc["Nozownik"] .. "  <reset> " .. arc["Barbarzynca"] .. "  <reset> " .. arc["Mysliwy"] .. "  <reset> " .. arc["Kupiec"] .. "70<reset> " .. arc["Odkrywca"] .. "85<reset> 40<reset>\n")
        cecho("Umiejętność     " .. arc["Partyzant"] .. "SC<reset> " .. arc["Fanatyk"] .. "MC<reset> " .. arc["Legionista"] .. "OH<reset> " .. arc["Gladiator"] .. "VR<reset> " .. arc["Korsarz"] .. "KS<reset> " .. arc["Straznik"] .. "WK<reset> " .. arc["Miecznik"] .. "KG<reset> " .. arc["Nozownik"] .. "RA<reset> " .. arc["Barbarzynca"] .. "OK<reset> " .. arc["Mysliwy"] .. "OS<reset> " .. arc["Kupiec"] .. "CK<reset> " .. arc["Odkrywca"] .. "SG<reset> GP<reset>\n")
    ]])
end

function arkadia_references:init()
    arkadia_references:createStonesAlias()
    arkadia_references:createSkillsAlias()
	arkadia_references:createElfShorts()
    arkadia_references:createPortalShorts()
end

arkadia_references:init()
