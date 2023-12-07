module Public::ArtworksHelper
  def artwork_size_options
    options_for_select([
      ['Extra Small (16x16)', '16x16'],
      ['Small (32x32)', '32x32'],
      ['Medium (64x64)', '64x64'],
      ['Large (128x128)', '128x128'],
      ['Extra Large (256x256)', '256x256'],
    ])
  end
end
