class Interactivemap < ApplicationRecord

map = L.map('map').setView([51.505, -0.09], 13);

var tiles = L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoiYm95a2oiLCJhIjoiY2t6NjEwZDdhMG13bzJ5cHJ5c2xsbng3NSJ9.lGXEzSMuY3VGPCHJDI5xpg', {
	maxZoom: 18,
	attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, ' +
		'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
	id: 'mapbox/streets-v11',
	tileSize: 512,
	zoomOffset: -1
}).addTo(map);