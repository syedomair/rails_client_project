module SampleApi
  class Config

    class_attribute :base_url, :api_key

    # Load yaml settings
    YAML.load_file("#{Rails.root}/config/sample_api.yml")[Rails.env].each do |key, value|
      self.send("#{key}=", value)
    end

    SampleApi::Base.base_uri base_url
  end
end
