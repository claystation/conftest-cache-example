package main

import rego.v1

teams := http.send({
	"url": "http://localhost:8080/rego", 
	"method": "get",
	"raise_error": false,
	"cache": true,
	"force_cache": true,
	"force_cache_duration_seconds": 10
})

deny_is_twohundred contains msg if {
	teams.status_code == 200
	msg := "Statuscode is 200!"
}

deny_not_twohundred contains msg if {
	teams.status_code != 200
	msg := "Statuscode is NOT 200!"
}
