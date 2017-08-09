include "console.iol"
include "string_utils.iol"
include "json_utils.iol"

include "../InterfaceAPI.iol"

outputPort DockerIn {
	Location: "socket://localhost:8008"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

main {
	println@Console("***** RETURN THE LIST OF ALL CONTAINER *****")();
	rq.filters.name = "test-joec-1";
  rq.filters.status = "exited";
	containers@DockerIn(rq)(response);
	valueToPrettyString@StringUtils(response)(s);
	println@Console( s )()
}
