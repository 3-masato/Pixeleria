require "chunky_png"
require_relative "../util/chalk"
module Seeds
  class Artworks
    TAG_NAMES = ["Landscape", "Portrait", "Abstract", "Modern", "Classical", "Surreal", "Minimal"]

    def self.create_tags
      TAG_NAMES.each do |name|
        Tag.find_or_create_by!(name: name)
        Chalk.info("Created Tag \"#{name}.\"")
      end
    end

    def self.create_artwork_canvases(user, count)
      # タグの初期作成
      create_tags

      count.times do |i|
        artwork = Artwork.create!(
          user_id: user.id,
          title: "Artwork Title #{i}",
          description: "Description for artwork #{i}",
          is_public: [true, false].sample
        )

        # 描画データの生成
        width, height = [[8, 8], [16, 16], [32, 32], [64, 64], [128, 128]].sample
        png = generate_pixel_data(width, height)
        file_path = Rails.root.join("tmp", "canvas_#{artwork.id}.png")
        png.save(file_path)

        # ArtworkCanvasの作成
        file = File.open(file_path, "rb")
        artwork.create_artwork_canvas(
          pixel_data: "Random pixel data for artwork #{artwork.id}",
          width: width,
          height: height
        )
        artwork.image.attach(io: file, filename: "canvas_#{artwork.id}.png", content_type: "image/png")
        file.close
        File.delete(file_path)

        # ランダムな数のタグをArtworkに関連付ける
        attach_random_tags(artwork)

        Chalk.info("Created Artwork \"#{artwork.title}\" by \"#{user.display_name}\"")
      end
    end

    private
    def self.generate_pixel_data(width, height)
      png = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)
      width.times do |x|
        height.times do |y|
          color = ChunkyPNG::Color.rgb(rand(255), rand(255), rand(255))
          png[x, y] = color
        end
      end
      png
    end

    def self.attach_random_tags(artwork)
      tags = Tag.all.sample(rand(0..5))
      tags.each { |tag| artwork.tags << tag }
    end
  end
end
