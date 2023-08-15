// import ballerina/http;
// import marketplace_types.config;

// service /connection\-registry on new http:Listener(config:servicePort) {
//     resource function get organizations/[string orgId]/connections(string? networkVisibilityFilter = "org") returns Connection[]|
//             http:BadRequest|http:InternalServerError|http:Forbidden {
//         return http:INTERNAL_SERVER_ERROR;
//     }

//     resource function post organizations/[string orgId]/connections(@http:Payload ConnectionRequest 'connection) returns Connection|
//             http:Conflict | http:BadRequest | http:InternalServerError | http:Forbidden {
//         return http:INTERNAL_SERVER_ERROR;
//     }

//     resource function put organizations/[string orgId]/connections(@http:Payload ConnectionRequest 'connection) returns Connection|
//             http:Conflict|http:BadRequest|http:InternalServerError|http:Forbidden {
//         return http:INTERNAL_SERVER_ERROR;
//     }

//     resource function delete organizations/[string orgId]/connections/[string connectionId]() returns http:Ok
//                 |http:NotFound|http:InternalServerError|http:Forbidden {
//         return http:INTERNAL_SERVER_ERROR;
//     }

//     //get config of specific env
//     resource function get organizations/[string orgId]/connections/[string connectionId]/environments/[string environmentId]() returns EnvConnection|
//             http:BadRequest|http:InternalServerError|http:Forbidden {
//         return http:INTERNAL_SERVER_ERROR;
//     }
// }
