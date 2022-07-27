// ------------------------------------------------------------
// Helpful? tips???
// ------------------------------------------------------------
extend class hdplayerpawn{
	double specialtipalpha;
	string specialtip;
	static void gametip(actor caller,string message){
		let hdp=hdplayerpawn(caller);
		if(hdp)hdp.usegametip(message);
		else caller.A_Log(message,true);
	}
	void usegametip(string arbitrarystring){
		arbitrarystring.replace("\n\n\n","\n");
		arbitrarystring.replace("\n\n","\n");
		specialtipalpha=1001.;
		specialtip=arbitrarystring;
	}
	static void massgametip(string arbitrarystring){
		for(int i=0;i<MAXPLAYERS;i++){
			let hdp=hdplayerpawn(players[i].mo);
			if(hdp)hdp.usegametip(arbitrarystring);
		}
	}
	void showgametip(){
		if(
			!player
			||!hd_helptext
			||!hd_helptext.getbool()
		)return;
		static const string specialtips[]={
			"Read the manual!\n(open the pk7 with 7Zip and look for \cdhd_manual.md\cu)",
			"Hold \cdUse\cu to check what options are available for a given weapon.",
			"Make sure you bind keys for \cdall weapon \"User\" buttons\cu\n\cdDrop Weapon\cu, \cdZoom\cu and \cdReload\cu!",
			"Check the menu for additional keybinds unique to HD! Many of them are incredibly useful.",
			"To stop bleeding, hit \cd9\cu or use the \cdmedikit\cu.\nThen, if needed, take off your armour\nby hitting \cdReload\cu.",
			"Hold \cdJump\cu and move forwards into a ledge to try to clamber over it.",
			"Hit \cdUser3\cu to access the magazine manager on most weapons.",
			"Hit \cdUser4\cu to unload most weapons.",
			"If you are carrying too much useless ammo,\nhit the \cdPurge Useless Ammo\cu key\nor use the \cdhd_purge\cu command.",
			"Make sure you're loaded before getting in a fight, it'll save your life.",
			"Hit \cdUse\cu on a ladder to start climbing, and again or \cdJump\cu to dismount.\nHit \cdJump\cu while \cdcrouching\cu to take down the ladder.",
			"Your movement and turning affect your punches and grenades.\nGo to the range and practice!",
			"Use stimpacks to slow down bleeding and to help with incap.",
			"There's lots of options in \cdHD Options\cu and for GZDoom itself! I suggest spending some time going through them to suit you, it helps a lot.",
			"Holding \cdZoom\cu will greatly stabilize your aim,\nand implicitly brace your weapon\nagainst nearby map geometry.",
			"Hold \cdZoom\cu when firing an airburst rocket or grenade\nto prevent the airburst value from resetting.",
			"Hit the \cdDrop One\cu key or use the \cdhd_dropone\cu command\nto drop a single unit of each ammo type used by your current weapon.",
			"If you don't want the diving action when you hit \cdCrouch\cu while running,\nset \cdhd_noslide\cu to 1 or use the menu.",
			"If you don't want \cdZoom\cu to make you lean,\nset \cdhd_nozoomlean\cu to true.",
			"Set \cdfraglimit\cu to 100+ to enable HD's elimination mode.\nIn co-op, a positive fraglimit under 100\nalso serves as a lives limit.",
			"Turn on \cdhd_pof\cu in co-op or teamplay for a one-life mode where\nyou can only be raised in the presence of all living teammates.",
			"Stay sharp! You can handle some bleeding, but if you don't keep up on your wounds they'll eventually get you.",
			"Turn on \cdhd_nobots\cu to cause the bots to be replaced by HD riflemen.",
			"To remote activate a switch or door,\ntype \cdderp 555\cu to stick a D.E.R.P. on to it,\nthen \cdderp 556\cu to make it flick the switch.",
			"Hold \cdZoom\cu and/or \cdUse\cu when you use the goggles to set the amplitude.\nBoth together decrements; \cdUse\cu alone increments.\n\cdZoom\cu alone toggles red/green mode.",
			"Check your corpses! Enemies follow the same rules you do, so check for incap with your fists or another round.",
			"Make sure to bind all of your keys! HD options has a menu specifically for it.",
            "Too dark for your tastes? Try out the light amplification goggles! Just make sure it's not pitch black.",
			"Make sure to keep your mags in check! You can use the mag manager to check up and refill them!",
			"Playing Dead can allow you to reach through tight corridors you otherwise wouldn't be able to fit in, becoming exponentially more useful the taller your player gets!",
			"You can set your airburst distance with the rangefinder!",
			"You can use \cdnetevent herphack\cu and \cdnetevent derphack\cu to \nhack nearby DERPs and HERPs!\n Use your controller and turn off your deployed robot, if you can, and then wait.",
			"If the mod feels to difficult, don't be afraid to turn down \cdhd_encumbrance\cu, \cdhd_damagefactor\cu or any of the difficulty options! You can view all of them in \cdHD Options\cu."
		};
		int newtip=random(0,specialtips.size()-1);
//		newtip=specialtips.size()-1;
		specialtip="\crTIP: \cu"..specialtips[newtip];
		specialtipalpha=1001.;
		A_Log(specialtip,true);
	}
}