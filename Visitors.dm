mob/NPC
    Kumo_Guard
        icon='GuardDuty.dmi'
        verb/Talk()
            set src in view(2)
            var/choice = input("Why are you here?") in list("Visitor", "Osama", "Cancel")

            if(choice == "Visitor")
                world<<"<font color=red><font size=2><center>Kumogakure has a visitor!"
                Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Kumogakure's NPC!</font>"
            else if(choice == "Osama")
                usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
            else // Covers "Cancel" case
                usr<<"Take your leave then.."

    Konoha_Guard
        icon='GuardDuty.dmi'
        verb/Talk()
            set src in view(2)
            var/choice = input("Why are you here?") in list("Visitor", "Osama", "Cancel")

            if(choice == "Visitor")
                world<<"<font color=red><font size=2><center>Konohagakure has a visitor!"
                Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Konohagakure's NPC!</font>"
            else if(choice == "Osama")
                usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
            else
                usr<<"Take your leave then.."

    Suna_Guard
        icon='GuardDuty.dmi'
        verb/Talk()
            set src in view(2)
            var/choice = input("Why are you here?") in list("Visitor", "Osama", "Cancel")

            if(choice == "Visitor")
                world<<"<font color=red><font size=2><center>Sunagakure has a visitor!"
                Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Sunagakure's NPC!</font>"
            else if(choice == "Osama")
                usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
            else
                usr<<"Take your leave then.."

    Kiri_Guard
        icon='GuardDuty.dmi'
        verb/Talk()
            set src in view(2)
            var/choice = input("Why are you here?") in list("Visitor", "Osama", "Cancel")

            if(choice == "Visitor")
                world<<"<font color=red><font size=2><center>Kirigakure has a visitor!"
                Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Kirigakure's NPC!</font>"
            else if(choice == "Osama")
                usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
            else
                usr<<"Take your leave then.."

    Shinko_Guard
        icon='GuardDuty.dmi'
        verb/Talk()
            set src in view(2)
            var/choice = input("Why are you here?") in list("Visitor", "Osama", "Cancel")

            if(choice == "Visitor")
                world<<"<font color=red><font size=2><center>Shinkogakure has a visitor!"
                Admin_Logs+="<br><font color=red>[usr]([usr.key]) used Shinkogakure's NPC!</font>"
            else if(choice == "Osama")
                usr<<"No announcement was made of your arrival, but you must inform an admin that you've selected this option."
            else
                usr<<"Take your leave then.."
