module Jekyll
  class AssetsDirGenerator < Generator

    def self.priority
      :highest
    end

    def generate(site)
      static_assets_images_dir = site.config['static_assets_images_source']
      clean_static_assets_images_dir = clean_leading_trailing_forward_slash(static_assets_images_dir)
      all_raw_paths = Dir["#{static_assets_images_dir}/**/*"]
      all_raw_paths.each do |f|
        if File.file?(File.join(site.source, '/', f))
          filename = File.basename(f)
          site.static_files << AssetsDirAsset.new(site, site.source, clean_static_assets_images_dir, filename, collection = nil)
        end
      end
    end

  class AssetsDirAsset < StaticFile

    def initialize(site, base, dir, name, collection = nil)
      @site = site
      @base = base
      @dir  = dir
      @name = name
      @collection = collection
      @relative_path = File.join(*[@dir, @name].compact)
      @extname = File.extname(@name)
    end

    def write(dest)
      clean_static_assets_images_destination = clean_leading_trailing_forward_slash("#{@site.config['static_assets_images_destination']}")
      dest_path = "#{dest}/#{clean_static_assets_images_destination}/#{name}"
      return false if File.exist?(dest_path) && !modified?
      self.class.mtimes[path] = mtime
      FileUtils.mkdir_p(File.dirname(dest_path))
      FileUtils.rm(dest_path) if File.exist?(dest_path)
      copy_file(dest_path)
      true
    end
  end
end
end

def clean_leading_trailing_forward_slash(directory_string)
  directory_string.gsub(/^\/|\/$/, '')
end
