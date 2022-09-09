name 'Matto MC Loading Screen V2.0'
description 'A simple Bootstrap loading screen with customizable text and labels'
version '1.0.1'
url 'https://github.com/mattomc/MattoMCLoading'
author 'Matto MC#3158' 

files {
 'images/load_1.jpg',   
 'images/load_2.jpg',   
 'images/load_3.jpg',   
 'images/load_4.jpg',   
 'images/load_5.jpg',   
 'images/load_6.jpg',
 'index.html',
 'index.css',
}

loadscreen_manual_shutdown "yes"
client_script 'client.lua'

loadscreen 'index.html'

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
