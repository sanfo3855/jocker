include "console.iol"
include "string_utils.iol"
include "json_utils.iol"

include "../InterfaceAPI.iol"

outputPort DockerIn {
	Location: "socket://localhost:8009"
	Protocol: sodep
	Interfaces: InterfaceAPI
}

main {
	rq.id = "jounit-1";
	rq.force = true;
	println@Console("***** REMOVE " +rq.id+ " CONTAINER *****")();
	removeContainer@DockerIn(rq)(response);
	valueToPrettyString@StringUtils( response )( s );
	println@Console( s )()
}
