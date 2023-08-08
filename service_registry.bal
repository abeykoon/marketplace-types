import ballerina/http;
import marketplace_types.config;

service /registry on new http:Listener(config:servicePort) {
    resource function get services(
        int 'limit = 20,
        int offset = 0,
        string sort = "name,ASC",   //Sort by ratings, created date, project
        string? query = (),
        string? tags = (),
        string? categories = (),
        string? networkVisibilityFilter = "all",
        string? projectId = ()) returns Service[]|     //Possible values are "all", "project", "org", "public", "saas"
                http:BadRequest|http:InternalServerError|http:Forbidden {
            return http:INTERNAL_SERVER_ERROR;
    }

    resource function get services/[string serviceId] () returns ServiceVersion
                |http:NotFound|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post services(@http:Payload ServiceRequest 'service) returns ServiceVersion
            |http:Conflict|http:BadRequest|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put services/[string serviceId](@http:Payload ServiceRequest 'service) returns ServiceVersion
            |http:BadRequest|http:NotFound|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function delete services/[string serviceId]() returns http:Ok
                |http:NotFound|http:InternalServerError|http:Forbidden {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function get services/tags () returns TagInfo[]|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function get services/categories () returns CategoryInfo[]|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function get services/[string serviceId]/idl () returns IDL
            |http:NotFoundError|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post services/[string serviceId]/idl (http:Request request) returns http:Created
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put services/[string serviceId]/idl(http:Request request) returns http:Ok
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post services/[string serviceId]/connection\-schemas(ConnectionSchemaInfo[] connectionSchema) returns http:Created
    |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put services/[string serviceId]/connection\-schemas/[string schemaId](ConnectionSchemaInfo connectionSchema) returns http:Created
    |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post services/[string serviceId]/icon(http:Request request) returns http:Ok
                |http:NotFound|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put services/[string serviceId]/icon(http:Request request) returns http:Ok
                |http:NotFound|http:InternalServerError {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post services/[string serviceId]/rating(@http:Payload RatingRequest rating) returns float {
        return 0;
    }

    resource function get services/[string serviceId]/attachments/[string attachmentId]() returns http:Response
            |http:InternalServerError|http:NotFound {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post services/[string serviceId]/attachments(http:Request request) returns AttachmentSummary[]
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function post services/[string serviceId]/attachments/[string attachmentId](http:Request request) returns AttachmentSummary[]
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function delete services/[string serviceId]/attachments/[string attachmentId]() returns http:Ok
            |http:InternalServerError|http:NotFound {
        return http:INTERNAL_SERVER_ERROR;
    }

    resource function put services/[string serviceId]/status(string status) returns http:Ok
            |http:InternalServerError|http:BadRequest {
        return http:INTERNAL_SERVER_ERROR;
    }
    
}
