require 'pathname'

module ApplicationHelper
  def render_header
    original_url = request.original_url
    back = Pathname.new(original_url).parent.to_s
    render partial: 'shared/header', locals: {
      title: params[:controller].upcase,
      back: back
    }
  end


  def link2(*args, **kwargs)
    if block_given?
      link_to(*args, **kwargs) do
        "<code></code>"
      end
    else
      link_to(*args, **kwargs)
    end
  end

  def link(body, *args, **kwargs, &block)
    raise ArgumentError.new, '\'link\' method does not take a block' if block_given?

    link_to(*args, **kwargs) do
      content_tag(:div, class: 'link') do
        body
      end
    end
  end
end
