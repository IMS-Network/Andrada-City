Config = {}; // Don't touch

Config.ServerIP = "fivem.ims-network.net";

// Social media buttons on the left side
Config.Socials = [
    {name: "discord", label: "Discord", description: "Click here to copy the link and join our Discord server!", icon: "assets/media/icons/discord.svg", link: "https://discord.gg/AyeCaxrXTf"},
    {name: "twitter", label: "TWITTER", description: "Follow Us On Twiiter", icon: "assets/media/icons/twitter.svg", link: "https://www.twitter.com/network_ims"},
    {name: "instagram", label: "instagram", description: "Follow Us On Instagram", icon: "assets/media/icons/instagram.svg", link: "https://www.instagram.com/ims__network"},
    {name: "github", label: "github", description: "Find Our Open Source Code On GitHub", icon: "assets/media/icons/github.png", link: "https://www.github/ims-network"},
    {name: "reddit", label: "reddit", description: "Share Your Thoughts And Discus With Us On Our Reddit", icon: "assets/media/icons/reddit.svg", link: "https://www.reddit.com/r/IMS_Network/"},
    {name: "website", label: "Andrata City", description: "Player Portal", icon: "assets/media/icons/website.png", link: "https://fivem-web.ims-network.net"},
    {name: "website", label: "Website", description: "Main Website.", icon: "assets/media/icons/website.png", link: "https://www.ims-network.net"},
    {name: "shop", label: "Donations", description: "Get Cars, Battle Pass & VIP Access. Help Us Improve The Server!", icon: "assets/media/icons/donation.svg", link: "https://fivem-web.ims-network.net/shop"},
];

Config.HideoverlayKeybind = 112 // JS key code https://keycode.info
Config.CustomBindText = "F1"; // leave as "" if you don't want the bind text in html to be statically set

// Staff list
Config.Staff = [
    {name: "Meow", description: "Owner", color: "#ff0000", image: "https://cdn.discordapp.com/avatars/428995829383299083/493a4924e30c658deaa4ee5ca26de6f4.png?size=4096"},
    {name: "thefourCraft", description: "Project Lead", color: "#ff0000", image: ""},
    {name: "Tamir", description: "Developer", color: "#ff0000", image: ""},

];

// Rules List
Config.Rules = [
    {name: "1", label: "16+ Age Restriction", description: "You Agree That You Are Over 16 years Old, We place this age restriction to protect our community", icon: "assets/media/icons/16-plus.png", link: "#"},
    {name: "2", label: "Bugs/Cheats/Exploits/Server Damage", description: "Any Modifications Are Prohibited, in addition any use of bugs/exploits is not allowed!", icon: "assets/media/icons/virus.svg", link: "#"},
    {name: "3", label: "Roll Play Rules", description: "By Playing On The RP Server You Agree To Follow Our Rules, Set To Maintain A Positive Community - Click Here To Read More", icon: "assets/media/icons/law.png", link: "https://fivem-web.ims-network.net/rules"},
    {name: "4", label: "Copyrights", description: "All Credits To Script Developers. And Full Model List Can Be Found By Clicking Here", icon: "assets/media/icons/copyright.png", link: "https://fivem-web-copyrights.ims-network.net"},
    {name: "5", label: "Privicy Policy", description: "By Playing on Our Server You Agree To Our Privacy Policy, Click To Read More", icon: "assets/media/icons/privacy.svg", link: "https://legal.ims-network.net/privacy-policy.html"},
];

// Categories
Config.Categories = [
    {label: "Contact", default: true},
    {label: "Rules", default: false},
    {label: "Staff", default: false}
];

// Music
Config.Song = "song.wav";