var PowerHour = {
			/**
			 * Offers the possibility to print a google map
			 *
			 * @param addresses Array	List of addresses
			 * @param travelmode enum	G_TRAVEL_MODE_WALKING or G_TRAVEL_MODE_DRIVING (Default: G_TRAVEL_MODE_WALKING)
			 * @param lang string		DIN code for the language (e.g. de, en, …)
			 */
			getPrintUrl : function(addresses, travelmode, lang)
			{
				// Set default values
				if(!travelmode) var travelmode = "G_TRAVEL_MODE_WALKING";
				if(!lang) var lang = "en";

				// Prepare URL
				var url = "http://maps.google.com/maps?f=d&source=s_d";
				
				// Add list of addresses to URL
				for(i = 0; i < addresses.length; i++)
				{
					if(i == 0)
					{
						url += "&saddr=";
					}
					else if(i == 1)
					{
						url += "&daddr=";
					}
					url += addresses[i].replace(' ', '+');
					if(i != addresses.length - 1 && i != 0)
					{
						url += "+to:";
					}
				}
				
				url += "&ie=UTF8&z=10&pw=2&hl=" + lang;
				// Set travel mode if necessary
				if(travelmode == "G_TRAVEL_MODE_WALKING")
					url += "&dirflg=w";
				
				// ready
				return url;
			}
};