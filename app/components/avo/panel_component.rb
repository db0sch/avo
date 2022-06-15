# frozen_string_literal: true

class Avo::PanelComponent < ViewComponent::Base
  attr_reader :title
  attr_reader :classes

  renders_one :tools
  renders_one :body
  renders_one :bare_content
  renders_one :footer_tools
  renders_one :footer

  def initialize(title: nil, description: nil, body_classes: nil, data: {}, display_breadcrumbs: false, index: nil, classes: nil)
    @title = title
    @description = description
    @classes = classes
    @body_classes = body_classes
    @data = data
    @display_breadcrumbs = display_breadcrumbs
    @index = index
  end

  private

  def white_panel_classes
    "bg-white rounded shadow"
  end

  def data_attributes
    @data.merge({"panel-index": @index})
  end

  def display_breadcrumbs?
    @display_breadcrumbs == true && Avo.configuration.display_breadcrumbs == true
  end

  def description
    return @description if @description.present?

    ""
  end

  def render_header?
    @title.present? || description.present? || tools.present? || display_breadcrumbs?
  end

  def render_footer_tools?
    footer_tools.present?
  end
end
