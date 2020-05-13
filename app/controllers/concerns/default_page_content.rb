module DefaultPageContent
  extend ActiveSupport::Concern

  included do 
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "StoneTex Ltd | Concrete & Marble Floor Polishing"
    @seo_keywords = "StoneTex Ltd, Marble Floor Polishing, Concrete Floor Polishing, Marble Polishing Dublin, Natural Stone Restoration, Travertine Polishing, Polished Concrete Floors, Limestone Floor Polishing, Marble Floor Restoration, Marble Floor Cleaning"
  end 
end