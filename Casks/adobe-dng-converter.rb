cask 'adobe-dng-converter' do
  if MacOS.version <= :mountain_lion
    version '9.5.1'
    sha256 '4465231586b5a55f7cf1b56843ec7fb30f73a0f9aff177d0e9a65e951796a348'
  elsif MacOS.version <= :mavericks
    version '9.6.1'
    sha256 '087eac5026667e4e6e3c156fd13243c9ea00f6c0238cbbb94d3099ae8772603f'
  else
    version '11.1'
    sha256 '24a9d5f570bc6ee2b59e504d0fcfad25f54f35eba34f7b8b51d702b7989eef1f'
  end

  url "https://download.adobe.com/pub/adobe/dng/mac/DNGConverter_#{version.dots_to_underscores}.dmg"
  name 'Adobe Camera Raw and DNG Converter'
  homepage 'https://supportdownloads.adobe.com/product.jsp?product=106&platform=Macintosh'

  pkg "DNGConverter_#{version.dots_to_underscores}.pkg"

  uninstall pkgutil: [
                       'com.adobe.CameraRawProfiles',
                       'com.adobe.DNGConverter',
                     ],
            quit:    'com.adobe.DNGConverter'
end
