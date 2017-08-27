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
	rq.name = "jolielang/testdeployer";
	println@Console("***** INSPECT IMAGE "+ rq.name +" *****")();
	inspectImage@DockerIn(rq)(response);
	valueToPrettyString@StringUtils( response )( s );
	println@Console( s )()
}
