module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Activr Demo"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def bootstrap_class_for_flash_kind(kind)
    {
      :success => "alert-success",
      :error   => "alert-error",
      :alert   => "alert-block",
      :notice  => "alert-info",
    }[kind] || kind.to_s
  end

end
