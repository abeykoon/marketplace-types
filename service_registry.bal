import ballerina/http;
import marketplace_types.config;

service /service\-registry/v1 on new http:Listener(config:servicePort) {  //TODO: discuss api versioning
    resource function get resources/kind/services(
        int 'limit = 20,
        int offset = 0,
        string sort = "name,ASC",   //Sort by ratings, created date, project. All results are first sorted and then paginated.
        string? name = (),
        boolean searchIDL = false,
        string? tags = (),
        string? categories = (),
        string? networkVisibilityFilter = "org",  //Possible values are "all", "project", "org", "public",
        string? networkVisibilityprojectId = ()) returns ServiceResponse|
                http:BadRequest|http:InternalServerError|http:Forbidden {

            return http:INTERNAL_SERVER_ERROR;
    }

    resource function get resources(
        int 'limit = 20,
        int offset = 0,
        string sort = "name,ASC",
        string? name = (),
        boolean searchIDL = false,
        string? tags = (),
        string? categories = (),
        string? networkVisibilityFilter = "org",
        string? networkVisibilityprojectId = ()) returns ResourceResponse|
            http:BadRequest|http:InternalServerError|http:Forbidden {

            return http:INTERNAL_SERVER_ERROR;
    }

    resource function get resources/kind/services/[string serviceId] () returns Service
                |http:NotFound|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post resources/kind/services(@http:Payload ServiceRequest 'service) returns Service
            |http:Conflict|http:BadRequest|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put resources/kind/services/[string serviceId](@http:Payload ServiceRequest 'service) returns Service
            |http:BadRequest|http:NotFound|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function delete resources/kind/services/[string serviceId]() returns http:Ok
                |http:NotFound|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function get resources/kind/services/tags() returns TagInfo[]|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function get resources/kind/services/categories() returns CategoryInfo[]|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function get resources/kind/services/[string serviceId]/idl() returns IDL
            |http:NotFound|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post resources/kind/services/[string serviceId]/idl(http:Request request) returns http:Created
            |http:InternalServerError|http:BadRequest {   //IDL Type?
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put resources/kind/services/[string serviceId]/idl(http:Request request) returns http:Ok
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post resources/kind/services/[string serviceId]/connection\-schemas(ConnectionSchemaInfo[] connectionSchema) returns http:Created
    |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put resources/kind/services/[string serviceId]/connection\-schemas/[string schemaId](ConnectionSchemaInfo connectionSchema) returns http:Created
    |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post resources/kind/services/[string serviceId]/icon(http:Request request) returns http:Ok
                |http:NotFound|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put resources/kind/services/[string serviceId]/icon(http:Request request) returns http:Ok
                |http:NotFound|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post resources/kind/services/[string serviceId]/rating(int rating) returns float {
        return 0;
    }

    resource function get resources/kind/services/[string serviceId]/attachments/[string attachmentId]() returns http:Response
            |http:InternalServerError|http:NotFound {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post resources/kind/services/[string serviceId]/attachments(http:Request request) returns AttachmentSummary[]
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post resources/kind/services/[string serviceId]/attachments/[string attachmentId](http:Request request) returns AttachmentSummary[]
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function delete resources/kind/services/[string serviceId]/attachments/[string attachmentId]() returns http:Ok
            |http:InternalServerError|http:NotFound {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put resources/kind/services/[string serviceId]/status(string status) returns http:Ok
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function get resources/kind/services/[string serviceId]/connection\-schemas/[string connetionSchemaId]()
     returns ConnectionSchemaInfo|http:InternalServerError|http:NotFound {
        return http:INTERNAL_SERVER_ERROR;
    }

    //edit endpoint
    resource function post resources/kind/services/[string serviceId]/endpoints(Endpoint endpoint) returns http:Ok
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

}
