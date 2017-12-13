module DataRequestDiffHelper
  def diff(content1, content2)
    Diffy::Diff.new(
      JSON.pretty_generate(content1),
      JSON.pretty_generate(content2),
      include_plus_and_minus_in_html: true,
      allow_empty_diff: false
    ).to_s(:html).html_safe
  end
end
