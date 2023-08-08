public type ServiceRequest record {|
    string name;
    string version;
    ServiceType 'type;
    boolean isThirdparty;
    string summary?;
    string description?;
    string[] tags?;
    string[] categories?;
    ServiceVisibility visibility;
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
    ServiceVisibility visibility;
    ConnectionSchema[] connectionSchemas;
    AttachmentSummary[] attachments?;
    float averageRating;
    string createdTime;
|};

public type Service record {|
    ServiceVersion latestVersion;
    VersionMetadata[] versions;
|};

public type VersionMetadata record {|
    string version;
    string serviceId;
|};

public type ChoreoService record {|
    *ServiceInfo;
    ChoreoComponent component;
|};

public type ThirdPartyService record {|
    *ServiceInfo;
|};

public type ServiceVersion ChoreoService|ThirdPartyService;

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
|};

# Choreo component info of a marketplace resource.
#
# + componentName - Name of the Choreo component from which resource is published
# + componentId - ID of the Choreo component from which resource is published
public type ChoreoComponent record {|
    string componentName;
    readonly string componentId;
|};

# Choreo project info of a marketplace resource.
#
# + projectName - Name of the Choreo project
# + projectId - ID of the Choreo project
public type ChoreoProject record {|
    string projectName;
    readonly string projectId;
|};

# Represents a Choreo organization.
#
# + orgName - Name of the Choreo organization
# + orgId - ID of the Choreo organization
public type ChoreoOrg record {|
    string orgName;
    readonly string orgId;
|};

# Represents Interface Definition Language of an API resource.
#
# + id - ID of the IDL
# + serviceId - ID of the related service
# + content - Content of the IDL
# + idlType - Type of the IDL (i.e OpenAPI, SDL, WSDL etc)
public type IDL record {|
    string id;
    string serviceId;
    json content;
    IDLType idlType;
|};

public type Attachment record {|
    string id;
    string serviceId;
    string name;
    string mimeType;
    byte[] content;
|};

public type AttachmentSummary record {|
    string id;
    string name;
|};

# Types of Interface Definition Languages associated
# with APIs hosted and served in Marketplace.
public enum IDLType {
    AsyncAPI,  //TODO: capitalize
    OpenAPI,
    GraphQL,
    Proto3,
    Sdl,
    WSDL
}

public enum ServiceType {
    REST,
    SOAP,
    GRAPHQL,
    GRPC,
    ASYNC_API
}

public enum ServiceStatus {
    ACTIVE,
    INACTIVE,
    DEPRECATED
};

public enum ServiceCategory {   //could be loaded from a DB
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

# Structure of a request to add a rating for a resource in Choreo marketplace.
#
# + ratedBy - User who is rating the resource
# + rating - Rating value given by the user
public type RatingRequest record {|
    string ratedBy;
    int rating;
|};

public type ComponentVisibility record {|
    string visibility = "Component";
    string componentId;
|};

public type projectVisibility record {|
    string visibility = "Project";
    string projectId;
|};

public type OrgVisibility record {|
    string visibility = "Organization";
    string orgId;
|};

public type PublicVisibility record {|
    string visibility = "Public";
|};

# Defines marketplace visibility of services (who can discover).
public type ServiceVisibility OrgVisibility|projectVisibility|PublicVisibility;

public type ConnectionVisibility OrgVisibility|projectVisibility|ComponentVisibility;
