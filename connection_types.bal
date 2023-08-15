
// public type ConnectionMetadata record {
//     string name;
//     string description;
//     string schemaReference;
//     ConnectionVisibility visibility;
//     string serviceId;
// };

// public type ConnectionRequest record {
//     *ConnectionMetadata;
//     ConnectionConfiguration[] configurations;
// };

// public type Connection record {
//     string id;
//     *ConnectionRequest;
// };

// public type EnvConnection record {  //connection for a specific environment
//     string id;
//     *ConnectionMetadata;
//     ConnectionConfiguration configuration;
// };

// public type ConnectionConfiguration record {
//     string environmentName;
//     configKeyValuePair[] configuration;
// };

// public type configKeyValuePair record {
//     string key;
//     string value;
// };

// public enum ConnectionVisibility {
//     ORGANIZATION,
//     PROJECT,
//     COMPONENT
// };
