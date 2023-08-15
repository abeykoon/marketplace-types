
public type ServiceRequest record {|
    string name;
    string version;
    ServiceType 'type;
    Kind kind;
    string organizationId;
    string projectId?;
    string summary?;
    string description?;
    string[] tags?;
    string[] categories?;
    Visibility visibility;
    ConnectionSchemaInfo[] connectionSchemas;
|};

public type ServiceInfo record {|
    string id;
    string name;
    string version;
    ServiceStatus status;
    ServiceType 'type;
    string summary?;
    string description?;
    string[] tags?;
    string[] categories?;
    string thumbnailUrl;
    ConnectionSchema[] connectionSchemas;
    AttachmentSummary[] attachments?;
    float averageRating;
    string createdTime;
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

public enum Kind {
    CHOREO,
    THIRD_PARTY
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
