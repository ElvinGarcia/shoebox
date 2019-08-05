module ApplicationHelper
    def current_uri
       @current_uri = request.env['PATH_INFO']        
    end

    # alternative to embeding for optimizing the display of SVG ing files
    def embedded_svg(filename, options = {})
        assets = Rails.application.assets
        file = assets.find_asset(filename).source.force_encoding("UTF-8")
        doc = Nokogiri::HTML::DocumentFragment.parse file
        svg = doc.at_css "svg"
        # if options[:class].present?
        # svg["class"] = options[:class]
        svg["class"] = "icons"
        # end
        raw doc
    end
  
end
