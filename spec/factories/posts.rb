FactoryBot.define do
  factory :post do
    prefecture { "東京都" }
    cities { "千代田区" }
    body { "testtest" }
    user_id { "" }
    post_image_id { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/sky.jpg'), 'image/jpg')}
  end
end
