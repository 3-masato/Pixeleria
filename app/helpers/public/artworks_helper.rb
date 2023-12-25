module Public::ArtworksHelper
  def artwork_size_options
    sizes = [
      { key: 'xs', width: 8, height: 8 },
      { key: 'sm', width: 16, height: 16 },
      { key: 'md', width: 32, height: 32 },
      { key: 'lg', width: 64, height: 64 },
      { key: 'xl', width: 128, height: 128 }
    ]

    options_for_select(sizes.map do |size|
      size_name = t("artwork.sizes.#{size[:key]}")
      size_value = "#{size[:width]}x#{size[:height]}"
      ["#{size_name} (#{size_value})", size_value]
    end)
  end
end
