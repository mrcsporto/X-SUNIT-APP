require "grape-swagger-rails"

module API
  module V1
    class Base < Grape::API
      mount API::V1::Survivors
      mount API::V1::Reports

      add_swagger_documentation(
        api_version: "v1",
        doc_version: '1.0.0',
        hide_documentation_path: false,
        mount_path: "/api/v1/documentation",
        hide_format: true,
        info: {
          title: 'X-Sunit API',
          description: 'Grape Api to Survivors from apocalypse',
          contact_name: "Marcos Porto",
          contact_email: "mrcsporto@gmail.com",
          contact_url: "https://github.com/mrcsporto/X-SUNIT-APP",
        },
      )
    end
  end
end

