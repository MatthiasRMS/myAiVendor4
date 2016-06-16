ActionController::Parameters.send :define_method, :permitted_scalar? do |value|
  [String,
    Symbol,
    NilClass,
    Numeric,
    TrueClass,
    FalseClass,
    Date,
    Time,
    StringIO,
    IO,
    ActionDispatch::Http::UploadedFile,
    Rack::Test::UploadedFile,
    Hash,
    JSON,
    ].any? {|type| value.is_a?(type)}
end
