#!/usr/bin/env python
# Description: Super Bundle
# Version: 5
# Last change: 12/18/2014

# License:
# This software is released under version three of the GNU General Public License (GPL) of the
# Free Software Foundation (FSF), the text of which is available at http://www.fsf.org/licensing/licenses/gpl-3.0.html.
# Use or modification of this software implies your acceptance of this license and its terms.
# This is a free software, you are free to change and redistribute it with the terms of the GNU GPL.
# There is NO WARRANTY, not even for FITNESS FOR A PARTICULAR USE to the extent permitted by law.



import sys, os, json, pymongo, ldap, random, locale, bson
import bottle
from bottle import Bottle, run, template, route
from optparse import OptionParser



# How were we called?
parser = OptionParser("%prog [options]\n" + 
    "Super Bundle."
)

(options, args) = parser.parse_args()





# Get the real name
def ldap_get_name(uca):
    ldap_obj = ldap.initialize("ldap://directory.example.com")


    result = ldap_obj.search_s("o=Example,c=US", ldap.SCOPE_SUBTREE, "(uid=" + uca + ")", ["cn"])
    name = result[0][1]["cn"][0]

    return name





# Get the DB password
dbpasshandle = open("/usr/local/etc/bundlerpass.txt", "r")
dbpass = dbpasshandle.read().rstrip("\n")
dbpasshandle.close()

    

# Open a DB connection
try:
    mongo_client = pymongo.MongoClient("127.0.0.1", safe=True)

    db = mongo_client.super_bundle
    
    db.authenticate("bundler", dbpass)
    
    del(dbpass)
    
except Exception as err:
    sys.stderr.write("Failed to connect to the database: " + str(err) + "\n")
    sys.exit(1)

            

bottle.TEMPLATE_PATH.insert(0, "/var/bundle/html/views/")



#
# Pick a tagline
#
def pick_tagline():
    taglines = []

    for doc in db.tagline.find():
        # Add the tagline to the array as many times as its weight.  If there is no weight, assume a weight of 1.
        try:
            for _ in range(int(doc["weight"])):
                try:
                    taglines.append(doc["tagline"])

                except KeyError:
                    pass

        except KeyError:
            try:
                taglines.append(doc["tagline"])
            
            except KeyError:
                pass

    return random.choice(taglines)
    




#
# Route for the main/index page
# 
@route("/")
def index():
    #
    # Dollars raised so far
    #
    money_total = 0
    for doc in db.tickets.find():
        money_total += doc["donation_total"]


    # Get the video data
    video = db.videos.find_one({"_id" : "sb_intro_2013"})


    # Get all items
    items = []
    for doc in db.items.find():
        items.append(doc)

    random.shuffle(items)


    return bottle.template("main", money_total=str(money_total), video=video, items=items)
    
    
    
    

#
# Route for the items page
#
@route("/items")
@route("/items/")
def about_page():
    # Get all items
    items = []
    for doc in db.items.find():
        items.append(doc)  

    random.shuffle(items)


    return bottle.template("items", items=items)



@route("/testip")
def test():
    #user_ip = bottle.request.remote_addr
    user_ip = None
    return bottle.template('ip', whoami=user_ip)

@route("/test")
def test():
    return bottle.template('test')

@route("/luo4")
def luo4():
    return bottle.template('luo4')

@route("/playvideo")
def playvideo():
    # Do not include the path for extension to the video names
    video = random.choice(["video_1b", "video_2b"])

    return bottle.template('playvideo', video=video)


@route("/faq")
def faq():
    return bottle.template('faq')

@route("/mux")
def mux():
    mux1 = []
    mux1.append("hahaha i am a goblin who took this over!!")
    mux1.append("If you do not have at least 30 tickets, drop everything, and go buy some more")
    mux1.append("Don't look I am working on this")
    mux1.append("I'm a wizard, stare at this spot for 7 seconds to see a trick.")
    mux1.append("Do you know about the Super Bundle MNI?")
    mux1.append("<b>Hi</b>, how are you?")
    mux1.append("<span class='glyphicon glyphicon-heart'></span><span class='glyphicon glyphicon-heart'></span><span class='glyphicon glyphicon-heart'></span>")
    mux1.append("Boo! I'm the Great Pumpkemon!")
    mux1.append(" ^_____________________^ ")
    mux2 = []
    mux2.append("<b>LOL.</b> lol.")
    mux2.append("Please pretend whatever text was here before is still here now")
    mux2.append("Did you know that Brian O'Connor was a previous Super Bundle winner?")
    mux2.append("Go. Buy. Some. <b>More.</b> Tickets!")
    mux2.append("Hurry click <a href='../images/thanks.png'>here</a>. Quick!")
    mux2.append("<span class='glyphicon glyphicon-headphones'></span> <span class='glyphicon glyphicon-chevron-right'></span> <span class='glyphicon glyphicon-briefcase'></span> <span class='glyphicon glyphicon-thumbs-up'></span>")
    mux2.append("King Woolifur!") 
    send_mux1 = random.choice(mux1)
    send_mux2 = random.choice(mux2)
    #send_mux2 = "Please click <a href='../images/thanks.png'>here</a>. Quick!"
    
    #send_mux2 = "test"
    
    user_ip = bottle.request.remote_addr
    try:
        whoami = whoip[str(user_ip)]
    except:
        whoami = None
    return bottle.template('mux', send_mux1=send_mux1, send_mux2=send_mux2, whoami=whoami)

#
# Route for the tickets page
#
@route("/tickets")
@route("/tickets/")
def tickets_page():
    #
    # Get the data for the ticket leader table
    #

    sbtss_users = []
    
    # Get the total number of tickets and money raised
    total_tickets = 0
    money_raised = 0
    for doc1 in db.tickets.find():
        total_tickets += doc1["count"]
        money_raised += doc1["donation_total"]


    ldap_obj = ldap.initialize("ldap://directory.example.com")
    tickets = []
    
    # Loop through each doc, add the stats and such
    for doc in db.tickets.find().sort("count", -1):
        del doc["tickets"]

        # Make the count a float for the calculations
        doc["count"] = float(doc["count"])

        if doc["_id"] in sbtss_users:
            doc["sbtss_user"] = True

        else:
            doc["sbtss_user"] = False        

       

        else:
            try:
                result = ldap_obj.search_s("o=example,c=US", ldap.SCOPE_SUBTREE, "(uid=" + doc["_id"] + ")", ["cn"])
                name = result[0][1]["cn"][0]
                doc["_id"] = name
            except:
                pass

        doc["percent_chance_win"] = round((doc["count"] / total_tickets) * 100, 2)

        doc["percent_chance_lose"] = round(((total_tickets - doc["count"]) / total_tickets) * 100, 2)

        count_plus_30 = doc["count"] + 30
        total_tickets_plus_30 = total_tickets + 30
        doc["percent_chance_win_plus_30"] = round((count_plus_30 / total_tickets_plus_30) * 100, 2)

        count_plus_5000 = doc["count"] + 5000
        total_tickets_plus_5000 = total_tickets + 5000
        doc["percent_chance_win_plus_5000"] = round((count_plus_5000 / total_tickets_plus_5000) * 100, 2)

        # Make the count an int to be prettier
        doc["count"] = int(doc["count"])
       
        tickets.append(doc)

    # Generate a random ticket count between 50 and 1000 and calculate how much it would cost
    random_num_tickets = random.randrange(50, 1000+1)
    num_10_bucks = random_num_tickets / 30
    num_tickets_left = random_num_tickets % 30
    num_5_bucks = num_tickets_left / 10
    num_1_bucks = num_tickets_left % 10
    random_ticket_cost = (num_10_bucks * 10) + (num_5_bucks * 5) + num_1_bucks


    return bottle.template("tickets", tickets=tickets, money_raised=money_raised, random_num_tickets=random_num_tickets, random_ticket_cost=random_ticket_cost)





#
# Route for the winner page
#
@route("/rawwinner")
@route("/rawwinner/")
def winner_page():
    all_existing_tickets = []
    contestant_ucas = []

    for doc in db.tickets.find():
        if doc["_id"] == 'King':
            continue
        
         
        all_existing_tickets = all_existing_tickets + doc["tickets"]
        contestant_ucas.append(doc["_id"])

     
    set(contestant_ucas)
    random.shuffle(contestant_ucas)
        
        
    # Shuffle the list a few times
    random.shuffle(all_existing_tickets)
    random.shuffle(all_existing_tickets)
    random.shuffle(all_existing_tickets)

        
    # Pick a winning ticket
    winning_ticket = str(random.choice(all_existing_tickets))
   
     

 

    # Find who owns the winning ticket
    for doc in db.tickets.find():
        if int(winning_ticket) in doc["tickets"]:
            winner = doc["_id"]
        
    
    # Get the real name
    contestants = []
    contestants.append("Please wait, getting tickets...")
    contestants.append("Please wait, getting tickets...")
    contestants.append("Please wait, getting tickets...")
    contestants.append("Please wait, getting tickets...")
    contestants.append("Please wait, getting tickets...")
    for uca in contestant_ucas:
        contestants.append(ldap_get_name(uca))

    #contestants = contestants * 3 

    winner_name = ldap_get_name(winner)


    # Determine how long to wait on each name in the spinner
    wait_time = 32300 / len(contestants)
    

    return bottle.template("rawwinner", winner_name=winner_name, winner=winner, winning_ticket=winning_ticket, contestants=contestants, wait_time=wait_time)


@route("/pickwinner")
def pickwinner():


    all_existing_tickets = []
    contestant_ucas = []

    for doc in db.tickets.find():
        if doc["_id"] == 'King':
            continue
        all_existing_tickets = all_existing_tickets + doc["tickets"]
        contestant_ucas.append(doc["_id"])


    set(contestant_ucas)
    random.shuffle(contestant_ucas)


    # Shuffle the list a few times
    random.shuffle(all_existing_tickets)
    random.shuffle(all_existing_tickets)
    random.shuffle(all_existing_tickets)
   

    # Pick a winning ticket
    winning_ticket = str(random.choice(all_existing_tickets))




    winner = ''
    # Find who owns the winning ticket
    for doc in db.tickets.find():
        if int(winning_ticket) in doc["tickets"]:
            winner = doc["_id"]


    winner_name = ldap_get_name(winner)








    return bottle.template("pickawinner", winner=winner_name)

@route("/pickmniwinner")
def pickmniwinner():
    return bottle.template("pickmniwinner")

@route("/reveal")
def reveal():
    return bottle.template("reveal")




    
    
#run(host="0.0.0.0", port=8080, debug=True)
application = bottle.app() 

