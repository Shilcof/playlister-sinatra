module Sluggable

    module Sluggable::InstanceMethods
        def slug
            name.downcase.gsub(" ","-")
        end
    end

    module Sluggable::ClassMethods
        def find_by_slug(slug)
            all.find{|a| a.slug == slug}
        end
    end

end