require 'chunky_png'
module Seeds
  class Artworks
    def self.create_artworks(user, count)
      count.times do |i|
        Artwork.create!(
          user_id: user.id,
          title: "Artwork Title #{i}",
          description: "Description for artwork #{i}",
          is_public: [true, false].sample
        )
      end
    end

    def self.create_artwork_canvases(user, count)
      create_artworks(user, count)

      Artwork.find_each do |artwork|
        # 描画データの生成
        width, height = [[8, 8], [16, 16], [32, 32], [64, 64], [128, 128]].sample
        png = generate_pixel_data(width, height)
        file_path = Rails.root.join('tmp', "canvas_#{artwork.id}.png")
        png.save(file_path)

        file = File.open(file_path, 'rb')
        artwork_canvas = ArtworkCanvas.create!(
          artwork_id: artwork.id,
          pixel_data: "Random pixel data for artwork #{artwork.id}",
          width: width,
          height: height
        )
        artwork.image.attach(io: file, filename: "canvas_#{artwork.id}.png", content_type: 'image/png')
        file.close
        File.delete(file_path)

        p "#{artwork.user.display_name}の作品「#{artwork.title}」を作成しました。"
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
  end
end
