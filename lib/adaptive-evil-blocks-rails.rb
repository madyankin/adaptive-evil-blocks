module AdaptiveEvilBlocks
  # Add assets paths to standalone Sprockets environment.
  def self.install(sprockets)
    sprockets.append_path(Pathname(__FILE__).dirname)
  end

  if defined? ::Rails
    class Engine < ::Rails::Engine
      initializer 'adaptive-evil-blocks' do
        AdaptiveEvilBlocks.install(Rails.application.assets)
      end
    end
  end
end
