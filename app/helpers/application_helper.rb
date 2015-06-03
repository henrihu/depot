module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  def rand_string(numbers = 1)
    (0...numbers).map { (65 + rand(26)).chr }.join
  end
end
