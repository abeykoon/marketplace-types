
public type ResourceRequest record{|
    string name;
    string version;
    ResourceType resourceType;
    string organizationId;
    string projectId?;
    string summary?;
    string description?;
    string[] tags?;
    Visibility visibility;
|};

public type Resource record {|
    string id;
    *ResourceRequest;
    string thumbnailUrl;
    float averageRating;
    string createdTime;
|};

public type ServiceRequest record {|
    *ResourceRequest;
    ServiceType serviceType;
    boolean isThirdParty;
    string[] categories?;
    ConnectionSchemaInfo[] connectionSchemas;
    Endpoint[] endpoints?;      //optional, as we get one after we deploy
|};

public type ServiceResponse record {|
    int count;
    record {
        int 'limit;
        int total;
        int offset;
        string next;
        string previous;
    } pagination;
    Service[] data;
|};

public type ServiceInfo record {|
    *Resource;
    ServiceStatus status;
    ServiceType 'type;
    string[] categories?;
    Endpoint[] endpoints?;
    ConnectionSchema[] connectionSchemas;
    AttachmentSummary[] attachments?;
|};

public type ChoreoService record {|
    *ServiceInfo;
    ChoreoComponent component;
|};

public type ThirdPartyService record {|
    *ServiceInfo;
|};

public type Service ChoreoService|ThirdPartyService;

public type ConnectionSchema record {|
    string id;
    *ConnectionSchemaInfo;
|};

public type ConnectionSchemaInfo record {|
    string name;
    string description;
    boolean isDefault;
    ConnectionSchemaEntry[] entries;
|};

public type ConnectionSchemaEntry record {|  //are these updated by the user after creation? At least keeping backward compatibility?
    string name;
    string 'type;
    string description?;
    boolean isSensitive = false;
    boolean isOptional = false;
|};

# Choreo component info of a marketplace resource.
#
# + componentName - Name of the Choreo component from which resource is published
# + componentId - ID of the Choreo component from which resource is published
public type ChoreoComponent record {|
    string componentName;
    readonly string componentId;
|};

# Represents Interface Definition Language of an API resource.
#
# + id - ID of the IDL
# + content - Content of the IDL
# + idlType - Type of the IDL (i.e OpenAPI, SDL, WSDL etc)
public type IDL record {|
    string id;
    json content;
    IDLType idlType;
|};

public type Attachment record {|
    string id;
    string name;
    string mimeType;
    byte[] content;
|};

public type AttachmentSummary record {|
    string id;
    string name;
|};

public type Endpoint record {|
    string url;
    string environment;
    string description?;
|};

# Represents a tag associated with a marketplace resource.
#
# + tag - Tag name
# + count - Number of resources having the tag
public type TagInfo record {|
    string tag;
    int count;
|};

# Represents a category (fixed set of groups) associated with a marketplace resource.
#
# + category - Category name
# + count - Number of resources having the category
public type CategoryInfo record {|
    string category;
    int count;
|};

public enum ResourceType {
    SERVICE
};

# Types of Interface Definition Languages associated
# with APIs hosted and served in Marketplace.
public enum IDLType {
    AsyncAPI,
    OpenAPI,
    GraphQL,
    Proto3,
    Sdl,
    WSDL
};

public enum ServiceType {
    REST,
    SOAP,
    GRAPHQL,
    GRPC,
    ASYNC_API
};

public enum ServiceStatus {
    PROTYPE,//Until deploy to production, definition can change
    PULISHED, //deployed to production
    DEPRECATED
};

public enum Visibility {
    PROJECT,
    ORGANIZATION,
    PUBLIC
};

public enum ServiceCategory { //could be loaded from a DB
    BUSINESS,
    COMMUNICATION,
    CLOUD,
    DATA,
    DEVICE,
    EDUCATION,
    ENTERTAINMENT,
    FINANCE,
    GAMES,
    GOVERNMENT,
    HEALTH,
    LIFESTYLE,
    LOCATION,
    MESSAGING,
    MUSIC,
    NEWS,
    PHOTOGRAPHY,
    SEARCH,
    SHOPPING,
    SOCIAL,
    SPORTS,
    TRAVEL,
    UTILITIES,
    WEATHER
};
