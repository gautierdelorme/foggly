module ApplicationHelper
  def nav_link(name)
    content_tag :li, class: "nav-item #{'active' if controller_name == name.to_s}" do
      yield
    end
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Render::HTML.new link_attributes: { rel: 'nofollow', target: '_blank' }
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(
      markdown_renderer,
      autolink: true,
      fenced_code_blocks: true,
      space_after_headers: true,
      strikethrough: true
    )
  end

  def render_markdown(text)
    markdown.render(text).html_safe
  end
end
