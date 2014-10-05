json.data JSON.parse(yield)
if @errors
  json.errors
end
if @warnings
  json.warnings
end
if paginated?
  json.total_count @total_count
  json.total_pages @total_pages
  json.current_page @page
end
