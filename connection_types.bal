
public type Connection record {
    string id;
    string name;
    string description;
    string schemaReference;
    ConnectionVisibility visibility;
    string serviceId;
    ConnectionValueSet[] valueSets;
};

public type ConnectionValueSet record {
    string environmentName;
    string id;
    ConnectionValueEntry[] values;
};

public type ConnectionValueEntry record {
    string id;
    string key;
    string value;
};
